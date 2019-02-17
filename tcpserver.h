#ifndef TCPSERVER_H
#define TCPSERVER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>

class tcpServer : public QObject
{
    Q_OBJECT
public:
    tcpServer(int portnum);

public slots:
    void acceptConnection();
    void readyRead();
    void displayError(QAbstractSocket::SocketError socketError);

private:
    long bytesReceived;
    QTcpServer *server;
    QTcpSocket *connection_socket;
};

#endif // TCPSERVER_H
