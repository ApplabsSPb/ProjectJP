import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {
    id: delegate
    width: parent.width
    height: device_screen.height * 0.25

    Rectangle {
        id: delegate_background
        width: parent.width
        height: parent.height

        anchors.fill: parent

        radius: parent.height * 0.1

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
            radius: 8
            samples: 17
            color: "#60000000"
        }
    }

    Rectangle {
        id: title_background
        width: parent.width * 0.7
        height: parent.height * 0.25

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: dpMargin * 2

        radius: height
        opacity: 0.7
        color: "#7392f6"

        Rectangle {
            id: title_field
            height: parent.height
            width: parent.width * 0.3

            anchors.horizontalCenter: parent.horizontalCenter

            color: "transparent"

            Text {
                id: title
                width: parent.width

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                text: _title
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: parent.height * 0.33
                wrapMode: "WordWrap"
                color: "white"
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            current_index = "screen3"
            navigator.setSource(current_index)
        }
    }

}
