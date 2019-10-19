import QtQuick 2.13
import Qt.labs.settings 1.0

import OpenHD 1.0


HUDOverlayGridForm {

    property bool globalDragLock: false

    function configure() {
        console.log("HUDOverlayGrid.configure()");
        settings.sync();

        downlink.visible = settings.value("show_downlink_rssi", true);
        uplink.visible = settings.value("show_uplink_rssi", true);
        bitrate.visible = settings.value("show_bitrate", true);
        ground_status.visible = settings.value("show_ground_status", true);
        air_status.visible = settings.value("show_air_status", true);

        home_distance.visible = settings.value("show_home_distance", true);
        flight_timer.visible = settings.value("show_flight_timer", true)
        flight_mode.visible = settings.value("show_flight_mode", true)
        air_battery.visible = settings.value("show_air_battery", true)
        gps.visible = settings.value("show_gps", true)
        messageHUD.visible = settings.value("show_log_onscreen", true)

        horizonWidget.configure();
        fpvWidget.configure();
    }
}