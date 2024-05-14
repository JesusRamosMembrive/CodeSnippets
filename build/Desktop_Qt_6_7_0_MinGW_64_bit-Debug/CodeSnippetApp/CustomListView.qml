// CustomListView.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

ListView {
    id: customListView
    width: parent.width
    height: customButton.checked ? contentHeight : 0
    visible: customButton.checked

    property var customModel
    property var customButton

    model: customModel  // Utiliza el modelo pasado como propiedad
    delegate: ItemDelegate {
        width: parent.width
        text: modelData
        font.pixelSize: 16
        onClicked: {
            console.log("Clicked on", modelData)
            loadFile(modelData)
            // Agregar más acciones aquí si es necesario
        }
    }

    Behavior on height {
        NumberAnimation {
            duration: 350
            easing.type: Easing.OutExpo
        }
    }
}
