import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: device_screen
    visible: true

    height: 720
    width: 440

    property int dpHeight: dp(48, "h")
    property int dpMargin: dp(12, "m")

    property int cart_count: 0
    property string current_index: "home"

    property alias main_banner_model: main_banner_model
    property alias main_lowerbanner_model: main_lowerbanner_model
    property alias categories_model: categories_model
    property alias screen3_model: screen3_model

    function dp(inputValue, param) {
        if(device_screen.height > device_screen.width) {
            switch (param) {
                case "h" : return inputValue * device_screen.height / 600
                case "m" : return inputValue * device_screen.height / 1100
            }
        }
        else {
            switch (param) {
            case "h" : return inputValue * device_screen.height / 400
            case "m" : return inputValue * device_screen.height / 550
            }
        }
    }

    Navigator {
        id: navigator
    }

    MainBannerModel {
        id: main_banner_model
    }

    MainLowerBannerModel {
        id: main_lowerbanner_model
    }

    CategoriesModel {
        id: categories_model
    }

    Screen3ViewModel {
        id: screen3_model
    }

    Component.onCompleted: {
        navigator.setSource(current_index)
    }
}
