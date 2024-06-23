import QtQuick
pragma Singleton

QtObject {
    id: settingsSingleton

    property bool displayFileSystemView: false

    function sendDisplayFileSystemView(data) {
        console.log("datos seteados");
        settingsSingleton.displayFileSystemView = data
    }

    function getDisplayFileSystemView() {
        console.log("datos leidos");
        return settingsSingleton.displayFileSystemView
    }
}
