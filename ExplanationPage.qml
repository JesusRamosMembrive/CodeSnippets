import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import QtWebEngine

import "./Modules/Style"


Rectangle {
    id: explanationDisplayPage
    width: parent.width
    height: parent.height
    color: "#121212"
    Layout.fillHeight: true
    Layout.fillWidth: true
    radius: 8
    border.color: "#9b9b9b"

    property Theme theme: Theme {}

    Column {
        id: columnExplanation
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        spacing: 10

        Text {
            text: "Explanation Area"
            wrapMode: Text.WrapAnywhere
            textFormat: Text.AutoText
            font.family: "Roboto"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 20
            color: theme.titleColor
        }

        Rectangle {
            height: parent.height *0.92
            color: "#121212"
            radius: 8
            border.color: "#919191"
            border.width: 2
            anchors.left: parent.left
            anchors.right: parent.right

            ScrollView {
                id: scrollView
                anchors.fill: parent
                height: parent.height
                width: parent.width
                clip: true

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

    Component.onCompleted: {
        var htmlContent = appWindow.explanationText;
        webView.loadHtml(htmlContent);
    }

    Connections {
        target: fileProcessor
        function onExplanationChanged() {
            var preExplanationText = fileProcessor.explanation;
            var explanationText = markdownProcessor.processMarkdown(preExplanationText);
            webView.loadHtml(explanationText);
        }
    }
}
