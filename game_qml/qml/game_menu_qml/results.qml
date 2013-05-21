// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "controls"



Rectangle
{
   // property int animationTime: 500

    id: screen
    width: window.width
    height: window.height
    color: "black"

        property int pixelSize: window.height/10
        property color textColor: "red"
    property string text: memostr

    Image
    {
        id: background
        opacity: 1
        anchors.fill: parent

        source: "qrc:/Image/bg.bmp"

        fillMode: Image.Stretch;
        smooth: true


    }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
                window.beginResult()

        }

        Column {
            id: column1

            y: parent.height
            width: parent.width//window.width
            height:parent.height//window.height
            NumberAnimation on y { from: parent.height; to: -pixelSize*6 ; duration: 3000; loops: Animation.Infinite }

            CustomLabel {

                id: labelGameOver
                       // x: parent.width / 2 - width / 2
                        //y: parent.width / 4 - height / 2
                        width: parent.width/2
                        height: parent.height/6
                        text: "Game Over"
                        anchors.horizontalCenter: parent.horizontalCenter
                      //  anchors.verticalCenterOffset: -50
                        //anchors.horizontalCenter: parent.horizontalCenter
                       // anchors.verticalCenter: parent.verticalCenter
                        fontPixelSize: pixelSize
                        border.width: 0
                        opacity: 1
                        colorText:"yellow"

//                        states: State {
//                                       name: "down"; when: screen.width==350
//                                       PropertyChanges { target:labelGameName1; y: -10; rotation: 0;width:70;height:5;color:"red" }
//                                  }

//                                  transitions: Transition {
//                                       from: ""; to: "down"; reversible: true
//                                       ParallelAnimation {
//                                             NumberAnimation { properties: "y,rotation,width,height"; duration: 2000; easing.type: Easing.Linear }

//                                       }
//                                   }
                        SequentialAnimation
                        {
                            loops: Animation.Infinite
                            running: true
                            NumberAnimation {target:labelGameOver;  properties: "width";from:10;to:200; duration: 2000; }
                        }
            }
            CustomLabel {
                id: customlabel1
                width: parent.width/2
                height: parent.height/6
                text:memostr
                anchors.horizontalCenter: parent.horizontalCenter
                fontPixelSize: pixelSize/5*3
                border.width: 0
                colorText:"yellow"

            }
            CustomLabel {
                id: labelGameOver_two
                       // x: parent.width / 2 - width / 2
                        //y: parent.width / 4 - height / 2
                width: parent.width/2
                height: parent.height/6
                        text: "Game Over"
                        anchors.horizontalCenter: parent.horizontalCenter
                      //  anchors.verticalCenterOffset: -50
                        //anchors.horizontalCenter: parent.horizontalCenter
                       // anchors.verticalCenter: parent.verticalCenter
                        fontPixelSize: pixelSize
                        border.width: 0
                        opacity: 1
                        colorText:"yellow"
                        SequentialAnimation
                        {
                            loops: Animation.Infinite
                            running: true
                            NumberAnimation {target:labelGameOver_two;  properties: "width";from:10;to:200; duration: 2000; }

                        }
            }

        }

}




