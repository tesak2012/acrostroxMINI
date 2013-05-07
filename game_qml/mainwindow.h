#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtGui/QMainWindow>
#include <QtDeclarative/QDeclarativeContext>
#include <QtDeclarative/QDeclarativeView>
#include "qdeclarative.h"
#include "block.h"
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

    void game_over();

private:
    int valueCounter;
    int timerId;

public slots:
     void timerEvent(QTimerEvent *e);
     void keyPressEvent(QKeyEvent *key);

};

#endif // MAINWINDOW_H
