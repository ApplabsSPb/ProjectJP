import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Drawer {
    id: menu
    height: device_screen.height
    width: device_screen.width * 0.9

    dragMargin: 0

    Rectangle {
        id: menu_background
        height: parent.height
        width: parent.width

        color: "#f6f6f6"

        Rectangle {
            id: menu_header_background
            width: parent.width
            height: parent.height * 0.05

            anchors.top: parent.top

            color: "transparent"

            Rectangle {
                id: back_icon_background
                height: parent.height
                width: height

                anchors.right: parent.right

                color: "transparent"

                Image {
                    id: back_icon
                    source: "qrc:/image/backArrowTemp.jpg"

                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    smooth: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        menu.close()
                    }
                }
            }
        }

        Rectangle {
            id: profile_button
            height: (parent.height - dpMargin - menu_header_background.height)/3
            width: (parent.width - dpMargin) * 0.5

            anchors.top: menu_header_background.bottom
            anchors.left: parent.left
            anchors.leftMargin: dpMargin/3

            color: "#7392f6"
            radius: height * 0.05

            Rectangle {
                id: profile_icon_background
                height: parent.height * 0.5
                width: parent.width * 0.5

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                color: "transparent"

                Image {
                    id: profile_icon
                    source: "qrc:/image/profileTemp.jpg"

                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    smooth: true
                }
            }

            Label {
                id: profile_button_title

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: profile_icon_background.bottom
                anchors.topMargin: dpMargin

                text: "PROFILE"
                font.pixelSize: parent.height * 0.1
                color: "#f6f6f6"
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            id: catalog_button
            height: (parent.height - dpMargin - menu_header_background.height)/3
            width: (parent.width - dpMargin) * 0.5

            anchors.top: menu_header_background.bottom
            anchors.left: profile_button.right
            anchors.leftMargin: dpMargin/3

            color: "#7392f6"
            radius: height * 0.05

            Rectangle {
                id: catalog_icon_background
                height: parent.height * 0.5
                width: parent.width * 0.5

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                color: "transparent"

                Image {
                    id: catalog_icon
                    source: "qrc:/image/icons/menuCatalog.png"

                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    smooth: true
                }
            }

            Label {
                id: catalog_button_title

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: catalog_icon_background.bottom
                anchors.topMargin: dpMargin

                text: "CATALOG"
                font.pixelSize: parent.height * 0.1
                color: "#f6f6f6"
                horizontalAlignment: Text.AlignHCenter
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(current_index != "catalog") {
                        current_index = "catalog"
                        navigator.setSource(current_index)
                        menu.close()
                    }
                }
            }
        }

        Rectangle {
            id: sale_button
            height: (parent.height - dpMargin - menu_header_background.height)/3
            width: (parent.width - dpMargin) * 0.5

            anchors.top: profile_button.bottom
            anchors.topMargin: dpMargin/3
            anchors.left: parent.left
            anchors.leftMargin: dpMargin/3

            color: "#7392f6"
            radius: height * 0.05

            Rectangle {
                id: sale_icon_background
                height: parent.height * 0.5
                width: parent.width * 0.5

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                color: "transparent"

                Image {
                    id: sale_icon
                    source: "qrc:/image/icons/menuSale.png"

                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    smooth: true
                }
            }

            Label {
                id: sale_button_title

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: sale_icon_background.bottom
                anchors.topMargin: dpMargin

                text: "SALE"
                font.pixelSize: parent.height * 0.1
                color: "#f6f6f6"
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            id: search_button
            height: (parent.height - dpMargin - menu_header_background.height)/3
            width: (parent.width - dpMargin) * 0.5

            anchors.top: catalog_button.bottom
            anchors.topMargin: dpMargin/3
            anchors.left: sale_button.right
            anchors.leftMargin: dpMargin/3

            color: "#7392f6"
            radius: height * 0.05

            Rectangle {
                id: search_icon_background
                height: parent.height * 0.5
                width: parent.width * 0.5

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                color: "transparent"

                Image {
                    id: search_icon
                    source: "qrc:/image/icons/menuSearch.png"

                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    smooth: true
                }
            }

            Label {
                id: search_button_title

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: search_icon_background.bottom
                anchors.topMargin: dpMargin

                text: "SEARCH"
                font.pixelSize: parent.height * 0.1
                color: "#f6f6f6"
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            id: special_deals_button
            height: (parent.height - dpMargin - menu_header_background.height)/3
            width: (parent.width - dpMargin) * 0.5

            anchors.top: sale_button.bottom
            anchors.topMargin: dpMargin/3
            anchors.left: parent.left
            anchors.leftMargin: dpMargin/3

            color: "#7392f6"
            radius: height * 0.05

            Rectangle {
                id: special_deals_icon_background
                height: parent.height * 0.5
                width: parent.width * 0.5

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                color: "transparent"

                Image {
                    id: special_deals_icon
                    source: "qrc:/image/icons/menuDeals.png"

                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    smooth: true
                }
            }

            Label {
                id: special_deals_button_title

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: special_deals_icon_background.bottom
                anchors.topMargin: dpMargin

                text: "SPECIAL DEALS"
                font.pixelSize: parent.height * 0.1
                color: "#f6f6f6"
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            id: settings_button
            height: (parent.height - dpMargin - menu_header_background.height)/3
            width: (parent.width - dpMargin) * 0.5

            anchors.top: search_button.bottom
            anchors.topMargin: dpMargin/3
            anchors.left: special_deals_button.right
            anchors.leftMargin: dpMargin/3

            color: "#7392f6"
            radius: height * 0.05

            Rectangle {
                id: settings_icon_background
                height: parent.height * 0.5
                width: parent.width * 0.5

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                color: "transparent"

                Image {
                    id: settings_icon
                    source: "qrc:/image/icons/menuSettings.png"

                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit

                    smooth: true
                }
            }

            Label {
                id: settings_button_title

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: settings_icon_background.bottom
                anchors.topMargin: dpMargin

                text: "SETTINGS"
                font.pixelSize: parent.height * 0.1
                color: "#f6f6f6"
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
