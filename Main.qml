import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import FileLister 1.0

import "./Modules/Utils"
import "./Modules/Style"

Window {
    id: appWindow
    width: 1200
    height: 900
    minimumWidth: 1000
    minimumHeight: 800
    visible: true
    color: "#ef000000"
    title: qsTr("Code Snippets")
    Material.theme: Material.Dark
    Material.accent: Material.Orange

    FileLister{id: fileLister}
    ListModel { id: filteredTopicsModel }

    property var filesMap: ({})
    property var combinedTopics: []
    property string preExplanationText: ""
    property string explanationText: ""
    property string currentTopic: ""
    property Theme theme: Theme {}
    property var topicModels: []

    property string currentLanguage: ""
    property string basePath: "/home/jesusramos/Git/CodeSnippets"

    function createFilesMap() {
        var basePath = currentLanguage;
        var filesMap = fileLister.createFilesMap(basePath);

        var topics = {};
        for (var key in filesMap) {
            var file = filesMap[key];
            var folderName = file.label;
            var fileName = key.replace(".txt", "");

            if (!topics[folderName]) {
                topics[folderName] = [];
            }

            topics[folderName].push({
                                        name: fileName,
                                        path: file.path,
                                        label: folderName
                                    });
        }

        // Ordenar los folders por los números en sus nombres
        var sortedFolders = Object.keys(topics).sort((a, b) => {
                                                         var numA = parseInt(a.split('-')[0]);
                                                         var numB = parseInt(b.split('-')[0]);
                                                         return numA - numB;
                                                     });

        // Construir topicModels con folders ordenados
        topicModels = [];
        for (var i = 0; i < sortedFolders.length; i++) {
            var folder = sortedFolders[i];
            topicModels.push({
                                 label: folder,
                                 model: topics[folder]
                             });
        }

        // Ordenar los archivos dentro de cada folder por el nombre de archivo
        for (var j = 0; j < topicModels.length; j++) {
            topicModels[j].model.sort((a, b) => {
                                          var numA = parseInt(a.name.split('-')[0]);
                                          var numB = parseInt(b.name.split('-')[0]);
                                          return numA - numB;
                                      });
        }

        combinedTopics = topicModels.reduce((acc, t) => acc.concat(t.model), []);
        return filesMap;
    }

    function loadFile(fileName) {
        if (filesMap[fileName]) {
            var file = filesMap[fileName].path;
            currentTopic = fileName;
            return file;
        } else {
            console.error("File not found in filesMap:", fileName);
            return null;
        }
    }

    function loadFileContent(fileName) {
        var filePath = loadFile(fileName);
        if (filePath) {
            fileProcessor.processFile(filePath);
        }
    }

    function updateFileList(files) {
        fileListModel.clear();
        for (var i = 0; i < files.length; i++) {
            fileListModel.append({ name: files[i] });
        }
    }

    function filterTopics(searchText) {
        filteredTopicsModel.clear();
        for (var i = 0; i < combinedTopics.length; i++) {
            var topic = combinedTopics[i];
            if (topic.name.toLowerCase().indexOf(searchText.toLowerCase()) !== -1) {
                filteredTopicsModel.append({ "name": topic.name });
            }
        }
    }

    Component.onCompleted: {
        filesMap = createFilesMap();
        filterTopics("");
    }

    Column {
        id: mainLayout
        width: parent.width
        height: parent.height


        SelectFolderPage {
            id: selectFolderPageItem
            visible: false  // Inicialmente oculta
        }

        MyMenuBar {
            id: menuBar
            Layout.fillWidth: true
            width: parent.width
            onSetPathsTriggered: {
                selectFolderPageItem.visible = true
                selectFolderPageItem.textResultProperty = ""
            }
        }
        Column {
            id: columnContent
            height: parent.height - menuBar.height
            spacing: 10
            width: parent.width
            Layout.fillHeight: true
            Layout.fillWidth: true

            StackView {
                id: stackViewInitialPage
                initialItem: "InitialPage.qml"
                width: columnContent.width * 0.97
                height: columnContent.height * 0.9
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillHeight: true
                Layout.fillWidth: true

                pushEnter: Transition {
                    PropertyAnimation { property: "x"; from: stackViewInitialPage.height; to: 0; duration: 400; easing.type: Easing.InOutQuad }
                    PropertyAnimation { property: "opacity"; from: 0; to: 1; duration: 400; easing.type: Easing.InOutQuad }
                }
            }

            CustomRegularButton {
                id: switchToMainPageButton
                anchors.horizontalCenter: parent.horizontalCenter
                height: 75
                visible: false
                width: 180
                text: qsTr("Go to Main Page")
                onClicked: {
                    if (stackViewInitialPage.depth > 1) {
                        stackViewInitialPage.pop();
                        switchToMainPageButton.visible = false;
                    }
                }
            }
        }
    }

    Connections {
        target: communicationObject
        function onShowMainPage() {
            stackViewInitialPage.push("MainPage.qml");
            switchToMainPageButton.visible = true;
        }
        function onShowExplanationPage() {
            if (stackViewInitialPage.depth > 1) {
                stackViewInitialPage.pop();
            }
        }
    }

    Connections {
        target: fileProcessor
        function onExplanationChanged() {
            preExplanationText = fileProcessor.explanation;
            explanationText = markdownProcessor.processMarkdown(preExplanationText);
        }
    }

    QtObject {
        id: communicationObject

        signal showMainPage
        signal showExplanationPage
    }
}
