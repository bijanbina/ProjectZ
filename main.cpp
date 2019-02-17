#include <QCoreApplication>
#include <tcpserver.h>
#include <tcpclient.h>
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main_ui.qml")));
    QObject *root = engine.rootObjects().first();

    //tcpServer *test_server = new tcpServer(5122);
    tcpClient *test_client = new tcpClient(5122, root);

    return app.exec();
}
