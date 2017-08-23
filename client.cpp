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

    QString dataFromSocket = socket->readAll();
    qDebug() << dataFromSocket;
    int pZoom, pArea, pPage;
    QByteArray oString = dataFromSocket.toLatin1();
    const char *pszString = oString.constData();
    sscanf(pszString,"zoom: %d area: %d gesture: %d",&pZoom,&pArea,&pPage);
    qDebug() << "Area: " << pArea;
    // ctr->currentPageHasChanged(3);

//    QObjectList list = root->children();
     QVariant retVal;
     QMetaObject::invokeMethod(root, "tcp_change",
        Q_RETURN_ARG(QVariant, retVal),
        Q_ARG(QVariant, pZoom),
        Q_ARG(QVariant, pArea),
        Q_ARG(QVariant, pPage));



}

QByteArray IntToArray(qint32 source) //Use qint32 to ensure that the number have 4 bytes
{
    //Avoid use of cast, this is the Qt way to serialize objects
    QByteArray temp;
    QDataStream data(&temp, QIODevice::ReadWrite);
    data << source;
    return temp;
}
