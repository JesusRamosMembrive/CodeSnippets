// CustomListView.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Column {
    id: listViewContainer
    width: parent.width * 0.8
    height: parent.height

    property var customModel
    property var customButton

    Rectangle {
        width: parent.width *0.8
        height: customButton && customButton.checked ? customListView.contentHeight : 0
        color: customButton.checked ? "#f0f0f0" : "transparent"  // Cambia el color del fondo según el estado del botón
        border.color: "gray"
        border.width: 1
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 10

        ListView {
            id: customListView
            width: parent.width
            height: customButton && customButton.checked ? contentHeight : 0
            visible: customButton && customButton.checked
            clip: true

            model: customModel  // Utiliza el modelo pasado como propiedad
            delegate: ItemDelegate {
                width: parent.width
                height: 40
                Rectangle {
                    width: parent.width
                    height: parent.height
                    // Cambia este color según prefieras
                    border.color: "#00ff24"
                    border.width: 1
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#c1f6d2"
                        }

                        GradientStop {
                            position: 0.54825
                            color: "#aaffc5"
                        }

                        GradientStop {
                            position: 1
                            color: "#00ff52"
                        }

                        orientation: Gradient.Horizontal
                    }

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
                            loadFile(modelData)
                            // Agregar más acciones aquí si es necesario
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
