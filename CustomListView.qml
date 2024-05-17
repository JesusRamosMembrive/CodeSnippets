import QtQuick
import QtQuick.Controls
import "./Modules/ListsOfModels"
import "./Modules/Utils"

Column {
    id: listViewContainer
    width: parent.width

    property var customModel
    property var customButton

    Rectangle {
        width: parent.width
        height: customButton && customButton.checked ? customListView.contentHeight : 0
        color: customButton.checked ? "#f0f0f0" : "transparent"
        border.color: "gray"
        border.width: 1
        radius: 10

        ListView {
            id: customListView
            width: parent.width
            height: customButton && customButton.checked ? contentHeight : 0
            visible: customButton && customButton.checked
            clip: true

            model: customModel
            delegate: ItemDelegate {
                width: parent.width
                height: 40
                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "#ffffff"
                    border.color: "lightgray"
                    border.width: 1

                    Text {
                        anchors.centerIn: parent
                        text: modelData
                        font.pixelSize: 16
                    }

                    MouseArea {
                        id: itemMouseArea
                        anchors.fill: parent
                        onClicked: {
                            console.log("Clicked on", modelData)
                            loadFileContent(modelData)
                        }
                    }
                }
            }

            Behavior on height {
                NumberAnimation {
                    duration: 350
                    easing.type: Easing.OutExpo
                }
            }
        }

        Behavior on height {
            NumberAnimation {
                duration: 350
                easing.type: Easing.OutExpo
            }
        }
    }
}
