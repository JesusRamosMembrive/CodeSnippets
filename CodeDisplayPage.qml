import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import "./Components"

Item {
    Rectangle{
        anchors.fill: parent
        radius:15
        color: "black"
    }

    Column {
        id: columnCodeDisplay
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        spacing: 10


        Text {
            id: titleTopic
            width: columnCodeDisplay.width
            height: 30
            color: "#ffffff"
            text: qsTr("Topic")
            font.pixelSize: 28
        }

        Row {
            id: rowCode
            width: columnCodeDisplay.width
            height: columnCodeDisplay.height - 10 - titleTopic.height
            spacing: 25

            CustomTextArea {
                id: textAreaCode
                width: columnCodeDisplay.width * 0.85
                height: columnCodeDisplay.height * 0.8
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.topMargin: 20
            }

            FilesListView {
                id:filesListView
                width: columnCodeDisplay.width * 0.2
                height: columnCodeDisplay.height * 0.8
                anchors.left: textAreaCode.right
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.topMargin: 20
            }
        }
    }

    property alias textCode: textAreaCode.text
}
