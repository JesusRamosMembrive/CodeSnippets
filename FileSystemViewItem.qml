import QtQuick
import QtQuick.Controls

Item {
    id: root
    width: parent.width
    height: parent.height

    FileSystemView {
        id: fileSystemView
        color: "surface1"
        onFileClicked: path => root.currentFilePath = path
        anchors.fill: parent
    }
}
