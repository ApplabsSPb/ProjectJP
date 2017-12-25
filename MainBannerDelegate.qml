import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {

    property bool is_current

    id: delegate
    //width: is_current ? device_screen.width * 0.85 : (device_screen.width * 0.85) * 0.9
    //height: is_current ? parent.height : parent.height * 0.9

    width: device_screen.width * 0.85
    height: parent.height

    Rectangle {
        id: delegate_background
        width: parent.width
        height: parent.height

        anchors.fill: parent

        radius: 15
        visible: false
    }

    Image {
        id: delegate_image
        width: parent.width
        height: parent.height

        anchors.fill: parent

        fillMode: Image.PreserveAspectCrop
        source: _source

        smooth: true
        visible: false
    }

    OpacityMask {
        anchors.fill: delegate_image
        source: delegate_image
        maskSource: delegate_background

        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 3
            horizontalOffset : 3
            radius: 5
            samples: 11
            color: "#20000000"
        }
    }
}
