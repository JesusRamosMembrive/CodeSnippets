import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import "./Modules/ListsOfModels"
import "./Modules/Utils"

Rectangle {
                id: titleBar
                Layout.fillWidth: true
                Layout.preferredHeight: 45
                color: "#dd000000"
                opacity: 0.5

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onPressed: {
                        appWindow.startSystemMove()
                    }
                }

                // Botón de maximizar
                Button {
                    id: maximizeButton
                    width: 70
                    height: 45
                    anchors.top: parent.top
                    anchors.right: closeButton.left
                    text: "+"
                    onClicked: {
                        if (appWindow.visibility === Window.Maximized) {
                            appWindow.visibility = Window.Windowed
                        } else {
                            appWindow.visibility = Window.Maximized
                        }
                    }
                    background: Rectangle {
                        color: "#00ff00"
                        radius: 20
                    }
                }

                // Botón de cierre
                Button {
                    id: closeButton
                    width: 70
                    height: 45
                    anchors.top: parent.top
                    anchors.right: parent.right
                    text: "X"
                    onClicked: {
                        messageDialog.open()
                    }
                    background: Rectangle {
                        id: bgCloseButton
                        color: "#ff0000"
                        radius: 20
                    }
                }
            }
