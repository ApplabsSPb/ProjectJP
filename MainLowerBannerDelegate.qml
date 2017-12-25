import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Rectangle {

    id: delegate
    height: parent.height * 0.9
    width: height

    color: "#f6f6f6"
    radius: height * 0.1

    layer.enabled: true
    layer.effect: DropShadow {
        radius: 7
        samples: 15
        color: "#40000000"
    }

    Rectangle {
        id: photo_background
        width: parent.width * 0.9
        height: parent.height * 0.6

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: dpMargin

        color: "transparent"

        Image {
            id: photo
            source: _photo_source

            anchors.fill: parent
            fillMode: Image.PreserveAspectFit

            smooth: true
        }
    }

    Rectangle {
        id: title_item_background
        width: parent.width * 0.9
        height: parent.height * 0.18

        anchors.top: photo_background.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        color: "transparent"

        Label {
            id: title_item
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

            text: _title
            font.pixelSize: title_item_background * 0.8
            color: "#444444"
        }
    }

    Rectangle {
        id: provider_background
        width: parent.width * 0.9
        height: parent.height * 0.2 - (dpMargin * 1.2)

        anchors.top: title_item_background.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        color: "transparent"

        Rectangle {
            id: provider_photo_background
            height: provider_background.height
            width: height

            anchors.left: parent.left

            color: "grey"
            radius: height

            visible: _provider_photo == "" ? true : false
        }

        Image {
            id: provider_photo
            height: provider_background.height
            width: height
            source: _provider_photo

            anchors.left: parent.left
            fillMode: Image.PreserveAspectCrop

            smooth: true
            visible: false
        }

        OpacityMask {
            anchors.fill: provider_photo
            source: provider_photo
            maskSource: provider_photo_background

            visible: _provider_photo == "" ? false : true
        }

        Label {
            id: provider
            anchors.left: provider_photo_background.right
            anchors.leftMargin: dpMargin * 0.6
            anchors.verticalCenter: parent.verticalCenter

            text: _provider
            font.pixelSize: provider_background.height * 0.6
            color: "#aaaaaa"
        }
    }
}
