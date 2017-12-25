import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Rectangle {
    id: delegate
    width: parent.width
    height: device_screen.height * 0.2

    color: "white"
    radius: height * 0.1

    layer.enabled: true
    layer.effect: DropShadow {
        radius: 7
        samples: 15
        color: "#40000000"
    }

    Rectangle {
        id: photo_background
        height: parent.height * 0.9
        width: height

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: dpMargin

        radius: width * 0.1
        visible: false
    }

    Image {
        id: photo
        height: parent.height * 0.9
        width: height
        source: _photo_source

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: dpMargin

        fillMode: Image.PreserveAspectCrop

        smooth: true
        visible: false
    }

    OpacityMask {
        anchors.fill: photo
        source: photo
        maskSource: photo_background
    }

    Label {
        id: title

        anchors.top: parent.top
        anchors.topMargin: dpMargin * 1.5
        anchors.left: photo_background.right
        anchors.leftMargin: dpMargin * 2

        text: _title
        color: "#888888"
        font.pixelSize: parent.height * 0.08
    }

    Label {
        id: price

        anchors.top: title.bottom
        anchors.topMargin: dpMargin * 0.5
        anchors.left: photo_background.right
        anchors.leftMargin: dpMargin * 2

        text: _price
        color: "#7392f6"
        font.pixelSize: parent.height * 0.1
    }

    Label {
        id: info

        anchors.top: price.bottom
        anchors.topMargin: dpMargin * 3
        anchors.left: photo_background.right
        anchors.leftMargin: dpMargin * 2

        text: "Больше информации"
        color: "#888888"
        font.pixelSize: parent.height * 0.08
    }

    Label {
        id: material

        anchors.top: info.bottom
        anchors.topMargin: dpMargin * 0.5
        anchors.left: photo_background.right
        anchors.leftMargin: dpMargin * 2

        text: _material
        color: "#cccccc"
        font.pixelSize: parent.height * 0.08
    }

    Label {
        id: season

        anchors.top: material.bottom
        anchors.topMargin: dpMargin * 0.5
        anchors.left: photo_background.right
        anchors.leftMargin: dpMargin * 2

        text: _season
        color: "#cccccc"
        font.pixelSize: parent.height * 0.08
    }

    Rectangle {
        id: cart_icon_background
        height: parent.height * 0.2
        width: height

        anchors.right: parent.right
        anchors.rightMargin: dpMargin * 1.5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: dpMargin * 1.5

        Image {
            id: cart_icon
            source: _addInCart ? "qrc:/image/icons/addInShoppingCart.png" : "qrc:/image/icons/addedInShoppingCart.png"

            anchors.fill: parent
            fillMode: Image.PreserveAspectFit

            smooth: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(_addInCart) {
                    _addInCart = false
                    --cart_count
                }
                else {
                    _addInCart = true
                    ++cart_count
                }
            }
        }
    }
}
