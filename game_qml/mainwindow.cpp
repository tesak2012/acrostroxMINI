#include "mainwindow.h"

#include "box.h"
MainWindow::MainWindow(QRect *rect,QWidget *parent)
    : QMainWindow(parent)
{

    this->setGeometry(*rect);

    speed=1;
    valueCounter=0;
    dv = new QDeclarativeView();
    cntx = dv->rootContext();
    cntx->setContextProperty("window",this);
    cntx->setContextProperty("speedBox",speed);
    cntx->setContextProperty("valueTime",valueTime);
    qmlRegisterType<Box>("BoxModel", 1, 0, "Box");

    dv->setSource(QUrl("qrc:/main.qml"));
    dv->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    setCentralWidget(dv);

    timerId=startTimer(5);

}

MainWindow::~MainWindow()
{
    
}

void MainWindow::game_over()
{
    QMessageBox msg;
    QString str="Your result is "+QString().number(valueTime);
    msg.setText(str);

    msg.exec();
    this->close();

}


void MainWindow::timerEvent(QTimerEvent *e)
{


    valueCounter+=5;
    valueTime=qreal(valueCounter)/1000;

    if(valueCounter%5000==0)
    {
    speed+=0.5;
    cntx->setContextProperty("speedBox",speed);
    }
    cntx->setContextProperty("valueTime",valueTime);
    QObject *ROOT=dv->rootObject();
    ////////////////
//    QObject* item=ROOT->findChild<QObject*>("aba");
//QVariant ab=items->property("speed");
//    QObject* item=ROOT->findChild<QObject*>("enemyBlockHigh")->property("speed");
//    QVariant ab=item->property("speed");
    if(ROOT->findChild<QObject*>("starShip")->property("speed")==-1)
    {
        speed==0;
        killTimer(timerId);
        game_over();
    }
    else if(ROOT->findChild<QObject*>("starShip")->property("speed")==-0.5)
        valueCounter-=5;
}

void MainWindow::keyPressEvent(QKeyEvent *key)
{
    if(key->KeyPress==Qt::Key_Escape)
        killTimer(timerId);
}


