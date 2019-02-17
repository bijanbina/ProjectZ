#include "tcpclient.h"
#include <QHostAddress>
#include <QQmlProperty>

#define BUFFER_LEN 65535
char buffer[BUFFER_LEN];

tcpClient::tcpClient(int portnum, QObject *ui)
{
    root = ui;
    tcpPort = portnum;
    QObject::connect(root, SIGNAL(keyPress(QString)), this, SLOT(key_press(QString)));
    QObject::connect(root, SIGNAL(keyRelease(QString)), this, SLOT(key_release(QString)));
    QObject::connect(root, SIGNAL(volumeChange(int)), this, SLOT(volume_change(int)));


    connect(&client, SIGNAL(connected()), this, SLOT(connected()));
    connect(&client, SIGNAL(disconnected()), this, SLOT(disconnected()));
    connect(&client, SIGNAL(error(QAbstractSocket::SocketError)),
            this, SLOT(displayError(QAbstractSocket::SocketError)));
    connect(&client, SIGNAL(readyRead()), this, SLOT(readyRead()));

    //vibrator
    QAndroidJniObject vibroString = QAndroidJniObject::fromString("vibrator");
    QAndroidJniObject activity = QAndroidJniObject::callStaticObjectMethod(
                "org/qtproject/qt5/android/QtNative", "activity", "()Landroid/app/Activity;");
    QAndroidJniObject appctx = activity.callObjectMethod(
                "getApplicationContext","()Landroid/content/Context;");
    vibratorService = appctx.callObjectMethod(
                "getSystemService", "(Ljava/lang/String;)Ljava/lang/Object;",
                vibroString.object<jstring>());

    QAndroidJniObject powerString = QAndroidJniObject::fromString("power");
    QAndroidJniObject appctxx = activity.callObjectMethod(
                "getApplicationContext","()Landroid/content/Context;");
    pmService = appctxx.callObjectMethod(
                "getSystemService", "(Ljava/lang/String;)Ljava/lang/Object;",
                powerString.object<jstring>());

    jint levelAndFlags = QAndroidJniObject::getStaticField<jint>("android/os/PowerManager","SCREEN_DIM_WAKE_LOCK");
    jint partialFlags = QAndroidJniObject::getStaticField<jint>("android/os/PowerManager","PARTIAL_WAKE_LOCK");
    QAndroidJniObject tag = QAndroidJniObject::fromString( "My Tag" );
    QAndroidJniObject htag = QAndroidJniObject::fromString( "Hala Tag" );
    m_wakeLock = pmService.callObjectMethod("newWakeLock",
            "(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;",
            levelAndFlags,tag.object<jstring>());
    p_wakeLock = pmService.callObjectMethod("newWakeLock",
            "(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;",
            partialFlags,htag.object<jstring>());

    resolver = appctx.callObjectMethod(
                "getContentResolver", "()Landroid/content/ContentResolver;");

    //Device Policy Manager
    QAndroidJniObject policyString = QAndroidJniObject::fromString("device_policy");
    dpService = appctxx.callObjectMethod( "getSystemService",
                    "(Ljava/lang/String;)Ljava/lang/Object;", policyString.object<jstring>());

    //AutoConnect
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(tcpConnect()));
    timer->setSingleShot(true);

    client.connectToHost(QHostAddress("192.168.88.25"), portnum);
}

void tcpClient::key_press(QString key_val)
{
   if (client.isOpen())
   {

     key_val = "P<" + key_val + ">\n";
     bytesToWrite = client.write(key_val.toStdString().c_str(), key_val.length());
     client.waitForBytesWritten();
     //qDebug() << bytesToWrite;

     //vibrate
     if (vibratorService.isValid())
     {
         jlong ms = 50;
         jboolean hasvibro = vibratorService.callMethod<jboolean>("hasVibrator", "()Z");
         vibratorService.callMethod<void>("vibrate", "(J)V", ms);
     }
     else
     {
         QQmlProperty::write(root, "statusMSG", "No Virate Service");
     }
   }
}

void tcpClient::key_release(QString key_val)
{
   if ( key_val == "Power")
   {
       QQmlProperty::write(root, "statusMSG", "Power pressed" );

       dpService.callMethod<void>("lockNow", "()V");
       return;
   }
   if (client.isOpen())
   {
     key_val = "R<" + key_val + ">\n";
     bytesToWrite = client.write(key_val.toStdString().c_str(), key_val.length());
     client.waitForBytesWritten();
     if ( key_val == "R<Pause>\n")
     {
         m_wakeLock.callMethod<void>("release", "()V");
         p_wakeLock.callMethod<void>("acquire", "()V");
         p_wakeLock.callMethod<void>("release", "()V");
         QQmlProperty::write(root, "statusMSG", "go to standby" );
     }

     /*QAndroidJniObject timeout_id = QAndroidJniObject::getStaticObjectField<jstring>(
                 "android/provider/Settings","SCREEN_OFF_TIMEOUT");
     jint timeout = 100;

     QAndroidJniObject defaultTurnOffTime =      QAndroidJniObject::callStaticObjectMethod( "android/provider/Settings", "getInt",
                                                                              "(Landroid/content/ContentResolver;Ljava/lang/String;I)I",
                                                                   resolver.object<jobject>(),timeout_id.object<jstring>(), timeout);
     QAndroidJniObject::callStaticObjectMethod( "android/provider/Settings", "putInt",
                            "(Landroid/content/ContentResolver;Ljava/lang/String;I)Z",
                 resolver.object<jobject>(),timeout_id.object<jstring>(), timeout);
     if (resolver.isValid())
     {
         QQmlProperty::write(root, "statusMSG", "Content Service" + defaultTurnOffTime.toString() );
     }
     else
     {
         QQmlProperty::write(root, "statusMSG", "No Sleep Service");
     }*/
   }
   /* //go to sleep
   if (pmService.isValid())
   {
       jlong ms = 50;
       pmService.callMethod<void>("goToSleep", "(J)V", ms);
       QQmlProperty::write(root, "statusMSG", "Available Power Service");
   }
   else
   {
       QQmlProperty::write(root, "statusMSG", "No Power Service");
   }*/
}

void tcpClient::volume_change(int level)
{
   if (client.isOpen())
   {
     QString key_val = "V<" + QString::number(level) + ">\n";
     bytesToWrite = client.write(key_val.toStdString().c_str(), key_val.length());
     client.waitForBytesWritten();
   }
}

void tcpClient::tcpConnect()
{
    client.connectToHost(QHostAddress("192.168.88.25"), tcpPort);
}

void tcpClient::readyRead()
{
   QString read_data = client.readAll();
   QQmlProperty::write(root, "statusMSG", "LAN: " + read_data);
}

void tcpClient::connected()
{
    //QQmlProperty::write(root, "stausMSG", "Connected - " + port.portName());
    QMetaObject::invokeMethod(root, "set_connected");

    //Lock Standby
    m_wakeLock.callMethod<void>("acquire", "()V");
    //QQmlProperty::write(root, "statusMSG",
    //                    "Locked device, can't go to standby anymore");
}

void tcpClient::disconnected()
{
    QMetaObject::invokeMethod(root, "set_disconnected");
    if ( !(timer->isActive()) )
    {
        timer->start(1000);
    }
}

void tcpClient::displayError(QAbstractSocket::SocketError socketError)
 {
     if (socketError == QTcpSocket::RemoteHostClosedError)
        return;

     qDebug() <<  QString(client.errorString());

     if ( !(timer->isActive()) )
     {
         timer->start(1000);
     }

     //exit(1);
}
