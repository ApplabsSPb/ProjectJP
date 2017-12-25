import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {

    property string title_text

    id: background
    width: parent.width
    height: device_screen.height * 0.3

    Rectangle {
        id: header_background
        width: parent.width
        height: parent.height * 0.12

        anchors.top: parent.top
        anchors.topMargin: dpMargin

        Image {
            id: bag_icon
            height: parent.height
            width: height

            anchors.left: parent.left
            anchors.leftMargin: dpMargin
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: dpMargin * 0.4

            source: "qrc:/image/icons/bag.png"
            fillMode: Image.PreserveAspectFit
            smooth: true
        }

        Label {
            id: title
            anchors.left: bag_icon.right
            anchors.leftMargin: dpMargin

            text: title_text
            font.pixelSize: parent.height * 0.6
            color: "#7392f6"
        }

        Image {
            id: plus_icon
            height: parent.height
            width: height

            anchors.right: parent.right
            anchors.rightMargin: dpMargin
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: dpMargin * 0.4

            source: "qrc:/image/icons/plus.png"
            fillMode: Image.PreserveAspectFit
            smooth: true
            scale: 0.8
        }

        Label {
            id: more
            anchors.right: plus_icon.left
            anchors.rightMargin: dpMargin

            text: "больше"
            font.pixelSize: parent.height * 0.7
            color: "#c0ccfb"
        }
    }

    ListView {
        id: lower_banner
        width: parent.width - (dpMargin * 1.5)
        height: parent.height - header_background.height - (dpMargin * 2)

        anchors.top: header_background.bottom
        anchors.topMargin: dpMargin
        anchors.left: parent.left
        anchors.leftMargin: dpMargin * 1.5

        orientation: ListView.Horizontal
        spacing: dpMargin * 2
        flickDeceleration: 500
        model: main_lowerbanner_model
        delegate: MainLowerBannerDelegate {}
    }
}
