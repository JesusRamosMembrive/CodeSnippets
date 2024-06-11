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
    Layout.fillHeight: true
    Layout.fillWidth: true
    radius: 8
    color: theme.backGroundCodeDisplayPageColor

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
            height: parent.height * 0.9
            color: "#1e1e1e"
            radius: 8
            border.width: 1
            anchors.left: parent.left
            anchors.right: parent.right
            border.color: theme.borderGroupBoxColor

            ScrollView {
                id: scrollView
                anchors.fill: parent
                clip: true

                WebEngineView {
                    id: webView
                    anchors.fill: parent
                    antialiasing: true
                    backgroundColor: "#2b2b2b"
                    url: "about:blank"

                }
                // TextArea {
                //     id: textExplanationCode
                //     wrapMode: Text.WordWrap
                //     tabStopDistance: 20
                //     renderType: Text.NativeRendering
                //     readOnly: true
                //     textFormat: Text.MarkdownText
                //     font.pointSize: 13
                //     font.family: "Roboto"
                //     color: theme.letterToReadColor
                //     background: Rectangle {
                //         color: "transparent"
                //     }
                //     implicitWidth: parent.width
                //     implicitHeight: contentHeight

                //     // Optional: For better performance, disable text interaction and focus
                //     enabled: false
                //     smooth: false
                //     activeFocusOnTab: false
                //     activeFocusOnPress: false
                //     hoverEnabled: false
                // }
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
