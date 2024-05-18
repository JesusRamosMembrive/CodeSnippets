import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts


GroupBox {
    id: groupbox
    width: 130
    height: 90

    // Personalizando el fondo del GroupBox
    background: Rectangle {
        color: "#231f1f"
        radius: 15 // Redondear las esquinas
        border.color: "#00000000" // Color del borde
        border.width: 2 // Ancho del borde
    }
}
