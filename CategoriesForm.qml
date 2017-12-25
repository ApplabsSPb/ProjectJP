import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Screen {
    id: categoreis
    height: device_screen.height
    width: device_screen.width

    Rectangle {
        id: categories_background
        height: parent.height - (dpHeight * 2.2)
        width: parent.width

        anchors.top: header.bottom

        color: "transparent"

        ListView {
            id: categories_view
            height: parent.height - (dpMargin * 2)
            width: parent.width * 0.9

            anchors.top: parent.top
            anchors.topMargin: dpMargin
            anchors.bottom: parent.bottom
            anchors.bottomMargin: dpMargin
            anchors.horizontalCenter: parent.horizontalCenter

            spacing: dpMargin *2
            flickDeceleration: 500
            snapMode: ListView.SnapToItem
            model: categories_model
            delegate: CategoriesDelegate {}
        }
    }

    Header {
        id: header
    }

    Tab {
        id: tab
    }

    Component.onCompleted: {
        header.need_back = true
    }
}
