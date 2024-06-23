import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

Column {
    id: mainLayout
    width: parent ? parent.width : 0
    height: parent ? parent.height : 0
    spacing: 5

    property bool showFileSystem: Settings.displayFileSystemView

    Binding {
        target: mainLayout
        property: "showFileSystem"
        value: Settings.displayFileSystemView
    }

    onShowFileSystemChanged: {
        function printBool() {
            console.log("showFileSystem:", showFileSystem)
        }
        printBool();
    }

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
            spacing: 15

            MyGroupbox {
                id: groupboxTopics
                height: parent.height
                width: parent.width
                Layout.fillWidth: true
                Layout.fillHeight: true


                Loader {
                    id: loader
                    width: groupboxTopics.width *0.95
                    height: groupboxTopics.height *0.97
                    anchors.horizontalCenter: parent.horizontalCenter

                    sourceComponent: showFileSystem? fileSystemComponent : scrollViewComponent

                    Component {
                        id: scrollViewComponent
                        ScrollViewTopics { }
                    }

                    Component {
                        id: fileSystemComponent
                        FileSystemView { }
                    }
                }
            }
            CustomRegularButton {
                id: switchToMainPageButton
                anchors.horizontalCenter: parent.horizontalCenter
                height: 60
                width: 150
                text: qsTr("Code")

                onClicked: {
                    if (stackView.depth === 1) {
                        stackView.push("CodeDisplayPage.qml")
                        switchToMainPageButton.text = qsTr("Explanation")
                    } else {
                        stackView.pop()
                        switchToMainPageButton.text = qsTr("Code")
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
