import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Column {
    id: listViewContainer
    width: parent.width * 0.9
    spacing: 10

    property var customModel
    property var customButton
    property string searchFilter: ""

    ListModel {
        id: filteredModel
    }

    function filterModel() {
        filteredModel.clear();
        for (var i = 0; i < customModel.length; i++) {
            var item = customModel[i];
            if (item.name.toLowerCase().indexOf(searchFilter.toLowerCase()) !== -1) {
                filteredModel.append(item);
            }
        }
    }

    function resetHeight() {
        bgListViewButtons.height = 0;  // Forzar reset de altura
        bgListViewButtons.height = customListView.visible ? customListView.contentHeight : 0;
    }

    Rectangle {
        id: bgListViewButtons
        width: parent.width * 0.9

        height: 0  // Iniciar en 0 para forzar la animación desde el primer clic
        border.color: "#00ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#00000000"  // Fondo transparente para ayudar a depurar

        ListView {
            id: customListView
            width: parent.width
            height: customListView.visible ? contentHeight : 0
            visible: true
            clip: true

            model: filteredModel

            delegate: ItemDelegate {
                id: itemDelegate
                width: customListView.width
                height: 70
                font.pointSize: 12
                icon.color: "#00ffffff"
                antialiasing: true
                smooth: true
                enabled: true
                font.family: "Roboto"

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "#ffffff"
                    border.color: "#c42b3d5f"
                    border.width: 2
                    radius: 15
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#425774"
                        }

                        GradientStop {
                            position: 1
                            color: "#757c82"
                        }
                    }

                    Text {
                        color: "#ffffff"
                        width: parent.width
                        height: parent.height
                        text: model.name
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        wrapMode: Text.WordWrap
                        styleColor: "#00ffffff"
                        font.italic: false
                        textFormat: Text.RichText
                    }

                    MouseArea {
                        id: itemMouseArea
                        anchors.fill: parent
                        onClicked: {
                            appWindow.loadFileContent(model.name + ".txt")
                        }
                    }
                }
            }

            Component.onCompleted: {
                filterModel();
                // Ajustar la altura inicial para asegurarse de que la animación funcione desde el primer clic
                bgListViewButtons.height = customListView.visible ? customListView.contentHeight : 0;
            }

            onContentHeightChanged: {
                bgListViewButtons.height = contentHeight;
            }

            Connections {
                target: listViewContainer
                function onSearchFilterChanged() { filterModel(); }
            }
        }

        Behavior on height {
            PropertyAnimation {
                duration: 500
                easing.type: Easing.InOutCubic
            }
        }
    }

    Behavior on height {
        PropertyAnimation {
            duration: 500
            easing.type: Easing.InOutCubic
        }
    }
}
