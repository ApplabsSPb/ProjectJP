import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Rectangle {
    property string index

    id: button
    height: parent.height
    width: parent.width * 0.2

    Image {
        id: icon
        source: current_index == index ? "qrc:/image/icons/" + index + "Selected.png" : "qrc:/image/icons/" + index + "NotSelected.png"

        anchors.fill: parent
        anchors.margins: dpMargin
        fillMode: Image.PreserveAspectFit

        smooth: true
    }

    MouseArea {
        id: button_clk
        anchors.fill: parent
        onClicked: {
            if(current_index != index) {
                current_index = index
                navigator.setSource(current_index)
            }
        }
    }
}
