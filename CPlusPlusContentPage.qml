import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

import "./Modules/Utils"
import "./Modules/Style"

Item {
    id: fundamentosPage

    Column {
        id: mainLayout
        // anchors.fill: parent
        // anchors.centerIn: parent
        height: parent.height
        spacing: 15
        width: parent.width

        // Menu Bar
        MyMenuBar {
            id: menuBar
            width: parent.width
        }

        Row {
            id: mainContentRow
            Layout.fillHeight: true
            Layout.fillWidth: true
            height: parent.height - menuBar.height - mainLayout.spacing
            width: parent.width
            padding: 15
            spacing: 30

            Column {
                id: leftMainContent
                width: 250
                height: parent.height *0.92
                padding: 0

                MyGroupbox {
                    id: groupboxTopics
                    height: parent.height * 0.92
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
                        // anchors.fill: groupboxTopics

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
                height: mainLayout.height * 0.92
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
                    // anchors.fill: parent
                    // anchors.centerIn: parent
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

    Connections {
        target: fileProcessor
        function onExplanationChanged() {
            explanationText = fileProcessor.explanation;
        }
    }
}
