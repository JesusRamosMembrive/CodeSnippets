import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import "./Modules/Style"

Rectangle {
    id: explanationDisplayPage
    width: parent.width
    height: parent.height
    Layout.fillHeight: true
    Layout.fillWidth: true
    radius: 15
    color: theme.backGroundCodeDisplayPageColor

    property Theme theme: Theme {}

    Column {
        id: columnExplanation
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        spacing: 10

        Text {
            text: "Explanation Area"
            wrapMode: Text.WrapAnywhere
            textFormat: Text.AutoText
            font.family: "Roboto"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 20
            color: theme.titleColor
        }

        Rectangle {
            height: parent.height *0.92
            color: theme.backGroundCodeArea
            radius: 20
            border.width: 2
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            border.color: theme.borderGroupBoxColor

            ScrollView {
                anchors.fill: parent

                TextArea {
                    id: textExplanationCode
                    wrapMode: Text.WordWrap
                    hoverEnabled: false
                    renderType: Text.QtRendering
                    textFormat: Text.MarkdownText
                    readOnly: true
                    text: explanationText
                    font.pointSize: 13
                    font.family: "Roboto"
                    placeholderText: qsTr("")
                    color: theme.letterToReadColor

                    background: Rectangle {
                        color: "transparent"
                        radius: 20
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        textExplanationCode.text = appWindow.explanationText;
    }


    Connections {
        target: fileProcessor
        function onFileSelected() {
            textExplanationCode.text = appWindow.explanationText;
        }
    }
}
