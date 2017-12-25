import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {
    id: header

    property bool need_back: false
    property alias headerBackIcon: back_clk
    property alias headerMenuIcon: menu_button_clk

    width: device_screen.width
    height: dpHeight * 1.5

    Rectangle {
        id: menu_background
        height: parent.height * 0.5
        width: parent.width

        color: "white"

        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 3
            radius: 9
            samples: 19
            color: "#20000000"
        }

        Item {
            id: menu_button
            height: parent.height
            width: height

            anchors.left: parent.left

            Image {
                id: menu_icon
                source: "qrc:/image/icons/hamburger.png"

                anchors.fill: parent
                anchors.margins: dpMargin * 1.1
                fillMode: Image.PreserveAspectFit

                smooth: true
            }

            MouseArea {
                id: menu_button_clk
                anchors.fill: parent
            }
        }

        Item {
            id: cart_button
            height: parent.height
            width: height

            anchors.right: parent.right

            Image {
                id: cart_icon
                source: "qrc:/image/icons/shoppingCart.png"

                anchors.fill: parent
                anchors.margins: dpMargin * 1.1
                fillMode: Image.PreserveAspectFit

                smooth: true
            }

            Label {
                id: cart_counter

                anchors.left: parent.left
                anchors.leftMargin: cart_count > 9 ? parent.width * 0.31 : parent.width * 0.4
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.27

                text: cart_count.toString()
                font.pixelSize: parent.height * 0.27
                color: "white"
                horizontalAlignment: Text.AlignHCenter
            }

        }

        Label {
            id: menu_label

            text: "Совместные\nпокупки"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: menu_background.height / 3
            color: "#7392f6"

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        id: search_background

        height: parent.height - menu_background.height
        width: parent.width

        anchors.top: menu_background.bottom

        color: "#f6f6f6"

        Item {
            id: back_button
            height: need_back ? parent.height / 3 : 0
            width: need_back ? height : 0

            anchors.left: parent.left
            anchors.leftMargin: dpMargin
            anchors.verticalCenter: parent.verticalCenter

            visible: need_back ? true : false

            Image {
                id: back_icon
                source: "qrc:/image/icons/arrow.png"

                anchors.fill: parent
                fillMode: Image.PreserveAspectFit

                smooth: true
            }

            MouseArea {
                id: back_clk
                anchors.fill: parent
            }
        }

        Rectangle {
            id: search_field
            height: parent.height * 0.55
            width: need_back ? parent.width - back_button.width - (dpMargin * 5): parent.width - dpMargin * 4
            radius: height

            anchors.right: parent.right
            anchors.rightMargin: dpMargin * 2
            anchors.leftMargin: need_back ? 0 : dpMargin * 2
            anchors.verticalCenter: parent.verticalCenter

            color: "white"

            Item {
                id: search_icon_background
                height: parent.height * 0.6
                width: height

                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: dpMargin * 3

                Image {
                    id: search_icon
                    source: "qrc:/image/icons/search.png"

                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    smooth: true
                }
            }

            TextField {
                id: search_input
                height: parent.height * 1.2
                width: parent.width - (dpMargin * 6) - search_icon_background.width

                anchors.right: parent.right
                anchors.rightMargin: dpMargin * 2
                anchors.verticalCenter: parent.verticalCenter

                background: Item {}
                placeholderText: "Что ищете?"

                font.pixelSize: parent.height * 0.55
                verticalAlignment: Text.AlignVCenter
                color: "#444444"
                clip: true
            }
        }

    }
}
