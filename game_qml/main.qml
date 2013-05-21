// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import BoxModel 1.0
import "qml/game_menu_qml/controls"

Rectangle {
    id: windowPage
    width: window.width
    height: window.height



    CustomLabel
    {
        id: labelStage
        objectName: "labelStage"
        text: "STAGE "+stage
        glowTime: 0
        z: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fontPixelSize: parent.height/17
        border.width: 0
        opacity: 0
        colorText:"yellow"

    }
    CustomLabel
    {
        id: labelPause
        objectName: "labelPause"
        text: "PAUSE"
        glowTime: 0
        z: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fontPixelSize: parent.height/17
        border.width: 0
        opacity: 0
        colorText:"yellow"

    }

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

        width: parent.width/9
        height: parent.height/9
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
        width: parent.width/6
        height:  parent.height/6
        z: 1
        //anchors.right: parent.right
        //anchors.top: parent.top
        name:"enemyBlockBigSecond"
        x: window.width-width-10
        y:10
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
        width: parent.width/4
        height:  parent.height/9
        z: 1

        name:"enemyBlockLong"
        x: window.width-width
        y: window.height-height
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
        width: parent.width/9
        height:  parent.height/6
        z: 1

        name:"enemyBlockHigh"
        x: 20
        y: window.height-height
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
        width: parent.width/10
        height: parent.height/8
        z: 1


        name:"starShip"
        objectName: "starShip"
        id:starShip
        x: window.width/2-width/2
        y: window.height/2-height/2
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
        onDoubleClicked:
        {
            window.PlayPause()
        }
    }
    Image {
            id: imageBackGround
            anchors.fill: parent
            source: "qrc:/Image/bg.bmp"
    }

    SequentialAnimation
    {
        loops: Animation.Infinite
        running: true
        NumberAnimation { target: labelStage; property: "opacity";from: 0; to: 1.0; duration: 200 }
        NumberAnimation { target: labelStage; property: "rotation";from: 0; to: 360; duration: 600 }
NumberAnimation { target: labelPause; property: "opacity";from: 0; to: 1.0; duration: 200 }
    }

}
