import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Column {
    id: listViewContainer
    width: parent.width

    property var customModel
    property var customButton
    property string searchFilter: ""

    function filterModel() {
        filteredModel.clear();
        for (var i = 0; i < customModel.count; i++) {
            var item = customModel.get(i);
            if (item.name.toLowerCase().indexOf(searchFilter.toLowerCase()) !== -1) {
                filteredModel.append(item);
            }
        }
    }

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

            model: ListModel {
                id: filteredModel
            }

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
                        text: model.name
                        font.pixelSize: 16
                    }

                    MouseArea {
                        id: itemMouseArea
                        anchors.fill: parent
                        onClicked: {
                            console.log("Clicked on", model.name)
                            appWindow.loadFileContent(model.name)
                        }
                    }
                }
            }

            Component.onCompleted: filterModel()

            Connections {
                target: listViewContainer
                onSearchFilterChanged: filterModel()
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
