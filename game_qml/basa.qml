// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "qml/game_menu_qml/controls"

Rectangle {
    id: rectangle1
    width: window.width
    height: window.height
    color: "white"
property int animationTime: 500
Image {
    anchors.fill: parent
    source: "qrc:/Image/bg.bmp"
    CustomLabel
    {
        id: labelStatistic
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height/18
        text: "STATISTIC"
        fontPixelSize: parent.width/10
        border.width: 0
        opacity: 1
        colorText:"yellow"

    }
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: window.height/10
        width: window.width/7*5
        height: window.height/7*4
        text: ""
        color:"yellow"
        font.pointSize: window.height/30
        anchors.centerIn: parent
        function findGreetings() {
            // Открытие базы данных ExampleDB
            var db = openDatabaseSync("Statistic","1.0","rating game",1000000);
            db.transaction(
                        function(tx) {
                            // Создание таблицы Greeting, если она еще не существовала
                            tx.executeSql('CREATE TABLE IF NOT EXISTS Results(Nickname TEXT, Time QREAL)');
                            // Получения всех строк из таблицы Greeting
                            var results = tx.executeSql('SELECT * FROM Results ORDER BY Time desc');
                            var r = ""
                            for(var i = 0; i < results.rows.length; i++)
                            {
                                r += (i+1) + ") " + results.rows.item(i).Nickname + ", " +
                                        results.rows.item(i).Time + " sec." + "\n"
                                if (i==9)
                                {
                                    break;
                                }
                            }
                            text = r
                            // Очистка таблицы Greeting
                            //tx.executeSql('DELETE FROM Results');
                        }
                        )
        }
        Component.onCompleted: findGreetings()
}
}

        CustomButton
        {
            id: backButton
            opacity: 0
            y: parent.height/7*6
            text: "BACK"
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea
            {
                anchors.fill: parent
                onClicked: window.returnMenu()

            }
////            Behavior on opacity { NumberAnimation {} }
        }
        SequentialAnimation
        {
            loops: Animation.Infinite
            running: true
            NumberAnimation { target: backButton; property: "opacity"; from: 0; to: 1.0; duration: animationTime*3 }
        }


}
