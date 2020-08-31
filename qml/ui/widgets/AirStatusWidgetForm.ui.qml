import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import Qt.labs.settings 1.0

import OpenHD 1.0

BaseWidget {
    id: airStatusWidget
    width: 112
    height: 24

    visible: settings.show_air_status

    widgetIdentifier: "air_status_widget"

    defaultAlignment: 1
    defaultXOffset: 128
    defaultYOffset: 0
    defaultHCenter: false
    defaultVCenter: false

    hasWidgetDetail: true
    widgetDetailComponent: Column {
        Item {
            width: parent.width
            height: 32
            Text {
                id: opacityTitle
                text: qsTr("Transparency")
                color: "white"
                height: parent.height
                font.bold: true
                font.pixelSize: detailPanelFontPixels
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }
            Slider {
                id: air_status_opacity_Slider
                orientation: Qt.Horizontal
                height: parent.height
                from: .1
                value: settings.air_status_opacity
                to: 1
                stepSize: .1
                anchors.rightMargin: 0
                anchors.right: parent.right
                width: parent.width - 96

                onValueChanged: {
                    settings.air_status_opacity = air_status_opacity_Slider.value
                }
            }
        }
        Item {
            width: parent.width
            height: 32
            Text {
                text: qsTr("Size")
                color: "white"
                height: parent.height
                font.bold: true
                font.pixelSize: detailPanelFontPixels
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }
            Slider {
                id: air_status_size_Slider
                orientation: Qt.Horizontal
                from: .5
                value: settings.air_status_size
                to: 3
                stepSize: .1
                height: parent.height
                anchors.rightMargin: 0
                anchors.right: parent.right
                width: parent.width - 96

                onValueChanged: {
                    settings.air_status_size = air_status_size_Slider.value
                }
            }
        }
    }

    Item {
        id: widgetInner

        anchors.fill: parent
        scale: settings.air_status_size

        Text {
            id: chip_air
            y: 0
            width: 24
            height: 24
            color: settings.color_shape
            opacity: settings.air_status_opacity
            text: "\uf2db"
            anchors.right: cpuload_air.left
            anchors.rightMargin: 2
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Font Awesome 5 Free"
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 14
            horizontalAlignment: Text.AlignRight
            elide: Text.ElideRight
            style: Text.Outline
            styleColor: settings.color_glow
        }


        Text {
            id: cpuload_air
            x: 0
            y: 0
            width: 36
            height: 24
            color: OpenHD.cpuload_air >= 70 ? (OpenHD.cpuload_air >= 80 ? "#ff0000" : "#fbfd15") : settings.color_text
            opacity: settings.air_status_opacity
            text: Number(OpenHD.cpuload_air).toLocaleString(Qt.locale(), 'f', 0) + "%";
            anchors.right: temp_air.left
            anchors.rightMargin: 2
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 14
            font.family: settings.font_text
            horizontalAlignment: Text.AlignRight
            elide: Text.ElideRight
            style: Text.Outline
            styleColor: settings.color_glow
        }
        Text {
            id: temp_air
            x: 0
            y: 4
            width: 36
            height: 24
            color: OpenHD.temp_air >= 65 ? (OpenHD.temp_air >= 75 ? "#ff0000" : "#fbfd15") : settings.color_text
            opacity: settings.air_status_opacity
            text: Number(OpenHD.temp_air).toLocaleString(Qt.locale(), 'f', 0) + "°";
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 14
            font.family: settings.font_text
            horizontalAlignment: Text.AlignRight
            elide: Text.ElideRight
            style: Text.Outline
            styleColor: settings.color_glow
        }
    }
}
