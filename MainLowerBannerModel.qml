import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ListModel {
    id: model

    ListElement {
        _photo_source: "qrc:/image/item.png"
        _title: "Заголовок"
        _provider_photo: "qrc:/image/item.png"
        _provider: "Поставщик"
    }

    ListElement {
        _photo_source: "qrc:/image/item.png"
        _title: "Заголовок"
        _provider_photo: ""
        _provider: "Поставщик"
    }

    ListElement {
        _photo_source: "qrc:/image/item.png"
        _title: "Заголовок"
        _provider_photo: ""
        _provider: "Поставщик"
    }
}
