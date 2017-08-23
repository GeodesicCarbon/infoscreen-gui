#include "client.h"

static inline QByteArray IntToArray(qint32 source);

Client::Client(QObject *parent) : QObject(parent)
{
    socket = new QTcpSocket(this);
}

void Client::connectToHost()
{
    socket->connectToHost("localhost", 2259);
    //    connect(socket, SIGNAL(connected()),this, SLOT(connected()));
    connect(socket, SIGNAL(readyRead()),this, SLOT(readData()));
}

void Client::setQmlControler(QmlControler *ctrx)
{
    ctr = ctrx;
}

void Client::setQObject(QObject *mememe)
{
    root=mememe;
}

void Client::readData()
{
    qDebug() << "reading...";
    // read the data from the socket
    // emit
    qDebug() << socket->readAll();
    // ctr->currentPageHasChanged(3);

//    QObjectList list = root->children();
     QVariant returnedValue;
     QVariant msg = "Hello from C++";
     QMetaObject::invokeMethod(root, "tcp_change");
}

QByteArray IntToArray(qint32 source) //Use qint32 to ensure that the number have 4 bytes
{
    //Avoid use of cast, this is the Qt way to serialize objects
    QByteArray temp;
    QDataStream data(&temp, QIODevice::ReadWrite);
    data << source;
    return temp;
}
