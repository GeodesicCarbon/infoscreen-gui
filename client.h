#include <QtCore>
#include <QtNetwork>
#include <QObjectList>
#include "qmlcontroler.h"

class Client : public QObject
{
    Q_OBJECT
public:
    explicit Client(QObject *parent = 0);

public slots:
    void connectToHost();
    void readData();
    void setQmlControler(QmlControler *ctrx);
    void setQObject(QObject *mememe);

private:
    QTcpSocket *socket;
    QmlControler *ctr;
    QObject *root;
};
