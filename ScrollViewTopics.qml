// ScrollViewTopics.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import "./Modules/ListsOfModels"
import "./Modules/Utils"

ScrollView {
    id: scrollViewTopics
    width: parent.width
    height: parent.height
    antialiasing: true
    font.family: "Roboto"

    Column {
        id: columnTopics
        width: scrollViewTopics.width
        height: scrollViewTopics.height
        topPadding: 5
        spacing: 10

        Label {
            color: "#ffffff"
            text: "Topics"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            font.family: "Roboto"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
            font.bold: true
        }

        TextField {
            id: textField
            width: columnTopics.width * 0.8
            height: 50
            horizontalAlignment: Text.AlignLeft
            font.family: "Roboto"
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Search a topic")
            onTextChanged: {
                appWindow.filterTopics(text);
            }
        }

        Rectangle {
            id: lineSeparatorTopics
            width: parent.width * 0.9
            height: 1  // Altura fina para el separador
            color: "white"  // Color blanco
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Repeater {
            anchors.horizontalCenter: parent.horizontalCenter
            model: appWindow.topicModels

            delegate: TopicSection {
                buttonText: modelData.label
                model: modelData.model
                searchFilter: textField.text
            }
        }
    }
}
