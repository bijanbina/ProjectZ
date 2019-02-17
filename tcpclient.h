#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QAndroidJniEnvironment>
#include <QAndroidJniObject>
#include <QTimer>

class tcpClient: public QObject
{
    Q_OBJECT
public:
    tcpClient(int portnum, QObject *ui);

public slots:
    void connected();
    void disconnected();
    void key_press(QString key_val);
    void key_release(QString key_val);
    void displayError(QAbstractSocket::SocketError socketError);
    void readyRead();
    void tcpConnect();
    void volume_change(int level);

private:
    long bytesToWrite;
    QTcpSocket client;
    int  writeLoop;
    int  debugCounter1;

    QObject  *root;
    QAndroidJniObject vibratorService;
    QAndroidJniObject pmService;
    QAndroidJniObject dpService;
    QAndroidJniObject m_wakeLock;
    QAndroidJniObject p_wakeLock;
    QAndroidJniObject resolver;
    QTimer *timer;
    int tcpPort;
};

#endif // TCPCLIENT_H
