import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "./Modules/Style"

Rectangle {
    id: explanationDisplayPage
    width: parent.width
    height: parent.height
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
}
