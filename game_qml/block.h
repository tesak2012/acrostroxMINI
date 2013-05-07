#ifndef BLOCK_H
#define BLOCK_H
#include "QPoint"
#include "QObject"
class Block:QObject
{
    Q_OBJECT
public:
    Block(QObject *parent = 0);
    Block(int blockWidth,int blockHeight,int blockSpeed,int blockX,int blockY,QObject *parent = 0);
    int width;
    int height;
    int speed;
    int x;
    int y;
};

#endif // BLOCK_H
