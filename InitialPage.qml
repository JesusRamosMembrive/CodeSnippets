import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Effects
import QtQuick.Dialogs

Item {
    id: initialPageItem
    width: parent.width
    height: parent.height

    Rectangle {
        id: backgroundInitialPage
        color: "#292929"
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: -1
        anchors.bottomMargin: 1
        MultiEffect {
            source: backgroundInitialPage
            anchors.fill: backgroundInitialPage
            brightness: 0.4
            saturation: 0.2
            blurEnabled: true
            blurMax: 16
            blur: 1.0
        }
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
                height: 200
                verticalAlignment: Image.AlignVCenter
                source: "qrc:/Images/Assets/Images/logoAPP.png"
                Layout.maximumHeight: 350
                Layout.maximumWidth: 550
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

            Rectangle {
                id: lineSeparator
                width: parent.width * 0.8
                height: 2
                Layout.minimumWidth: 900
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.topMargin: -50
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

                ButtonMainMenu {
                    id: buttonC
                    x: 81
                    y: 493
                    iconSource: "qrc:/Images/Assets/Images/c-.png"
                    textTitle: "C ++"
                    textSubTitle: "C++ Plain Snippets"
                    onClicked: {
                        communicationObject.showMainPage()
                    }
                    MultiEffect {
                        source: buttonC
                        anchors.fill: buttonC
                        shadowBlur: 1.0
                        shadowEnabled: true
                        shadowColor: "red"
                        shadowVerticalOffset: 15
                        shadowHorizontalOffset: 11
                    }

                }

                ButtonMainMenu {
                    id: buttonQtC
                    x: 375
                    y: 493
                    iconSource: "qrc:/Images/Assets/Images/python.png"
                    textTitle: "Qt C++"
                    textSubTitle: "Qt C++ Snippets"
                    onClicked: {
                        communicationObject.showMainPage()
                    }
                }

                ButtonMainMenu {
                    id: buttonDesignPatternsC
                    x: 661
                    y: 493
                    iconSource: "qrc:/Images/Assets/Images/qt_logo_green_rgb_whitespace-removebg-preview.png"
                    textTitle: "Design patterns in C++"
                    textSubTitle: "Design patterns for C++ Snippets"
                    onClicked: {
                        communicationObject.showMainPage()
                    }
                }

                ButtonMainMenu {
                    id: buttonPython
                    x: 81
                    y: 634
                    iconSource: "qrc:/Images/Assets/Images/python.png"
                    textTitle: "Python"
                    textSubTitle: "Python Snippets"
                    onClicked: {
                        communicationObject.showMainPage()
                    }
                }

                ButtonMainMenu {
                    id: buttonQtPython
                    x: 375
                    y: 634
                    iconSource: "qrc:/Images/Assets/Images/1200px-Python_and_Qt.svg-380x396.png"
                    textTitle: "Qt Python"
                    textSubTitle: "Qt Python Snippets"
                    onClicked: {
                        communicationObject.showMainPage()
                    }
                }

                ButtonMainMenu {
                    id: buttonDesignPatternsPython
                    x: 661
                    y: 634
                    iconSource: "qrc:/Images/Assets/Images/_f12212ab-4292-469b-9db4-d7125069102b.jpeg"
                    textTitle: "Design patterns in Python"
                    textSubTitle: "Design patterns for Python Snippets"
                    onClicked: {
                        communicationObject.showMainPage()
                    }
                }
            }
        }
    }
}
