import QtQuick
import QtQuick.Controls

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

    background: Rectangle {
        id: buttonBackground
        width: parent.width
        height: parent.height
        radius: 20
        gradient: Gradient {
            GradientStop { position: 0.0; color: customButton.startColor }
            GradientStop { position: 1.0; color: customButton.endColor }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: buttonBackground
        onClicked: {
            customButton.checked = !customButton.checked
        }
    }

    contentItem: Rectangle {
        anchors.fill: customButton
        color: "#00ffffff"
        radius: 20

        Text {
            id: buttonTextItem
            color: customButton.buttonTextColor
            anchors.centerIn: parent
            font.pointSize: 13
            font.family: "Roboto"
        }
    }

    states: [
        State {
            name: "checked"
            when: customButton.checked
            PropertyChanges {
                target: customButton
                buttonTextColor: "#ffffff"
                startColor: "#4CAF50"
                endColor: "#8BC34A"
            }
        },
        State {
            name: "unchecked"
            when: !customButton.checked
            PropertyChanges {
                target: customButton
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
            ParallelAnimation {
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
                ColorAnimation {
                    target: customButton
                    property: "buttonTextColor"
                    duration: 125
                }
            }
        }
    ]

}
