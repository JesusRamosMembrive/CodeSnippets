import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Window {
    id: selectFolderPageItem
    width: 750
    height: 565
    color: "#00ffffff"
    visibility: Window.AutomaticVisibility
    modality: Qt.WindowModal
    flags: Qt.Dialog

    property string textResultProperty: ""


    Component.onCompleted:
    {
        var pathsFilePath = appWindow.basePath + "/paths.json";
        var data = jsonHandler.readJsonFile(pathsFilePath);
        if (data) {
            textFieldCPlusPlus.text = data.c;
            textFieldCPlusPlusQt.text = data.cQt;
            textFieldCPlusPlusDesignPattern.text = data.cPatterns;
            textFieldPythonPlain.text = data.python;
            textFieldPythonQt.text = data.pythonQt;
            textFieldPythonDesignPattern.text = data.patternPython;
        }
    }


    Rectangle {
        id: bgFolderPage
        color: "#161616"
        anchors.fill: parent
    }

    Column {
        id: column
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        padding: 5
        spacing: 5

        Text {
            id: textTitleWindow
            width: 275
            height: 40
            color: "#ffffff"
            text: qsTr("Set up the paths")
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Bold"
            font.family: "Roboto"
        }

        Rectangle {
            id: separatorLine
            width: parent.width * 0.9
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
            font.pixelSize: 25

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
                font.pixelSize: 20
                font.family: "Roboto"
            }

            TextField {
                id: textFieldCPlusPlus
                width: parent.width * 0.7
                height: 35
                font.family: "Roboto"
                placeholderText: qsTr("Text Field")
            }
            Button {
                id: buttonBrowseCPlusPlus
                width: 104
                height: 35
                text: qsTr("Browse")
                onClicked: folderDialogCPlusPlus.open()
            }

            Text {
                id: cPlusPlusQt
                height: 35
                color: "#ffffff"
                text: qsTr("Qt")
                font.pixelSize: 20
                font.family: "Roboto"
            }
            TextField {
                id: textFieldCPlusPlusQt
                width: parent.width * 0.7
                height: 35
                font.family: "Roboto"
                placeholderText: qsTr("Text Field")
            }

            Button {
                id: buttonCPlusPlusQt
                width: 104
                height: 35
                text: qsTr("Browse")
                onClicked: folderDialogCPlusPlusQt.open()
            }

            Text {
                id: cPlusPlusDesignPattern
                height: 35
                color: "#ffffff"
                text: qsTr("Patterns")
                font.pixelSize: 20
                font.family: "Roboto"
            }
            TextField {
                id: textFieldCPlusPlusDesignPattern
                width: parent.width * 0.7
                height: 35
                font.family: "Roboto"
                placeholderText: qsTr("Text Field")
            }

            Button {
                id: buttonPatternsCPlusPlus
                width: 104
                height: 35
                text: qsTr("Browse")
                onClicked: folderDialogCPlusPlusPatterns.open()
            }
        }

        Text {
            id: textPythonSubtitile
            width: 80
            height: 45
            color: "#ffffff"
            text: qsTr("Python")
            font.pixelSize: 25
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Bold"
            font.family: "Roboto"
        }
        Grid {
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
                font.pixelSize: 20
                font.family: "Roboto"
            }

            TextField {
                id: textFieldPythonPlain
                width: parent.width * 0.7
                height: 35
                placeholderText: qsTr("Text Field")
                font.family: "Roboto"
            }

            Button {
                id: buttonPythonPlain
                width: 104
                height: 35
                text: qsTr("Browse")
                onClicked: folderDialogPythonPlain.open()
            }

            Text {
                id: pythonQt
                height: 35
                color: "#ffffff"
                text: qsTr("Qt")
                font.pixelSize: 20
                font.family: "Roboto"
            }

            TextField {
                id: textFieldPythonQt
                width: parent.width * 0.7
                height: 35
                placeholderText: qsTr("Text Field")
                font.family: "Roboto"
            }

            Button {
                id: buttonPythonQt
                width: 104
                height: 35
                text: qsTr("Browse")
                onClicked: folderDialogPythonQt.open()
            }

            Text {
                id: pythonDesignPattern
                height: 35
                color: "#ffffff"
                text: qsTr("Patterns")
                font.pixelSize: 20
                font.family: "Roboto"
            }

            TextField {
                id: textFieldPythonDesignPattern
                width: parent.width * 0.7
                height: 35
                placeholderText: qsTr("Text Field")
                font.family: "Roboto"
            }

            Button {
                id: buttonPatternsPython
                width: 104
                height: 35
                text: qsTr("Browse")
                onClicked: folderDialogPythonPatterns.open()
            }
        }

        Text{
            id: textResult
            height: 16
            color: "#ffffff"
            font.pointSize: 16
            font.family: "Roboto"
            text: textResultProperty
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomRegularButton {
            id: customRegularButton
            width: 165
            height: 65
            text: "Save"
            onClicked: {
                var pathsFilePath = appWindow.basePath + "/paths.json"

                var sampleData = {
                    "c": textFieldCPlusPlus.text,
                    "cQt":textFieldCPlusPlusQt.text,
                    "cPatterns":textFieldCPlusPlusDesignPattern.text,
                    "python":textFieldPythonPlain.text,
                    "pythonQt":textFieldPythonQt.text,
                    "patternPython":textFieldPythonDesignPattern.text
                };

                var success = jsonHandler.writeJsonFile(pathsFilePath, sampleData);
                if (success) {
                    console.log("JSON file written successfully");
                    textResult.text = "JSON file written successfully";
                }
                else {
                    console.log("Error writing JSON file");
                    textResult.text = "Error writing JSON file";
                }
            }
        }
    }

    FolderDialog {
        id: folderDialogCPlusPlus
        title: "Select C++ Directory"
        onAccepted: {
            if (folderDialogCPlusPlus.selectedFolder) {
                textFieldCPlusPlus.text = folderDialogCPlusPlus.selectedFolder.toString().replace("file://", "")
            }
        }
    }

    FolderDialog {
        id: folderDialogCPlusPlusQt
        title: "Select C++ Qt Directory"
        onAccepted: {
            if (folderDialogCPlusPlusQt.selectedFolder) {
                textFieldCPlusPlusQt.text = folderDialogCPlusPlusQt.selectedFolder.toString().replace("file://", "")
            }
        }
    }

    FolderDialog {
        id: folderDialogCPlusPlusPatterns
        title: "Select C++ Patterns Directory"
        onAccepted: {
            if (folderDialogCPlusPlusPatterns.selectedFolder) {
                textFieldCPlusPlusDesignPattern.text = folderDialogCPlusPlusPatterns.selectedFolder.toString().replace("file://", "")
            }
        }
    }

    FolderDialog {
        id: folderDialogPythonPlain
        title: "Select Python Directory"
        onAccepted: {
            if (folderDialogPythonPlain.selectedFolder) {
                textFieldPythonPlain.text = folderDialogPythonPlain.selectedFolder.toString().replace("file://", "")
            }
        }
    }

    FolderDialog {
        id: folderDialogPythonQt
        title: "Select Python Qt Directory"
        onAccepted: {
            if (folderDialogPythonQt.selectedFolder) {
                textFieldPythonQt.text = folderDialogPythonQt.selectedFolder.toString().replace("file://", "")
            }
        }
    }

    FolderDialog {
        id: folderDialogPythonPatterns
        title: "Select Python Patterns Directory"
        onAccepted: {
            if (folderDialogPythonPatterns.selectedFolder) {
                textFieldPythonDesignPattern.text = folderDialogPythonPatterns.selectedFolder.toString().replace("file://", "")
            }
        }
    }

    Connections {
        target: selectFolderPageItem
        onVisibleChanged: {
            if (!selectFolderPageItem.visible) {
                textResult.text = ""
            }
        }
    }


}
