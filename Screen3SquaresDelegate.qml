import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Rectangle {
    id: delegate
    width: (device_screen.width * 0.9) * 0.5
    height: width * 1.2

    color: "transparent"

    layer.enabled: true
    layer.effect: DropShadow {
        radius: 7
        samples: 15
        color: "#40000000"
    }

    Rectangle {
        id: delegate_background

        anchors.fill: parent
        anchors.margins: dpMargin * 2

        radius: width * 0.1
        color: "white"

        Rectangle {
            id: photo_background
            width: parent.width * 0.8
            height: width

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: dpMargin

            radius: width * 0.1
            visible: false
        }

        Image {
            id: photo
            width: parent.width * 0.8
            height: width
            source: _photo_source

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: dpMargin

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

            anchors.top: photo_background.bottom
            anchors.topMargin: dpMargin * 0.5
            anchors.left: parent.left
            anchors.leftMargin: dpMargin * 1.5

            text: _title
            color: "#888888"
            font.pixelSize: parent.height * 0.06
        }

        Label {
            id: price

            anchors.top: title.bottom
            anchors.topMargin: dpMargin * 0.5
            anchors.left: parent.left
            anchors.leftMargin: dpMargin * 1.5

            text: _price
            color: "#7392f6"
            font.pixelSize: parent.height * 0.08
        }

        Rectangle {
            id: cart_icon_background
            width: parent.width * 0.15
            height: width

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
}
