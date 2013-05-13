#ifndef BOX_H
#define BOX_H

#include <QDeclarativeItem>
#include "qdeclarative.h"
#include "QGraphicsSceneMouseEvent"
#include "QTimer"
#include "QObject"
#include "mainwindow.h"


class Box : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(QString name READ getName WRITE setName)
    Q_PROPERTY(qreal speed READ getSpeed WRITE setSpeed)



public:
    explicit Box(QDeclarativeItem *parent = 0);

    QString getName()const;
    void setName(const QString &text);
    qreal getSpeed()const;
    void setSpeed(const qreal &value);

    bool shipAnimation();


private:
    QString name;
    qreal speed;
    int timerId;
    qreal sina,cosa;
    QTimer *timerAnimation;
    QList<QString> *lstAnimation;
    int indexSprite;

    void setVectorMove();
    void collisionWithWall(QVariant item);

signals:


public slots:
    void timerEvent(QTimerEvent *e);
    void processing_collision(QDeclarativeItem *item);

    
};

#endif // BOX_H
