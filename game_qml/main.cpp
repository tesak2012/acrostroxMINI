#include <QtGui/QApplication>
#include "mainwindow.h"
#include "QDesktopWidget"
#include "qdeclarative.h"
#include "box.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);



    //int widthScreen=QApplication::desktop()->width();
    //int heightScreen=QApplication::desktop()->width();
    int widthScreen=350;
    int heightScreen=350;
    int centerScreenX=QApplication::desktop()->width()/2-widthScreen/2;
    int centerScreenY=QApplication::desktop()->height()/2-heightScreen/2;
     MainWindow w(new QRect(centerScreenX,centerScreenY,widthScreen,heightScreen));


      w.show();
    
    return a.exec();
}
