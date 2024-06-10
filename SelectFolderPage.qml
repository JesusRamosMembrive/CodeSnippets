import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: selectFoldePageItem
    width: 800
    height: 600
    color: "#00ffffff"

    Rectangle{
        id: bgFolderPage
        color: "#161616"
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        radius: 15
    }

    Column{
        id: column
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        padding: 10
        spacing: 10

        Text {
            id: textTitleWindow
            width: 275
            height: 50
            color: "#ffffff"
            text: qsTr("Setup the paths")
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Bold"
            font.family: "Roboto"
        }

        Rectangle {
            id: separatorLine
            width: parent.width *0.9
            height: 2
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: textCPlusPlusSubTitle
            width: 80
            height: 45
            color: "#ffffff"
            text: qsTr("C++")
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Bold"
            font.family: "Roboto"
        }

        Grid {
            id: gridCPlusPlus
            width: 750
            height: 150
            anchors.horizontalCenterOffset: 5
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            rows: 3
            columns: 3
            Text {
                id: cPlusPlus
                height: 35
                color: "#ffffff"
                text: qsTr("Plain")
                font.pixelSize: 25
                font.family: "Roboto"
            }

            TextField {
                id: textFieldCPlusPlus
                width: parent.width*0.7
                height: 40
                font.family: "Roboto"
                placeholderText: qsTr("Text Field")
            }
            Button {
                id: buttonBrowseCPlusPlus
                width: 104
                height: 40
                text: qsTr("Browse")
            }

            Text {
                id: cPlusPlusQt
                height: 35
                color: "#ffffff"
                text: qsTr("Qt")
                font.pixelSize: 25
                font.family: "Roboto"
            }
            TextField {
                id: textFieldCPlusPlusQt
                width: parent.width*0.7
                height: 40
                font.family: "Roboto"
                placeholderText: qsTr("Text Field")
            }

            Button {
                id: buttonCPlusPlusQt
                x: 674
                y: 181
                width: 104
                height: 40
                text: qsTr("Browse")
            }

            Text {
                id: cPlusPlusDesignPattern
                height: 35

                color: "#ffffff"
                text: qsTr("Patterns")
                font.pixelSize: 25
                font.family: "Roboto"
            }
            TextField {
                id: textFieldCPlusPlusDesignPattern
                width: parent.width*0.7
                height: 40
                font.family: "Roboto"
                placeholderText: qsTr("Text Field")
            }

            Button {
                id: buttonPatternsCPlusPlus

                width: 104
                height: 40
                text: qsTr("Browse")
            }

        }

        Text {
            id: textPythonSubtitile
            width: 80
            height: 45
            color: "#ffffff"
            text: qsTr("Python")
            font.pixelSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Bold"
            font.family: "Roboto"
        }
        Grid{
            id: pythonGrid
            width: 750
            height: 150
            anchors.horizontalCenterOffset: 5
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            rows: 3
            columns: 3



            Text {
                id: pythonPlainText
                width: 80
                height: 35
                color: "#ffffff"
                text: qsTr("Plain")
                font.pixelSize: 25
                font.family: "Roboto"
            }

            TextField {
                id: textFieldPythonPlain
                width: parent.width*0.7
                height: 40
                placeholderText: qsTr("Text Field")
                font.family: "Roboto"
            }

            Button {
                id: buttonPythonPlain

                width: 104
                height: 40
                text: qsTr("Browse")
            }

            Text {
                id: pythonQt
                height: 35

                color: "#ffffff"
                text: qsTr("Qt")
                font.pixelSize: 25
                font.family: "Roboto"
            }

            TextField {
                id: textFieldPythonQt
                width: parent.width*0.7
                height: 40
                placeholderText: qsTr("Text Field")
                font.family: "Roboto"
            }

            Button {
                id: buttonPythonQt

                width: 104
                height: 40
                text: qsTr("Browse")
            }


            Text {
                id: pythonDesignPattern
                height: 35

                color: "#ffffff"
                text: qsTr("Patterns")
                font.pixelSize: 25
                font.family: "Roboto"
            }

            TextField {
                id: textFieldPythonDesignPattern
                width: parent.width*0.7
                height: 40
                placeholderText: qsTr("Text Field")
                font.family: "Roboto"
            }

            Button {
                id: buttonPatternsPython

                width: 104
                height: 40
                text: qsTr("Browse")
            }

        }



        CustomRegularButton {
            id: customRegularButton
            text: "Save"
        }
    }
}
