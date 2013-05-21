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
    dv->setSource(QUrl("qrc:/qml/game_menu_qml/main.qml"));
    dv->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    setCentralWidget(dv);
    connect(timerStageAnimation,SIGNAL(timeout()),this,SLOT(timerStageAnimationEvent()));

}



MainWindow::~MainWindow()
{
    
}

void MainWindow::game_over()
{
    QMessageBox msg;
    QString str="Your result is "+QString().number(valueTime);
    //msg.setText(str);
   // msg.exec();
    //dv->setSource(QUrl("qrc:/qml/game_menu_qml/main.qml"));
    //initialize();
    //QString str="Your time is "+QString().number(valueTime);
    dv = new QDeclarativeView;
    cntx = dv->rootContext();
    cntx->setContextProperty("memostr",str);
    cntx->setContextProperty("window",this);
    dv->setSource(QUrl("qrc:/qml/game_menu_qml/results.qml"));
    setCentralWidget(dv);
    dv->setResizeMode(QDeclarativeView::SizeRootObjectToView);



}

bool MainWindow::PlayPause()
{
    if(play==true)
    {
        play=false;
        killTimer(timerId);
        speed=0;
        dv->rootObject()->findChild<QObject*>("starShip")->setProperty("speed",1);
        cntx->setContextProperty("speedBox",speed);

        dv->rootObject()->findChild<QObject*>("labelPause")->setProperty("z",10);
    }
    else
    {
        dv->rootObject()->findChild<QObject*>("labelPause")->setProperty("z",0);
        play=true;
                dv->rootObject()->findChild<QObject*>("starShip")->setProperty("speed",0);
                timerId=startTimer(5);
                speed=stage*0.5;
                cntx->setContextProperty("speedBox",speed);
    }
    return play;
}

bool MainWindow::initialize()
{
    running_stage=true;
    valueCounter=0;
    stage=0;
    speed=0.5;
    return true;
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
    if(key->key()==Qt::Key_Space)
    {
        killTimer(timerId);
        speed=0;
        dv->rootObject()->findChild<QObject*>("starShip")->setProperty("speed",1);
        cntx->setContextProperty("speedBox",speed);

        dv->rootObject()->findChild<QObject*>("labelPause")->setProperty("z",10);
        play=false;
    }
    if(key->key()==Qt::Key_Escape)
    {
        speed=0;
         killTimer(timerId);
         cntx->setContextProperty("window",this);
         timerStageAnimation->stop();

         dv->setSource(QUrl("qrc:/qml/game_menu_qml/main.qml"));


    }
    if(key->key()==Qt::Key_1)
    {
        dv->rootObject()->findChild<QObject*>("labelPause")->setProperty("z",0);
play=true;
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
    play=true;
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


void MainWindow::beginBasa()
{
    dv = new QDeclarativeView();
    cntx = dv->rootContext();
    cntx->setContextProperty("window",this);
    dv->setSource(QUrl("qrc:/basa.qml"));
    dv->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    setCentralWidget(dv);
}

void MainWindow::beginResult()
{
    dv = new QDeclarativeView();
    cntx = dv->rootContext();
    cntx->setContextProperty("window",this);
    cntx->setContextProperty("valueTime",valueTime);
    dv->setSource(QUrl("qrc:/result.qml"));
    dv->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    setCentralWidget(dv);

}

void MainWindow::returnMenu()
{
    dv = new QDeclarativeView();
    cntx = dv->rootContext();
    cntx->setContextProperty("window",this);
    dv->setSource(QUrl("qrc:/qml/game_menu_qml/main.qml"));
    dv->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    setCentralWidget(dv);
}
