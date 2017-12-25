import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Screen {

    property string type_view
    property real font_size: device_screen.width * 0.04

    id: screen3

    height: device_screen.height
    width: device_screen.width

    Flickable {
        id: main_background
        width: parent.width
        height: parent.height - header.height - tab.height

        anchors.top: header.bottom

        flickableDirection: Flickable.VerticalFlick
        contentHeight: info_background.height + item_view_header.height + squares_view.height + separate.height + separate1.height + dpMargin * 1.6

        GridView {
            id: squares_view
            width: parent.width * 0.9
            height: device_screen.height * 0.8

            anchors.top: item_view_header.bottom
            anchors.topMargin: dpMargin
            anchors.horizontalCenter: parent.horizontalCenter

            cellWidth: width * 0.5
            cellHeight: cellWidth * 1.2
            flickDeceleration: 500
            snapMode: ListView.SnapToItem
            model: screen3_model
            delegate: Screen3SquaresDelegate {}

            visible: type_view == "squares" ? true : false
        }

        ListView {
            id: stripes_view
            width: parent.width * 0.9
            height: device_screen.height * 0.8

            anchors.top: item_view_header.bottom
            anchors.topMargin: dpMargin
            anchors.horizontalCenter: parent.horizontalCenter

            spacing: dpMargin
            flickDeceleration: 500
            snapMode: ListView.SnapToItem
            model: screen3_model
            delegate: Screen3StripesDelegate {}

            visible: type_view == "stripes" ? true : false
        }

        Rectangle {
            id: separate
            width: parent.width
            height: dpMargin
            color: "white"
            anchors.top: info_background.bottom
        }

        Rectangle {
            id: item_view_header
            width: parent.width * 0.9
            height: device_screen.height * 0.05

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: separate.bottom

            radius: height * 0.2

            layer.enabled: true
            layer.effect: DropShadow {
                radius: 7
                samples: 15
                color: "#40000000"
            }

            Rectangle {
                id: squares_icon_background
                height: parent.height * 0.7
                width: height

                anchors.left: parent.left
                anchors.leftMargin: dpMargin * 3
                anchors.verticalCenter: parent.verticalCenter

                color: "transparent"

                Image {
                    id: squares_icon
                    source: type_view == "squares" ? "qrc:/image/icons/squaresSelected.png" : "qrc:/image/icons/squaresNotSelected.png"

                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    smooth: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(type_view == "stripes") {
                            type_view = "squares"
                        }
                    }
                }
            }

            Rectangle {
                id: stripes_icon_background
                height: parent.height * 0.8
                width: height

                anchors.left: squares_icon_background.right
                anchors.leftMargin: dpMargin
                anchors.verticalCenter: parent.verticalCenter

                color: "transparent"

                Image {
                    id: stripes_icon
                    source: type_view == "stripes" ? "qrc:/image/icons/stripesSelected.png" : "qrc:/image/icons/stripesNotSelected.png"

                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    smooth: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(type_view == "squares") {
                            type_view = "stripes"
                        }
                    }
                }
            }

            Label {
                id: sort

                anchors.right: parent.right
                anchors.rightMargin: dpMargin * 2
                anchors.verticalCenter: parent.verticalCenter

                text: "Сортировать"
                font.pixelSize: parent.height * 0.35
                color: "#888888"
            }
        }

        Rectangle {
            id: separate1
            width: parent.width
            height: dpMargin * 0.6
            color: "white"
            anchors.bottom: info_background.top
        }

        Rectangle {
            id: info_background
            width: parent.width
            height: device_screen.height * 0.4

            anchors.top: separate1.bottom

            color: "#f6f6f6"

            Label {
                id: info

                anchors.top: parent.top
                anchors.topMargin: dpMargin
                anchors.left: parent.left
                anchors.leftMargin: dpMargin * 1.5

                text: "Информация о закyпке"
                font.pixelSize: font_size
                color: "#333333"
            }

            Label {
                id: provider_title

                anchors.top: info.bottom
                anchors.topMargin: dpMargin * 0.5
                anchors.left: parent.left
                anchors.leftMargin: dpMargin * 1.5

                text: "Поставщик:"
                font.pixelSize: font_size
                color: "#7392f6"
            }

            Label {
                id: provider

                anchors.top: info.bottom
                anchors.topMargin: dpMargin * 0.5
                anchors.left: provider_title.right
                anchors.leftMargin: dpMargin * 1.5

                text: "Поставщик"
                font.pixelSize: font_size
                color: "#666666"
            }

            Label {
                id: min_summ_title

                anchors.top: provider_title.bottom
                anchors.topMargin: dpMargin * 0.5
                anchors.left: parent.left
                anchors.leftMargin: dpMargin * 1.5

                text: "Минимальная сyмма:"
                font.pixelSize: font_size
                color: "#7392f6"
            }

            Label {
                id: min_summ

                anchors.top: provider.bottom
                anchors.topMargin: dpMargin * 0.5
                anchors.left: min_summ_title.right
                anchors.leftMargin: dpMargin * 1.5

                text: "15000 рyб."
                font.pixelSize: font_size
                color: "#666666"
            }

            Label {
                id: address_title

                anchors.top: min_summ_title.bottom
                anchors.topMargin: dpMargin * 0.5
                anchors.left: parent.left
                anchors.leftMargin: dpMargin * 1.5

                text: "Адрес самовывоза:"
                font.pixelSize: font_size
                color: "#7392f6"
            }

            Label {
                id: address

                anchors.top: min_summ.bottom
                anchors.topMargin: dpMargin * 0.5
                anchors.left: address_title.right
                anchors.leftMargin: dpMargin * 1.5

                text: "ст. м. Сенная"
                font.pixelSize: font_size
                color: "#666666"
            }

            Rectangle {
                id: low_info_background
                height: parent.height * 0.14
                width: parent.width

                anchors.bottom: parent.bottom
                anchors.bottomMargin: dpMargin

                color: "transparent"

                Label {
                    id: delivery_price

                    anchors.right: parent.right
                    anchors.rightMargin: dpMargin * 1.5
                    anchors.verticalCenter: parent.verticalCenter

                    text: "250 рyб."
                    font.pixelSize: font_size
                    color: "#666666"
                }

                Rectangle {
                    id: delivery_icon_background
                    height: parent.height * 0.85
                    width: height

                    anchors.right: delivery_price.left
                    anchors.rightMargin: dpMargin * 1.5
                    anchors.verticalCenter: parent.verticalCenter

                    color: "transparent"

                    Image {
                        id: delivery_icon
                        source: "qrc:/image/icons/delivery.png"

                        anchors.fill: parent
                        fillMode: Image.PreserveAspectFit

                        smooth: true
                    }
                }

                Label {
                    id: people_count

                    anchors.right: delivery_icon_background.left
                    anchors.rightMargin: dpMargin * 1.5
                    anchors.verticalCenter: parent.verticalCenter

                    text: "15"
                    font.pixelSize: font_size
                    color: "#666666"
                }

                Rectangle {
                    id: people_icon_background
                    height: parent.height * 0.85
                    width: height

                    anchors.right: people_count.left
                    anchors.rightMargin: dpMargin
                    anchors.verticalCenter: parent.verticalCenter

                    color: "transparent"

                    Image {
                        id: people_icon
                        source: "qrc:/image/icons/profileSelected.png"

                        anchors.fill: parent
                        fillMode: Image.PreserveAspectFit

                        smooth: true
                        scale: 0.7
                    }
                }

            }
        }
    }

    Header {
        id: header
        need_back: true
    }

    Tab {
        id: tab
    }

    Component.onCompleted: {
        type_view = "squares"
    }
}
