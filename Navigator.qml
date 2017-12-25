import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Loader {
    id: navigator

    function setSource(index) {
        if(index === "home") {
            navigator.source = "MainWindow.qml"
        }

        if(index === "catalog") {
            navigator.source = "Categories.qml"
        }

        if(index === "screen3") {
            navigator.source = "Screen3.qml"
        }
    }
}
