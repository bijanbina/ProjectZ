#include <QCoreApplication>
#include <tcpserver.h>
#include <tcpclient.h>
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtAndroid>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main_ui.qml")));
    QObject *root = engine.rootObjects().first();

    //tcpServer *test_server = new tcpServer(5122);
    tcpClient *test_client = new tcpClient(5122, root);


    /*QAndroidJniObject activity = QAndroidJniObject::callStaticObjectMethod(
                "org/qtproject/qt5/android/QtNative", "activity", "()Landroid/app/Activity;");
    QAndroidJniObject appctx = activity.callObjectMethod(
                "getApplicationContext","()Landroid/content/Context;");

    QAndroidJniObject powerString = QAndroidJniObject::fromString("power");
    QAndroidJniObject pwake_tag = QAndroidJniObject::fromString( "Main Tag" );
    jint partialFlags = QAndroidJniObject::getStaticField<jint>("android/os/PowerManager","PARTIAL_WAKE_LOCK");
    QAndroidJniObject pmService = appctx.callObjectMethod(
                "getSystemService", "(Ljava/lang/String;)Ljava/lang/Object;",
                powerString.object<jstring>());
    QAndroidJniObject p_wakeLock = pmService.callObjectMethod("newWakeLock",
            "(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;",
            partialFlags,pwake_tag.object<jstring>());
    p_wakeLock.callMethod<void>("acquire", "()V");*/

    return app.exec();
}
