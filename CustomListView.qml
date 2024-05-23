import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Column {
    id: listViewContainer
    width: parent.width
    spacing: 10

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
        id: rectangle
        width: parent.width * 0.9
        height: customButton && customButton.checked ? customListView.contentHeight : 0
        color: customButton.checked ? "#00000000" : "#00000000"
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "#00000000"

        ListView {
            id: customListView
            width: parent.width
            height: customButton && customButton.checked ? contentHeight : 0
            visible: customButton && customButton.checked
            layer.mipmap: false
            antialiasing: true
            anchors.horizontalCenter: parent.horizontalCenter
            clip: true

            model: ListModel {
                id: filteredModel
            }

            delegate: ItemDelegate {
                id: itemDelegate
                width: parent.width
                height: 40

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "#ffffff"
                    border.color: "#da000000"
                    border.width: 2
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#09203f"
                        }

                        GradientStop {
                            position: 1
                            color: "#537895"
                        }
                        orientation: Gradient.Horizontal
                    }
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        color: "#ffffff"
                        anchors.centerIn: parent
                        text: model.name
                        font.pixelSize: 14
                        font.family: "Roboto"
                    }

                    MouseArea {
                        id: itemMouseArea
                        anchors.fill: parent
                        onClicked: {
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
                duration: 150
                easing.type: Easing.InOutCubic
            }
        }
    }

    Behavior on height {
        NumberAnimation {
            duration: 150
            easing.type: Easing.InOutCubic
        }
    }
}
