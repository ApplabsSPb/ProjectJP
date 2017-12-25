import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Item {
    id: tab
    width: device_screen.width
    height: dpHeight * 0.7

    anchors.bottom: parent.bottom

    Rectangle {
        id: tab_background
        width: parent.width
        height: parent.height

        anchors.fill: parent
        layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: -3
            radius: 9
            samples: 19
            color: "#20000000"
        }

        color: "white"


        ButtonTab {
            id: home_button
            anchors.left: parent.left
            index: "home"
        }

        ButtonTab {
            id: profile_button
            anchors.left: home_button.right
            index: "profile"
        }

        ButtonTab {
            id: favorite_button
            anchors.left: profile_button.right
            index: "favorite"
        }

        ButtonTab {
            id: catalog_button
            anchors.left: favorite_button.right
            index: "catalog"
        }

        ButtonTab {
            id: resale_button
            anchors.left: catalog_button.right
            index: "resale"
        }
    }
}
