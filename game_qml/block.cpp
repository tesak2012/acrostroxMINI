#include "block.h"

Block::Block(int blockWidth,int blockHeight,int blockSpeed,int blockX,int blockY,QObject *parent) :
    QObject(parent)
{
    width=blockWidth;
    height=blockHeight;
    speed=blockSpeed;
   x=blockX;
   y=blockY;
}

Block::Block(QObject *parent)
{
}
