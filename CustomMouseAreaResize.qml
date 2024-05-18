import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Effects
import QtQuick.Dialogs

import "./Modules/ListsOfModels"
import "./Modules/Utils"

MouseArea {
    id: mouseAreaResize
    anchors.fill: parent
    hoverEnabled: true
    acceptedButtons: Qt.LeftButton

    property int edges: 0;
    property int edgeOffest: 5;

    function setEdges(x, y) {
        edges = 0;
        if(x < edgeOffest) edges |= Qt.LeftEdge;
        if(x > (width - edgeOffest))  edges |= Qt.RightEdge;
        if(y < edgeOffest) edges |= Qt.TopEdge;
        if(y > (height - edgeOffest)) edges |= Qt.BottomEdge;
    }

    cursorShape: {
        return !containsMouse ? Qt.ArrowCursor:
                edges == 3 || edges == 12 ? Qt.SizeFDiagCursor :
                edges == 5 || edges == 10 ? Qt.SizeBDiagCursor :
                edges & 9 ? Qt.SizeVerCursor :
                edges & 6 ? Qt.SizeHorCursor : Qt.ArrowCursor;
    }

    onPositionChanged: setEdges(mouseX, mouseY);
    onPressed: {
        setEdges(mouseX, mouseY);
        if(edges && containsMouse) {
            startSystemResize(edges);
        }
    }
}
