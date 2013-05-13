// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import BoxModel 1.0

Rectangle {
    id: windowPage
    width: 350//window.width
    height: 350
    color: "#fdfdfd"
    //window.height

    Box
    {
        name:"wallLeft"
        id:wallLeft
        height: parent.height
        anchors.left: parent.left
    }
    Box
    {
        name:"wallTop"
        id:wallTop
        width: parent.width
        anchors.top: parent.top
    }
    Box
    {
        name:"wallRight"
        id:wallRight
        height: parent.height
        anchors.right: parent.right
    }
    Box
    {
        name:"wallBottom"
        id:wallBottom
        width: parent.width
        anchors.bottom: parent.bottom
    }

    Box
    {

        width: 40
        height: 40
        z: 1
        //anchors.left: parent.left
        //anchors.top: parent.top
        name:"enemyBlockBigFirst"
        x: 10
        y: 10
        objectName: "enemyBlockBigFirst"
        speed:speedBox
        Image {
                id: imageBlockBigFirst
                anchors.fill: parent
                source: "qrc:/Image/rock10000.png"
                }
    }
    Box
    {
        width: 60
        height: 60
        z: 1
        //anchors.right: parent.right
        //anchors.top: parent.top
        name:"enemyBlockBigSecond"
        x: 255//window.width-width-10
        y:25 //10
        objectName: "enemyBlockBigSecond"
        speed:speedBox
        Image {
                id: imageBlockBigSecond
                anchors.fill: parent
                source: "qrc:/Image/rock10000.png"
                }
    }
    Box
    {
        width: 80
        height: 40
        z: 1
        //anchors.right: parent.right
        //anchors.bottom: parent.bottom
        name:"enemyBlockLong"
        x: 230//window.width-width
        y: 300//window.height-height
         objectName: "enemyBlockLong"
        speed:speedBox
        Image {
                id: imageBlockLong
                anchors.fill: parent
                source: "qrc:/Image/rock10000.png"
                }
    }
    Box
    {
        width: 30
        height: 60
        z: 1
        //anchors.left: parent.left
        //anchors.bottom: parent.bottom
        name:"enemyBlockHigh"
        x: 17
        y: 239//window.height-height
        objectName: "enemyBlockHigh"
        speed:speedBox
        Image {
                id: imageBlockHigh
                anchors.fill: parent
                source: "qrc:/Image/rock10000.png"
                }
    }
    Box
    {
        width: 35
        height: 40
        z: 1

        //anchors.horizontalCenter: parent.horizontalCenter
        //anchors.verticalCenter: parent.verticalCenter
        name:"starShip"
        objectName: "starShip"
        id:starShip
        x: 158
        y: 158
        speed:0
        Image {
                id: imageShip
                objectName: "imageShip"
                anchors.fill: parent
                source: "qrc:/Image/ship01.png"
        }
    }

    MouseArea {
        id: mouse_areaWindow
        anchors.fill: parent

        onMousePositionChanged:
        {
            if(starShip.speed==0)
            starShip.x=mouseX-starShip.width/2;
            if(starShip.speed==0)
            starShip.y=mouseY-starShip.height/2;

        }
    }
    Image {
            id: imageBackGround
            anchors.fill: parent
            source: "qrc:/Image/bg.bmp"
    }



}
