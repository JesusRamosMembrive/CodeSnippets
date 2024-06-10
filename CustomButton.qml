import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material


Control {
    id: customButton
    width: parent.width * 0.8
    height: 40
    font.family: "Roboto"
    anchors.horizontalCenter: parent.horizontalCenter

    property alias buttonText: buttonTextItem.text
    property color buttonTextColor: customButton.checked ? "#ffffff" : "#000000"
    property color startColor: "#ffffff"
    property color endColor: "#f0f0f0"
    property bool checked: false

    property color gradientStart: "#ffffff"
    property color gradientEnd: "#f0f0f0"
    property color hoverStartColor: gradientStart
    property color hoverEndColor: gradientEnd

    background: Rectangle {
        id: buttonBackground
        width: parent.width
        height: parent.height
        radius: 20
        gradient: Gradient {
            GradientStop { position: 0.0; color: customButton.hoverStartColor }
            GradientStop { position: 1.0; color: customButton.hoverEndColor }
        }

        HoverHandler {
            id: hoverHandler
            enabled: true
            cursorShape: Qt.PointingHandCursor
            onHoveredChanged: {
                hoverAnimation.running = false
                if (hovered) {
                    hoverAnimation.from = customButton.hoverStartColor
                    hoverAnimation.to = "goldenrod"
                    hoverAnimation.start()
                } else {
                    hoverAnimation.from = customButton.hoverStartColor
                    hoverAnimation.to = gradientStart
                    hoverAnimation.start()
                }
            }
        }

        ColorAnimation {
            id: hoverAnimation
            target: customButton
            property: "hoverStartColor"
            duration: 250
        }

        ColorAnimation {
            id: hoverEndAnimation
            target: customButton
            property: "hoverEndColor"
            duration: 250
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: buttonBackground
        onClicked: {
            customButton.checked = !customButton.checked
            customButton.clicked(); // Emitimos la señal clicked correctamente
        }
    }

    contentItem: Rectangle {
        anchors.fill: customButton
        color: "#00ffffff"
        radius: 20

        Text {
            id: buttonTextItem
            color: customButton.buttonTextColor
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAnywhere
            anchors.centerIn: parent
            font.pointSize: 12
            font.family: "Roboto"
            text: ""
        }
    }

    states: [
        State {
            name: "checked"
            when: customButton.checked
            PropertyChanges {
                target: customButton
                buttonTextColor: "#ffffff"
                gradientStart: "#4CAF50"
                gradientEnd: "#8BC34A"
                hoverStartColor: "#4CAF50"
                hoverEndColor: "#8BC34A"
            }
        },
        State {
            name: "unchecked"
            when: !customButton.checked
            PropertyChanges {
                target: customButton
                buttonTextColor: "#000000"
                gradientStart: "#ffffff"
                gradientEnd: "#f0f0f0"
                hoverStartColor: "#ffffff"
                hoverEndColor: "#f0f0f0"
            }
        }
    ]

    transitions: [
        Transition {
            from: "unchecked"
            to: "checked"
            ParallelAnimation {
                ColorAnimation {
                    target: customButton
                    property: "gradientStart"
                    to: "#4CAF50"
                    duration: 500
                }
                ColorAnimation {
                    target: customButton
                    property: "gradientEnd"
                    to: "#8BC34A"
                    duration: 500
                }
                ColorAnimation {
                    target: customButton
                    property: "buttonTextColor"
                    duration: 125
                }
            }
        },
        Transition {
            from: "checked"
            to: "unchecked"
            ParallelAnimation {
                ColorAnimation {
                    target: customButton
                    property: "gradientStart"
                    to: "#ffffff"
                    duration: 500
                }
                ColorAnimation {
                    target: customButton
                    property: "gradientEnd"
                    to: "#f0f0f0"
                    duration: 500
                }
                ColorAnimation {
                    target: customButton
                    property: "buttonTextColor"
                    duration: 125
                }
            }
        }
    ]

    signal clicked
}
