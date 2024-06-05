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
    spacing: 5

    Row {
        id: mainContentRow
        Layout.fillHeight: true
        Layout.fillWidth: true
        height: parent.height
        width: parent.width
        spacing: 5

        Column {
            id: leftMainContent
            width: 220
            height: parent.height
            topPadding: 0
            padding: 0
            spacing: 15

            MyGroupbox {
                id: groupboxTopics
                height: parent.height
                width: parent.width
                Layout.fillWidth: true
                Layout.fillHeight: true

                ScrollViewTopics {
                    id: scrollViewTopics
                    height: groupboxTopics.height * 0.98
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: groupboxTopics.width
                }
            }
            Button {
                id: buttonExplanation
                width: 150
                height: 55

                text: qsTr("Code")
                anchors.horizontalCenter: groupboxTopics.horizontalCenter
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
            color: theme.backGroundStackViewColor
            height: mainLayout.height
            width: mainLayout.width - leftMainContent.width
            radius: 15
            Layout.fillHeight: true
            Layout.fillWidth: true
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
