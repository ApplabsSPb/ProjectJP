import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {

    property string button_color
    property string button_gradient
    property string button_title

    id: background
    height: parent.height
    width: parent.width * 0.25

    Rectangle {
        id: button
        height: parent.height * 0.85
        width: parent.width * 0.8

        anchors.centerIn: parent

        color: button_color
        radius: height * 0.1

        layer.enabled: true
        layer.effect: DropShadow {
            radius: 8
            samples: 17
            color: "#40000000"
        }

        gradient: Gradient {
            GradientStop { position: 0.0; color: button_color }
            GradientStop { position: 1.0; color: button_gradient }
        }

        Label {
            id: title

            anchors.bottom: parent.bottom
            anchors.bottomMargin: dpMargin * 3
            anchors.horizontalCenter: parent.horizontalCenter

            text: button_title
            font.pixelSize: parent.width * 0.18
            color: "white"
        }
    }
}
