import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "./Modules/ListsOfModels"
import "./Modules/Utils"

Button {
            id: custonButtomMenu
            width: parent.width * 0.8
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            checkable: true

            property alias buttonText: buttonTextItem.text
            property color buttonTextColor: custonButtomMenu.checked ? "#ffffff" : "#000000"
            property color startColor: "#ffffff"
            property color endColor: "#f0f0f0"

            background: Rectangle {
                id: buttonBackground
                width: parent.width
                height: parent.height
                radius: 20
                gradient: Gradient {
                    GradientStop { position: 0.0; color: custonButtomMenu.startColor }
                    GradientStop { position: 1.0; color: custonButtomMenu.endColor }
                }
            }

            contentItem: Text {
                id: buttonTextItem
                color: custonButtomMenu.buttonTextColor
                text: "Change for the correct"
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
                    when: custonButtomMenu.checked
                    PropertyChanges {
                        target: custonButtomMenu
                        buttonTextColor: "#ffffff"
                        startColor: "#4CAF50"
                        endColor: "#8BC34A"
                    }
                },
                State {
                    name: "unchecked"
                    when: !custonButtomMenu.checked
                    PropertyChanges {
                        target: custonButtomMenu
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
                            target: custonButtomMenu
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
                            target: custonButtomMenu
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
