#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QAndroidJniEnvironment>
#include <QAndroidJniObject>
#include <QTimer>
#include <QThread>

class VibrateThread : public QThread
{
    Q_OBJECT
public:
    VibrateThread(QAndroidJniObject *service, QObject *parent): QThread(parent)
    {
        vibratorService = service;
    }

private:
    void run() override {
        jlong ms = 40;
        //jboolean hasvibro = vibratorService.callMethod<jboolean>("hasVibrator", "()Z");
        vibratorService->callMethod<void>("vibrate", "(J)V", ms);
        emit resultReady();
    }
signals:
    void resultReady();
private:
    QAndroidJniObject *vibratorService;
};

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
    void scroll_up(int level);
    void scroll_down(int level);

private:
    void wakeup_phone();
    long bytesToWrite;
    QTcpSocket client;
    int  writeLoop;
    int  debugCounter1;
    int isFirstTime;

    QObject  *root;
    QAndroidJniObject vibratorService;
    QAndroidJniObject pmService;
    QAndroidJniObject dpService;
    QAndroidJniObject m_wakeLock;
    QAndroidJniObject p_wakeLock;
    QAndroidJniObject resolver;
    QAndroidJniObject a_window;
    QAndroidJniObject w_wakeLock;
    VibrateThread *vib_thread;
    QTimer *timer;
    int tcpPort;
    bool isScreenOn;
};


#endif // TCPCLIENT_H
