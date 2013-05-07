#include "box.h"

Box::Box(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
    timerId=startTimer(20);
    lstAnimation=new  QList<QString>();
    for(int i=1;i<=32;i++)
        lstAnimation->append("qrc:/Sprites/Image/Expolison/"+QString::number(i)+".png");
    indexSprite=0;
}

QString Box::getName() const
{
    return name;
}

void Box::setName(const QString &text)
{

    name=text;
    setVectorMove();
    setData(0,name);
}

qreal Box::getSpeed() const
{
    return speed;
}

void Box::setSpeed(const qreal &value)
{
    speed=value;
}

bool Box::shipAnimation()
{
    QObject* item=findChild<QObject*>("imageShip");
    QVariant a= item->property("source");
    item->setProperty("source",lstAnimation->at(indexSprite));
    indexSprite++;
    if(indexSprite<32)
    return true;
    else return false;
}


void Box::setVectorMove()
{
    if(name=="enemyBlockBigSecond")
    {
        sina=1;
        cosa=1;
    }
    else if(name=="enemyBlockBigFirst")
    {
        sina=-1;
        cosa=1;
    }
    else if(name=="enemyBlockLong")
    {
        sina=-1;
        cosa=-1;
    }
    else if(name=="enemyBlockHigh")
    {
        sina=1;
        cosa=-1;
    }
}

void Box::collisionWithWall(QVariant item)
{
    if(item=="wallBottom")
        cosa=cosa*(-1)+qrand()%50/100;
    else if(item=="wallRight")
        sina=sina*(-1)+qrand()%50/100;
    else if(item=="wallTop")
        cosa=cosa*(-1)+qrand()%50/100;
    else if(item=="wallLeft")
        sina=sina*(-1)+qrand()%50/100;

}

//MainWindow *Box::getwind() const
//{
//    return wind;
//}

//void Box::setwind(MainWindow &value)
//{
//    wind=&value;
//}

void Box::timerEvent(QTimerEvent *e)
{
    if(speed>=0)
    {
    setPos(x()+speed*sina,y()+speed*cosa);

    processing_collision(this);
}
    else
    {
        if(!shipAnimation())
           {
            killTimer(timerId);
            speed=-1;
        }

    }

}

void Box::processing_collision(QDeclarativeItem *item)
{
    QList<QGraphicsItem*> obstacle = collidingItems();
    for(int i=0;i<obstacle.count();i++)
    {
        if(item->data(0)=="starShip")
        {
            if(obstacle[i]->data(0).toString().contains("wall"))
            {

                speed=-0.5;
                killTimer(timerId);
                timerAnimation=new QTimer();
                timerId=startTimer(50);

                 //timerAnimation->start(500);
                // connect(timerAnimation,SIGNAL(timeout()),this,SLOT(shipAnimation()));


            }
            else if(obstacle[i]->data(0).toString().contains("enemy"))
            {

                speed=-0.5;
                killTimer(timerId);
                timerAnimation=new QTimer();
                timerId=startTimer(50);
            }
        }
        if(item->data(0).toString().contains("enemy"))
        {
            /*if(obstacle[i]->data(0)=="starShip")
                speed=0;
            else */if(obstacle[i]->data(0).toString().contains("wall"))
                collisionWithWall(obstacle[i]->data(0));
        }

    }


}




