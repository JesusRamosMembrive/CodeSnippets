import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Effects
import QtQuick.Dialogs

Item {
    id: initialPageItem
    width: 1000
    height: 800

    Rectangle {
        id: backgroundInitialPage
        color: "#292929"
        radius: 15
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: -1
        anchors.bottomMargin: 1

        ColumnLayout {
            id: columnLayout
            width: 100
            height: 100
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            layoutDirection: Qt.LeftToRight
            spacing: 2
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: image
                x: 153
                y: 8
                width: 500
                height: 150
                verticalAlignment: Image.AlignVCenter
                source: "Assets/Images/logoAPP.png"
                Layout.maximumHeight: 250
                Layout.maximumWidth: 450
                Layout.fillHeight: false
                Layout.fillWidth: true
                cache: true
                baselineOffset: 0
                antialiasing: true
                mirror: false
                mipmap: false
                sourceSize.width: 0
                autoTransform: true
                asynchronous: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                fillMode: Image.PreserveAspectFit
            }

            Rectangle{
                id: lineSeparator
                width: parent.width * 0.8
                height: 2
                Layout.minimumWidth: 900
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.topMargin: -100

            }

            Text {
                id: text1
                x: 114
                y: 337
                width: 774
                height: 50
                color: "#ffffff"
                text: qsTr("Coleccion de snippts")
                font.pixelSize: 33
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                Layout.maximumWidth: 65535
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.family: "Roboto"
            }

            GridLayout {
                id: gridLayout
                x: 27
                y: 374
                width: 953
                height: 397
                rowSpacing: 30
                columnSpacing: 45
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                antialiasing: true
                layoutDirection: Qt.LeftToRight
                flow: GridLayout.LeftToRight
                rows: 2
                columns: 3

                ButtonMainMenu{
                    id: buttonC
                    x: 81
                    y: 493
                    iconSource: "qrc:/Images/Assets/Images/c-.png"
                    textTitle: "C ++"
                    textSubTitle: "C++ Plain Snippets"
                }

                ButtonMainMenu{
                    id: buttonQtC
                    x: 375
                    y: 493
                    iconSource: "qrc:/Images/Assets/Images/python.png"
                    textTitle: "Qt C++"
                    textSubTitle: "Qt C++ Snippets"
                }

                ButtonMainMenu{
                    id: buttonDesignPatternsC
                    x: 661
                    y: 493
                    iconSource: "qrc:/Images/Assets/Images/python.png"
                    textTitle: "Design patterns in C++"
                    textSubTitle: "Design patterns for C++ Snippets"
                }

                ButtonMainMenu{
                    id: buttonPython
                    x: 81
                    y: 634
                    iconSource: "qrc:/Images/Assets/Images/python.png"
                    textTitle: "Python"
                    textSubTitle: "Python Snippets"
                }

                ButtonMainMenu{
                    id: buttonQtPython
                    x: 375
                    y: 634
                    iconSource: "qrc:/Images/Assets/Images/python.png"
                    textTitle: "Qt Python"
                    textSubTitle: "Qt Python Snippets"
                }



                ButtonMainMenu{
                    id: buttonDesignPatternsPython
                    x: 661
                    y: 634
                    iconSource: "qrc:/Images/Assets/Images/python.png"
                    textTitle: "Design patterns in Python"
                    textSubTitle: "Design patterns for Python Snippets"
                }
            }
        }






    }




}
