import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Effects
import QtQuick.Dialogs


Column {
    id: mainLayout
    width: parent.width
    height: parent.height
    spacing: 15

    Row {
        id: mainContentRow
        Layout.fillHeight: true
        Layout.fillWidth: true
        height: parent.height
        width: parent.width
        padding: 15
        spacing: 30

        Column {
            id: leftMainContent
            width: 250
            height: parent.height
            padding: 0

            MyGroupbox {
                id: groupboxTopics
                height: parent.height
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.topMargin: 0

                ScrollViewTopics {
                    id: scrollViewTopics
                    height: groupboxTopics.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: groupboxTopics.width
                }
            }

            Button {
                id: buttonExplanation
                width: 150
                height: 55
                text: qsTr("Code")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: groupboxTopics.bottom
                anchors.topMargin: 20
                highlighted: false
                flat: false
                antialiasing: true
                onClicked: {
                    if (stackView.depth === 1) {
                        stackView.push("CodeDisplayPage.qml")
                        buttonExplanation.text = qsTr("Explanation")
                    } else {
                        stackView.pop()
                        buttonExplanation.text = qsTr("Code")
                    }
                }
            }
        }

        Rectangle {
            id: backGroundStackView
            height: mainLayout.height
            color: theme.backGroundStackViewColor
            radius: 15
            anchors.left: leftMainContent.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: 5
            anchors.rightMargin: 10
            anchors.topMargin: 0
            StackView {
                id: stackView
                initialItem: "ExplanationPage.qml"
                width: parent.width
                height: parent.height

                pushEnter: Transition {
                    PropertyAnimation { property: "x"; from: stackView.height; to: 0; duration: 400; easing.type: Easing.InOutQuad }
                    PropertyAnimation { property: "opacity"; from: 0; to: 1; duration: 400; easing.type: Easing.InOutQuad }
                }
            }
        }
    }
}
