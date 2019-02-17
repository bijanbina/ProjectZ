#include "tcpserver.h"
#include <qdebug.h>

tcpServer::tcpServer(int portnum)
{
    server = new QTcpServer;
    server->listen(QHostAddress("127.0.0.1"),portnum);
    qDebug() << "Program Started";
    connect(server, SIGNAL(newConnection()),
                  this, SLOT(acceptConnection()));
}

void tcpServer::acceptConnection()
{
    connection_socket = server->nextPendingConnection();
    connect(connection_socket, SIGNAL(readyRead()),
            this, SLOT(readyRead()));
    connect(connection_socket, SIGNAL(error(QAbstractSocket::SocketError)),
            this, SLOT(displayError(QAbstractSocket::SocketError)));

    qDebug() << "Accepted connection";
}

void tcpServer::readyRead()
{
    bytesReceived += (int)connection_socket->bytesAvailable();
    connection_socket->readAll();
    if (bytesReceived >= 1200 * 1920 * 3)
    {
        qDebug() << QString("Ack, Receive Byte: %1").arg(bytesReceived);
        connection_socket->write("a",1);
        connection_socket->waitForBytesWritten();
        bytesReceived = 0;
    }
}

void tcpServer::displayError(QAbstractSocket::SocketError socketError)
 {
     if (socketError == QTcpSocket::RemoteHostClosedError)
         return;

     qDebug() <<  QString("Error Happened");

 }
