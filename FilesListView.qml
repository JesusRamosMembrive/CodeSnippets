import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

ScrollView {
    id: scrollViewFiles
    width: parent.width * 0.2
    height: parent.height * 0.8

    Rectangle {
        width: parent.width
        height: parent.height
        radius: 15
        color: "#f0f0f0"

        ListView {
            id: listViewFiles
            width: parent.width
            height: parent.height

            model: fileListModel

            delegate: ItemDelegate {
                width: parent.width
                text: modelData
                font.pixelSize: 16
                onClicked: {
                    // Lógica para manejar el clic en el archivo
                    loadFileContent(modelData)
                }
            }
        }
    }
}
