// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "controls"
import BoxModel 1.0
import Qt.labs.particles 1.0


Rectangle
{
   // property int animationTime: 500

    id: screen
    width: 350
    height: 350
    color: "black"

        property int pixelSize: 30
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

        Column {
            id: column1

            y: parent.height
            width: 350
            height:350
            NumberAnimation on y { from: parent.height; to: -pixelSize*3 ; duration: 2000; loops: Animation.Infinite }

            CustomLabel {

                id: labelGameOver
                       // x: parent.width / 2 - width / 2
                        //y: parent.width / 4 - height / 2
                        width: 200
                        height: 66
                        text: "Game Over"
                        anchors.horizontalCenter: parent.horizontalCenter
                      //  anchors.verticalCenterOffset: -50
                        //anchors.horizontalCenter: parent.horizontalCenter
                       // anchors.verticalCenter: parent.verticalCenter
                        fontPixelSize: 36
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
                width: 210
                height: 54
                text:memostr
                anchors.horizontalCenter: parent.horizontalCenter
                fontPixelSize: 20
                border.width: 0
                colorText:"yellow"

            }

            //Text { id: text;font.pixelSize: pixelSize; color: screen.textColor; text: screen.text }
            //            Text { color: screen.textColor; font.pixelSize: pixelSize; text: screen.text ;styleColor: "#ee1818" }
            //            Text { font.pixelSize: pixelSize;color: screen.textColor; text: screen.text }
        }

//    Particles {
//                y: 350
//                x: 170
//                width: 1
//                height: 1
//                source: "qrc:/Image/images1.png"
//                lifeSpan: 5000
//                count: 1000
//                angle: 270
//                angleDeviation: 45
//                velocity: 50
//                velocityDeviation: 30

//                ParticleMotionGravity {
//                      yattractor: 1000
//                      xattractor: 0
//                      acceleration: 25
//                }

//          }







}




