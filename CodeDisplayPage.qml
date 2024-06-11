import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import QtWebEngine
import "./Modules/Style"

Rectangle {
    id: codeDisplayPage
    width: parent ? parent.width : 0
    height: parent ? parent.height : 0
    color: "#121212"
    radius: 15

    property Theme theme: Theme {}
    property string newTitleAreaCode: "Code area"

    GridLayout {
        id: mainLayout
        anchors.fill: parent
        columns: 2
        rowSpacing: 10
        columnSpacing: 20

        // Área de código
        Column {
            id: column
            Layout.row: 0
            Layout.column: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            Text {
                id: titleCodeArea
                text: newTitleAreaCode
                font.family: "Roboto"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 20
                color: theme.titleColor
            }

            Rectangle {
                width: parent.width
                height: parent.height * 0.92
                color: theme.backGroundCodeArea
                radius: 20
                border.width: 2
                anchors.left: parent.left
                anchors.leftMargin: 10
                border.color: theme.borderGroupBoxColor

                ScrollView {
                    anchors.fill: parent
                    anchors.margins: 10

                    WebEngineView {
                        id: webView
                        clip: true
                        height: parent.height
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width
                        antialiasing: true
                        backgroundColor: "#121212"
                        url: "about:blank"

                    }
                }
            }
        }

        // Área de archivos
        Column {
            id: columnFiles
            Layout.minimumWidth: 130
            Layout.minimumHeight: 0
            Layout.row: 0
            Layout.column: 1
            Layout.fillHeight: true

            Text {
                text: "Files"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 20
                color: theme.titleColor
                anchors.rightMargin: 10
                font.family: "Roboto"
            }

            Rectangle {
                id: backGroundFileListView
                color: theme.backGroundCodeArea
                height: parent.height * 0.92
                width: parent.width
                radius: 20
                border.color: theme.borderGroupBoxColor
                anchors.right: parent.right
                anchors.rightMargin: 5

                ListView {
                    id: fileListView
                    width: parent.width
                    height: parent.height
                    model: fileProcessor.files
                    spacing: 20

                    delegate: Item {
                        width: parent.width
                        height: 60

                        Rectangle {
                            width: parent.width
                            height: parent.height
                            color: theme.titleColor
                            border.color: theme.borderGroupBoxColor
                            border.width: 1
                            radius: 20

                            Text {
                                color: "#000000"
                                anchors.fill: parent
                                anchors.margins: 5
                                text: modelData
                                font.pixelSize: 14
                                wrapMode: Text.WordWrap  // Aquí se ajusta el texto
                                textFormat: Text.AutoText
                                font.family: "Roboto"
                                horizontalAlignment: Text.AlignHCenter  // Alinear horizontalmente al centro
                                verticalAlignment: Text.AlignVCenter    // Alinear verticalmente al centro
                            }

                            MouseArea {
                                id: itemMouseArea
                                anchors.fill: parent
                                onClicked: {
                                    fileProcessor.getFileContent(modelData);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Connections {
        target: fileProcessor
        function onFileSelected(fileTitle, fileContent) {
            var fileContentProcecessed = markdownProcessor.processMarkdown(fileContent);
            webView.loadHtml(fileContentProcecessed);
            newTitleAreaCode = fileTitle;
        }
    }
}
