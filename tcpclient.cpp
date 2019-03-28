#include "tcpclient.h"
#include <QHostAddress>
#include <QQmlProperty>
#include <QtAndroid>
#include <QTest>

#define BUFFER_LEN 65535
char buffer[BUFFER_LEN];

tcpClient::tcpClient(int portnum, QObject *ui)
{
    root = ui;
    tcpPort = portnum;
    isScreenOn = true;
    QObject::connect(root, SIGNAL(keyPress(QString)), this, SLOT(key_press(QString)));
    QObject::connect(root, SIGNAL(keyRelease(QString)), this, SLOT(key_release(QString)));
    QObject::connect(root, SIGNAL(volumeChange(int)), this, SLOT(volume_change(int)));
    QObject::connect(root, SIGNAL(scrlUp(int)), this, SLOT(scroll_up(int)));
    QObject::connect(root, SIGNAL(scrlDown(int)), this, SLOT(scroll_down(int)));


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
    vib_thread = new VibrateThread(&vibratorService,this);

    //Wake Lock
    QAndroidJniObject powerString = QAndroidJniObject::fromString("power");
    QAndroidJniObject appctxx = activity.callObjectMethod(
                "getApplicationContext","()Landroid/content/Context;");
    pmService = appctxx.callObjectMethod(
                "getSystemService", "(Ljava/lang/String;)Ljava/lang/Object;",
                powerString.object<jstring>());

    jint dimFlags = QAndroidJniObject::getStaticField<jint>("android/os/PowerManager","SCREEN_DIM_WAKE_LOCK");
    jint partialFlags = QAndroidJniObject::getStaticField<jint>("android/os/PowerManager","PARTIAL_WAKE_LOCK");
    QAndroidJniObject tag = QAndroidJniObject::fromString( "ProjecyZ:MyTag" );
    QAndroidJniObject htag = QAndroidJniObject::fromString( "ProjecyZ:HalaTag" );
    m_wakeLock = pmService.callObjectMethod("newWakeLock",
            "(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;",
            dimFlags,tag.object<jstring>());
    p_wakeLock = pmService.callObjectMethod("newWakeLock",
            "(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;",
            partialFlags,htag.object<jstring>());

    resolver = appctx.callObjectMethod(
                "getContentResolver", "()Landroid/content/ContentResolver;");

    //Device Policy Manager
    QAndroidJniObject policyString = QAndroidJniObject::fromString("device_policy");
    dpService = appctx.callObjectMethod( "getSystemService",
                    "(Ljava/lang/String;)Ljava/lang/Object;", policyString.object<jstring>());

    //WakeUp
    jint FULL_WAKE_LOCK = QAndroidJniObject::getStaticField<jint>("android/os/PowerManager","FULL_WAKE_LOCK");
    jint ACQUIRE_CAUSES_WAKEUP = QAndroidJniObject::getStaticField<jint>("android/os/PowerManager","ACQUIRE_CAUSES_WAKEUP");
    jint ON_AFTER_RELEASE = QAndroidJniObject::getStaticField<jint>("android/os/PowerManager","ON_AFTER_RELEASE");
    QAndroidJniObject w_tag = QAndroidJniObject::fromString( "MyWakeLock" );
    w_wakeLock = pmService.callObjectMethod("newWakeLock", "(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;",
                            FULL_WAKE_LOCK | ACQUIRE_CAUSES_WAKEUP | ON_AFTER_RELEASE ,w_tag.object<jstring>());

    //KeyGaurd
    /*QAndroidJniObject keygaurdString = QAndroidJniObject::fromString("keyguard");
    QAndroidJniObject keygaurdTag = QAndroidJniObject::fromString("MyKeyguardLock");
    QAndroidJniObject km = appctx.callObjectMethod(
                "getSystemService", "(Ljava/lang/String;)Ljava/lang/Object;",
                keygaurdString.object<jstring>());
    QAndroidJniObject  kl = km.callObjectMethod("newKeyguardLock",
                                                       "(Ljava/lang/String;)Landroid/app/KeyguardManager$KeyguardLock;",
                                                       keygaurdTag.object<jstring>());
    kl.callMethod<void>("disableKeyguard", "()V");*/

    //AutoConnect
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(tcpConnect()));
    timer->setSingleShot(true);

    client.connectToHost(QHostAddress("192.168.88.25"), portnum);
    p_wakeLock.callMethod<void>("acquire", "()V");

    isFirstTime = 1;
    //timer->start(2000);
}

void tcpClient::key_press(QString key_val)
{
   if (client.isOpen())
   {

     key_val = "P<" + key_val + ">\n";
     bytesToWrite = client.write(key_val.toStdString().c_str(), key_val.length());
     //qDebug() << bytesToWrite;
     if (!(vib_thread->isRunning()))
        vib_thread->start();
     //vibrate
     //QtAndroid::runOnAndroidThread([&vibratorService]() {
     //});
     client.waitForBytesWritten();
   }
}

void tcpClient::key_release(QString key_val)
{
   if ( key_val == "Power")
   {
       //QAndroidJniObject javaControl;
       /*QtAndroid::runOnAndroidThread([&javaControl]()
       {
           //QTest::qSleep(4000);
           /*int FLAG_SHOW_WHEN_LOCKED = QAndroidJniObject::getStaticField<jint>(
                       "android/view/WindowManager$LayoutParams","FLAG_SHOW_WHEN_LOCKED");
           int FLAG_DISMISS_KEYGUARD = QAndroidJniObject::getStaticField<jint>(
                       "android/view/WindowManager$LayoutParams","FLAG_DISMISS_KEYGUARD");
           int FLAG_KEEP_SCREEN_ON = QAndroidJniObject::getStaticField<jint>(
                       "android/view/WindowManager$LayoutParams","FLAG_KEEP_SCREEN_ON");
           int FLAG_TURN_SCREEN_ON = QAndroidJniObject::getStaticField<jint>(
                       "android/view/WindowManager$LayoutParams","FLAG_TURN_SCREEN_ON");
           int FLAG_ALLOW_LOCK_WHILE_SCREEN_ON = QAndroidJniObject::getStaticField<jint>(
                       "android/view/WindowManager$LayoutParams","FLAG_ALLOW_LOCK_WHILE_SCREEN_ON");
           qDebug() << "MI6 Hello:" << (FLAG_SHOW_WHEN_LOCKED |
                       FLAG_DISMISS_KEYGUARD | FLAG_KEEP_SCREEN_ON |
                       FLAG_TURN_SCREEN_ON | FLAG_ALLOW_LOCK_WHILE_SCREEN_ON);
       });*/
       //QQmlProperty::write(root, "statusMSG", "Power pressed" );
       dpService.callMethod<void>("lockNow", "()V");
       isScreenOn = false;
       return;
   }
   else if( key_val == "ff13")  // pause/break
   {
       dpService.callMethod<void>("lockNow", "()V");
       isScreenOn = false;
       QTest::qSleep(8000);
       client.disconnectFromHost();
   }
   else if( key_val == "Scroll")
   {
       /*QAndroidJniObject javaControl;
       QtAndroid::runOnAndroidThread([&javaControl]()
       {
           int FLAG_FULL_SCREEN = QAndroidJniObject::getStaticField<jint>(
                       "android/view/WindowManager$LayoutParams","FLAG_FULLSCREEN");

           QAndroidJniObject activity = QtAndroid::androidActivity();
           QAndroidJniObject a_window = activity.callObjectMethod("getWindow", "()Landroid/view/Window;");
           if (a_window.isValid())
             qDebug() << "MI6 Hello:" << (FLAG_FULL_SCREEN);
           a_window.callMethod<void>("addFlags", "(I)V", FLAG_FULL_SCREEN);
       });*/
       //a_window.callObjectMethod("addFlags", "(I)V", FLAG_FULL_SCREEN);
   }
   if (client.isOpen())
   {
     key_val = "R<" + key_val + ">\n";
     bytesToWrite = client.write(key_val.toStdString().c_str(), key_val.length());
     client.waitForBytesWritten();
     if ( key_val == "R<Pause>\n")
     {
         m_wakeLock.callMethod<void>("release", "()V");
         dpService.callMethod<void>("lockNow", "()V");
     }
   }
}

void tcpClient::volume_change(int level)
{
   if (client.isOpen())
   {
     QString key_val = "S<" + QString::number(level) + ">\n"; //sound
     bytesToWrite = client.write(key_val.toStdString().c_str(), key_val.length());
     client.waitForBytesWritten();
   }
}

void tcpClient::scroll_up(int level)
{
   if (client.isOpen())
   {
     QString key_val = "U<" + QString::number(level) + ">\n";
     bytesToWrite = client.write(key_val.toStdString().c_str(), key_val.length());
     client.waitForBytesWritten();
   }
}

void tcpClient::scroll_down(int level)
{
   if (client.isOpen())
   {
     QString key_val = "D<" + QString::number(level) + ">\n";
     bytesToWrite = client.write(key_val.toStdString().c_str(), key_val.length());
     client.waitForBytesWritten();
   }
}

void tcpClient::tcpConnect()
{
    //qDebug() <<  "Try to connect ";
    client.connectToHost(QHostAddress("192.168.88.25"), tcpPort);
}

void tcpClient::readyRead()
{
   QString read_data = client.readAll();
   //qDebug() <<  "LAN: " << read_data;
   //client.write("ha ha we alive");
   if (read_data == "Unlock\n")
   {
       wakeup_phone();
   }

   QRegExp split_regex("(\\n)"); //RegEx for ' ' or ',' or '.' or ':' or '\t'
   QStringList Command_List = read_data.split(split_regex);
   for (int i = 0; i < Command_List.size()-1 ; i++ )
   {
       QString command =  Command_List[i] +'\n';
       if ( command[0] == 'T')
       {
           QString message = "";
           command.chop(2);
           command = command.remove(0, 2);

           message += command;
           QQmlProperty::write(root, "statusMSG", message);
       }
       else if ( command[0] == 'W')
       {
           QString message = "";
           command.chop(2);
           command = command.remove(0, 2);

           message += command;
           QQmlProperty::write(root, "statusWork", "Win" + message);
       }
       else if ( command[0] == 'V')
       {
           QString message = "";
           command.chop(2); //emove to last char
           command = command.remove(0, 2);

           message += command;
           if ( command == "On" )
           {
               QMetaObject::invokeMethod(root, "set_vpnon");
               isFirstTime = 0;
           }
           else if ( command == "Off" )
           {
               QMetaObject::invokeMethod(root, "set_vpnoff");
               isFirstTime = 0;
           }
           else if ( command == "Query" )
           {
               if ( !isFirstTime )
               {
                   bool vpn_status = QQmlProperty::read(root, "vpn_en").toBool();
                   if (vpn_status)
                   {
                       client.write("V<On>\n");
                   }
                   else
                   {
                       client.write("V<Off>\n");
                   }
               }
           }
       }
       else if ( command[0] == 'P' || command[0] == 'R' )
       {
           if ( command == "P<Settings>\n" )
           {
               //connection_socket->write("WoW!!!");
           }
           if ( command == "P<Scroll>\n" )
           {
               //connection_socket->write("Ha Ha Ha!!!");
           }

       }
       else
       {

       }
   }
}

void tcpClient::wakeup_phone()
{
    w_wakeLock.callMethod<void>("acquire", "()V");
    w_wakeLock.callMethod<void>("release", "()V");

}

void tcpClient::connected()
{
    QMetaObject::invokeMethod(root, "set_connected");
    //Lock Standby
    m_wakeLock.callMethod<void>("acquire", "()V");
    if (!isScreenOn)
    {
        wakeup_phone();
        isScreenOn = true;
    }

    if ( isFirstTime )
    {
        client.write("V<Query>\n");
    }
}

void tcpClient::disconnected()
{
    QMetaObject::invokeMethod(root, "set_disconnected");
    m_wakeLock.callMethod<void>("release", "()V");
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
}
