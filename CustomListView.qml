import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material


Column {
    id: listViewContainer
    width: parent.width
    spacing: 10

    property var customModel
    property var customButton
    property string searchFilter: ""

    function filterModel() {
        filteredModel.clear();
        for (var i = 0; i < customModel.length; i++) {
            var item = customModel[i];
            if (item.name.toLowerCase().indexOf(searchFilter.toLowerCase()) !== -1) {
                filteredModel.append(item);
            }
        }
    }

    Rectangle {
        id: bgListViewButtons
        width: parent.width * 0.9

        height: customButton && customButton.checked ? customListView.contentHeight : 0
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "#00ffffff"
        color: "#00000000"  // Transparent background to help debug

        ListView {
            id: customListView
            width: parent.width
            height: customListView.visible ? contentHeight : 0
            visible: true
            layer.mipmap: false
            antialiasing: true
            anchors.horizontalCenter: parent.horizontalCenter
            clip: true

            model: ListModel {
                id: filteredModel
            }

            delegate: ItemDelegate {
                id: itemDelegate
                width: customListView.width
                height: 70
                font.pointSize: 12
                icon.color: "#00ffffff"
                antialiasing: true
                smooth: true
                enabled: true
                font.family: "Roboto"

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "#ffffff"
                    border.color: "#c42b3d5f"
                    border.width: 2
                    layer.wrapMode: ShaderEffectSource.Repeat
                    layer.enabled: false
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#09203f"
                        }

                        GradientStop {
                            position: 1
                            color: "#537895"
                        }
                    }
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        color: "#ffffff"
                        width: parent.width
                        height: parent.height
                        text: model.name
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Roboto"
                        wrapMode: Text.WordWrap
                        layer.enabled: true
                        styleColor: "#00ffffff"
                        font.italic: false
                        fontSizeMode: Text.Fit
                        renderTypeQuality: Text.VeryHighRenderTypeQuality
                        textFormat: Text.RichText
                    }

                    MouseArea {
                        id: itemMouseArea
                        anchors.fill: parent
                        onClicked: {
                            appWindow.loadFileContent(model.name + ".txt")
                        }
                    }
                }
            }

            Component.onCompleted: {
                filterModel();
            }

            onContentHeightChanged: {
                bgListViewButtons.height = contentHeight;
            }

            Connections {
                target: listViewContainer
                function onSearchFilterChanged() { filterModel() }
            }
        }

        Behavior on height {
            NumberAnimation {
                duration: 150
                easing.type: Easing.InOutCubic
            }
        }
    }

    Behavior on height {
        NumberAnimation {
            duration: 150
            easing.type: Easing.InOutCubic
        }
    }
}
