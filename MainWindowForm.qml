import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Screen {
    id: main
    height: device_screen.height
    width: device_screen.width

    Flickable {
        id: main_background
        width: parent.width
        height: parent.height - header.height - tab.height

        anchors.top: header.bottom

        flickableDirection: Flickable.VerticalFlick
        contentHeight: main_banner_background.height + ads_background.height + low_1.height + low_2.height + dpMargin
        contentWidth: width

        Rectangle {
            id: main_banner_background
            height: device_screen.height * 0.35
            width: parent.width

            anchors.top: parent.top

            color: "white"

            ListView {
                id: main_banner
                width: parent.width
                height: parent.height * 0.9

                anchors.verticalCenter: parent.verticalCenter

                orientation: ListView.Horizontal
                spacing: dpMargin
                model: main_banner_model
                snapMode: ListView.SnapOneItem;
                flickDeceleration: 500

                highlightRangeMode: ListView.StrictlyEnforceRange
                preferredHighlightBegin: width * 0.075
                preferredHighlightEnd: width * 0.7
                currentIndex: 1

                cacheBuffer: width
                delegate: MainBannerDelegate {
                    is_current: ListView.isCurrentItem
                }

                onCurrentIndexChanged: {
                    if(currentIndex == count - 1) {

                    }
                }
             }
        }

        Rectangle {
            id: ads_background
            width: parent.width
            height: device_screen.height * 0.17

            anchors.top: main_banner_background.bottom
            anchors.topMargin: dpMargin

            color: "#f6f6f6"

            AdsButton {
                id: button_1
                anchors.left: parent.left
                button_color: "#dc5e48"
                button_gradient: "#ff8f7b"
                button_title: "Заголовок"

                MouseArea {
                    id: test
                    anchors.fill: parent
                    onClicked: {
                        if(header.need_back) {
                            header.need_back = false
                        }
                        else {
                            header.need_back = true
                        }
                    }
                }
            }

            AdsButton {
                id: button_2
                anchors.left: button_1.right
                button_color: "#7392f6"
                button_gradient: "#a6c5f9"
                button_title: "Заголовок"
            }

            AdsButton {
                id: button_3
                anchors.left: button_2.right
                button_color: "#767177"
                button_gradient: "#a9a4aa"
                button_title: "Заголовок"
            }

            AdsButton {
                id: button_4
                anchors.left: button_3.right
                button_color: "#973685"
                button_gradient: "#ca69b8"
                button_title: "Заголовок"
            }
        }

        MainLowerBanner {
            id: low_1
            anchors.top: ads_background.bottom
            title_text: "По лyчшей цене"
        }

        MainLowerBanner {
            id: low_2
            anchors.top: low_1.bottom
            title_text: "Закyпка дня"
        }
    }

    Header {
        id: header
    }

    Tab {
        id: tab
    }
}
