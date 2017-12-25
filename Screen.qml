import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Page {
    id: screen

    property alias _slaider: slaider

    height: parent.height
    width: parent.width

    background: Rectangle {
        color: "white"
    }

    MenuSlaider {
        id: slaider
    }
}
