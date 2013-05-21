#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtGui/QMainWindow>
#include <QtDeclarative/QDeclarativeContext>
#include <QtDeclarative/QDeclarativeView>
#include "qdeclarative.h"
#include "QTimer"
#include "QMessageBox"
#include "QKeyEvent"

class MainWindow : public QMainWindow
{
    Q_OBJECT

    
public:
    MainWindow(QRect *rect,QWidget *parent = 0);
    ~MainWindow();

    QDeclarativeContext* cntx;
    QDeclarativeView* dv;
    qreal speed;
    qreal valueTime;
    bool play;
    void game_over();


private:
    int valueCounter;
    int timerId;
    int stage;
    bool initialize();
    qreal nextStage();
    bool running_stage;
    QTimer *timerStageAnimation;

public slots:
     bool PlayPause();
     void timerEvent(QTimerEvent *e);
     void keyPressEvent(QKeyEvent *key);
     void beginGame();
     void timerStageAnimationEvent();
     void beginBasa();
     void beginResult();
     void returnMenu();
};

#endif // MAINWINDOW_H
