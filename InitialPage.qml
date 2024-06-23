import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Effects


Item {
    id: initialPageItem
    width: parent.width
    height: parent.height

    property string cPath: ""
    property string cQtPath: ""
    property string cPatternsPath: ""
    property string pythonPath: ""
    property string pythonQtPath: ""
    property string pythonPatternsPath: ""
    property bool showFileSystem: Settings.displayFileSystemView

    Binding {
        target: initialPageItem
        property: "showFileSystem"
        value: Settings.displayFileSystemView
    }

    onShowFileSystemChanged: {
        function changeSwitchState() {
            console.log("showFileSystem: " + showFileSystem)
            console.log("Cambiando el switch de posicion:")
            switchFileSystem.checked = showFileSystem;
        }
        changeSwitchState();
    }

    Component.onCompleted: {
        var pathsFilePath = "/home/jesusramos/Git/CodeSnippets/paths.json";
        var result = jsonHandler.readJsonFile(pathsFilePath);

        if(result) {
            cPath = result.c || "";
            cQtPath = result.cQt || "";
            cPatternsPath = result.cPatterns || "";
            pythonPath = result.python || "";
            pythonQtPath = result.pythonQt || "";
            pythonPatternsPath = result.patternPython || "";

            buttonC.enabled = !!cPath;
            buttonQtC.enabled = !!cQtPath;
            buttonDesignPatternsC.enabled = !!cPatternsPath;
            buttonPython.enabled = !!pythonPath;
            buttonQtPython.enabled = !!pythonQtPath;
            buttonDesignPatternsPython.enabled = !!pythonPatternsPath;
        }
    }

    Rectangle {
        id: backgroundInitialPage
        color: "#1c1c1c"
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: -1
        anchors.bottomMargin: 1
        radius: 20
        border.color: "#14ffffff"

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
                source: "qrc:/Images/Assets/Images/logoAPP.png"
                Layout.maximumHeight: 350
                Layout.maximumWidth: 550
                Layout.fillHeight: false
                Layout.fillWidth: true
                cache: true
                baselineOffset: 0
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
                        communicationObject.showMainPage(cPath)
                    }
                    layer.enabled: true
                    layer.effect: MultiEffect{
                        blurEnabled: false
                        blurMax: 100
                        shadowVerticalOffset: 1
                        shadowHorizontalOffset: 1
                        shadowColor: "#ffffff"
                        colorization: 0
                        colorizationColor: "#ffffff"
                        shadowEnabled: true
                        shadowBlur: 1
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
                    layer.enabled: true
                    layer.effect: MultiEffect{
                        blurEnabled: false
                        blurMax: 100
                        shadowVerticalOffset: 1
                        shadowHorizontalOffset: 1
                        shadowColor: "#ffffff"
                        colorization: 0
                        colorizationColor: "#ffffff"
                        shadowEnabled: true
                        shadowBlur: 1
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
                    layer.enabled: true
                    layer.effect: MultiEffect{
                        blurEnabled: false
                        blurMax: 100
                        shadowVerticalOffset: 1
                        shadowHorizontalOffset: 1
                        shadowColor: "#ffffff"
                        colorization: 0
                        colorizationColor: "#ffffff"
                        shadowEnabled: true
                        shadowBlur: 1
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
                    layer.enabled: true
                    layer.effect: MultiEffect{
                        blurEnabled: false
                        blurMax: 100
                        shadowVerticalOffset: 1
                        shadowHorizontalOffset: 1
                        shadowColor: "#ffffff"
                        colorization: 0
                        colorizationColor: "#ffffff"
                        shadowEnabled: true
                        shadowBlur: 1
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
                    layer.enabled: true
                    layer.effect: MultiEffect{
                        blurMultiplier: 0.1
                        blurEnabled: false
                        blurMax: 100
                        shadowVerticalOffset: 1
                        shadowHorizontalOffset: 1
                        shadowColor: "#ffffff"
                        colorization: 0
                        colorizationColor: "#ffffff"
                        shadowEnabled: true
                        shadowBlur: 1
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
                    layer.enabled: true
                    layer.effect: MultiEffect{
                        blurEnabled: false
                        blurMax: 100
                        shadowVerticalOffset: 1
                        shadowHorizontalOffset: 1
                        shadowColor: "#ffffff"
                        colorization: 0
                        colorizationColor: "#ffffff"
                        shadowEnabled: true
                        shadowBlur: 1
                    }
                }
                Row{
                    id: row

                    Text {
                        id: switchText
                        text: qsTr("Explore the file system")
                        anchors.verticalCenter: parent.verticalCenter
                        color: "white"
                    }

                    Switch{
                        id: switchFileSystem
                        onCheckedChanged: {
                            Settings.sendDisplayFileSystemView(switchFileSystem.checked)
                            communicationObject.displayFileSystemTreeView()
                            console.log("Switch activado");
                        }
                    }
                }
            }
        }
    }
}
