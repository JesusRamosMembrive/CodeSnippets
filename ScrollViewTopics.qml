import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "./Modules/ListsOfModels"
import "./Modules/Utils"

ScrollView {
    id: scrollViewTopics
    width: parent.width
    height: parent.height

    Column {
        id: columnTopics
        width: scrollViewTopics.width
        height: scrollViewTopics.height
        spacing: 10


        property alias buttonText: buttonTextItem.text

        Button {
            id: dataTypeButton
            width: columnTopics.width * 0.8
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            checkable: true

            property color buttonTextColor: dataTypeButton.checked ? "#ffffff" : "#000000"
            property color startColor: "#ffffff"
            property color endColor: "#f0f0f0"

            background: Rectangle {
                id: buttonBackground
                width: parent.width
                height: parent.height
                radius: 20
                gradient: Gradient {
                    GradientStop { position: 0.0; color: dataTypeButton.startColor }
                    GradientStop { position: 1.0; color: dataTypeButton.endColor }
                }
            }

            contentItem: Text {
                color: dataTypeButton.buttonTextColor
                text: "Variables & Data Types"
                anchors.centerIn: parent
                font.pointSize: 12
                font.family: "Roboto"
            }

            onCheckedChanged: {
                gradientAnimation.start()
            }

            states: [
                State {
                    name: "checked"
                    when: dataTypeButton.checked
                    PropertyChanges {
                        target: dataTypeButton
                        buttonTextColor: "#ffffff"
                        startColor: "#4CAF50"
                        endColor: "#8BC34A"
                    }
                },
                State {
                    name: "unchecked"
                    when: !dataTypeButton.checked
                    PropertyChanges {
                        target: dataTypeButton
                        buttonTextColor: "#000000"
                        startColor: "#ffffff"
                        endColor: "#f0f0f0"
                    }
                }
            ]

            transitions: [
                Transition {
                    from: "unchecked"
                    to: "checked"
                    ParallelAnimation  {
                        ColorAnimation {
                            target: dataTypeButton
                            property: "buttonTextColor"
                            duration: 150
                        }
                        ColorAnimation {
                            target: buttonBackground.gradient.stops[0]
                            property: "color"
                            to: "#4CAF50"
                            duration: 500
                        }
                        ColorAnimation {
                            target: buttonBackground.gradient.stops[1]
                            property: "color"
                            to: "#8BC34A"
                            duration: 500
                        }

                    }
                },
                Transition {
                    from: "checked"
                    to: "unchecked"
                    ParallelAnimation  {
                        ColorAnimation {
                            target: dataTypeButton
                            property: "buttonTextColor"
                            duration: 150
                        }
                        ColorAnimation {
                            target: buttonBackground.gradient.stops[0]
                            property: "color"
                            to: "#ffffff"
                            duration: 500
                        }
                        ColorAnimation {
                            target: buttonBackground.gradient.stops[1]
                            property: "color"
                            to: "#f0f0f0"
                            duration: 500
                        }

                    }
                }
            ]
        }

        ListView {
            id: dataTypeList
            width: parent.width
            height: dataTypeButton.checked ? contentHeight : 0
            visible: dataTypeButton.checked
            model: dataTypesModel.dataTypes  // Utiliza el modelo de dataTypesModel
            delegate: ItemDelegate {
                width: parent.width
                text: modelData
                font.pixelSize: 16
                onClicked: {
                    console.log("Clicked on", modelData)
                    loadFile(modelData)
                    // Agregar más acciones aquí si es necesario
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
}
