// FileReader.qml
import QtQuick 2.0

Item {
    function read(fileUrl) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", fileUrl, false);
        xhr.send();
        return xhr.responseText;
    }
}
