#include "mainwindow.h"
#include "box.h"
MainWindow::MainWindow(QRect *rect,QWidget *parent)
    : QMainWindow(parent)
{

    this->setGeometry(*rect);

    timerStageAnimation=new QTimer();
    dv = new QDeclarativeView();
    cntx = dv->rootContext();
    cntx->setContextProperty("window",this);
    //dv->setSource(QUrl("qrc:/main.qml"));
    //
    dv->setSource(QUrl("qrc:/qml/game_menu_qml/main.qml"));
    dv->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    setCentralWidget(dv);
    connect(timerStageAnimation,SIGNAL(timeout()),this,SLOT(timerStageAnimationEvent()));
    //dv->rootObject()->children().append();
    //timerId=startTimer(5);

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
    dv->setSource(QUrl("qrc:/qml/game_menu_qml/main.qml"));
    initialize();

}

bool MainWindow::initialize()
{
    running_stage=true;
    valueCounter=0;
    stage=0;
    speed=0.5;
}

qreal MainWindow::nextStage()
{
    dv->rootObject()->findChild<QObject*>("labelStage")->setProperty("z",10);
    timerStageAnimation->start(2000);
    stage++;
    cntx->setContextProperty("stage",stage);
    speed=stage*0.5;
    return stage;
}


void MainWindow::timerEvent(QTimerEvent *e)
{
    if(e->timerId()==timerId)
    {
        valueCounter+=5;
        valueTime=qreal(valueCounter)/1000;

        if(valueCounter%5000==0)
        {
            stage=nextStage();
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
            speed=0;
            killTimer(timerId);
            game_over();
        }
        else if(ROOT->findChild<QObject*>("starShip")->property("speed")==-0.5)
            valueCounter-=5;
    }
}

void MainWindow::keyPressEvent(QKeyEvent *key)
{
    if(key->key()==Qt::Key_Escape)
    {
        killTimer(timerId);
        speed=0;
        dv->rootObject()->findChild<QObject*>("starShip")->setProperty("speed",1);
        cntx->setContextProperty("speedBox",speed);
    }
    if(key->key()==Qt::Key_1)
    {
        dv->rootObject()->findChild<QObject*>("starShip")->setProperty("speed",0);
        timerId=startTimer(5);
        speed=stage*0.5;
        cntx->setContextProperty("speedBox",speed);
    }

}

void MainWindow::beginGame()
{
   // this->setGeometry(*rect);

    initialize();

    dv = new QDeclarativeView();
    cntx = dv->rootContext();
    cntx->setContextProperty("window",this);
    cntx->setContextProperty("speedBox",speed);
    cntx->setContextProperty("valueTime",valueTime);
    cntx->setContextProperty("stage",stage);

    qmlRegisterType<Box>("BoxModel", 1, 0, "Box");
    dv->setSource(QUrl("qrc:/main.qml"));
    dv->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    setCentralWidget(dv);

    timerId=startTimer(5);
    nextStage();

}

void MainWindow::timerStageAnimationEvent()
{
    timerStageAnimation->stop();
    dv->rootObject()->findChild<QObject*>("labelStage")->setProperty("z",0);
}


