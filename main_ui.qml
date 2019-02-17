import QtQuick 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.1
import Qt.labs.settings 1.0

Window {
    id: root
    objectName: "window"
    visible: true
    visibility: Window.FullScreen
    width: 840
    height: 520
    x: 2600
    y: 600
    property bool darkEnbl: false;
    property bool shift_status: false;
    property bool caps_status: false;
    property double scale_factor: 1.52
    property string statusMSG: "Debug Message"
    property bool farsi_en: false;


    color: if (darkEnbl)
    {
       "#161616"
    }
    else
    {
       "#838288"
    }
    title: "Assistant"

    FontLoader
    {
        id: openSans
        source: "qrc:/fonts/OpenSans-Regular.ttf"
    }

    FontLoader
    {
        id: fontAwesome
        source: "qrc:/fonts/fasolid.ttf"
    }
    FontLoader
    {
        id: fontAwesome_brand
        source: "qrc:/fonts/fa-brands-400.ttf"
    }
    FontLoader{ source:"qrc:/fonts/fa-regular-400.ttf" }

    KeyStatus
    {
        id: status_row
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 5 * scale_factor
        anchors.leftMargin: 18 * scale_factor
        message: statusMSG
        onLevelChange: volumeChange(level_val)
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
    }

    KeyRow1
    {
        id: row1
        anchors.top: status_row.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5 * scale_factor
    }

    KeyRow2
    {
        id: row2
        anchors.top: row1.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
    }

    KeyRow3
    {
        id: row3
        anchors.top: row2.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
    }

    KeyRow4
    {
        id: row4
        anchors.top: row3.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
    }

    KeyRow5
    {
        id: row5
        anchors.top: row4.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5 * scale_factor
        anchors.topMargin: 10 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
        fa_en: farsi_en
    }

    KeyRow6
    {
        id: row6
        anchors.top: row5.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
        fa_en: farsi_en
    }

    KeyRow7
    {
        id: row7
        anchors.top: row6.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
        shift_hold: shift_status
        caps_hold: caps_status
        fa_en: farsi_en
    }

    KeyRow8
    {
        id: row8
        anchors.top: row7.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
        shift_hold: shift_status
        caps_hold: caps_status
        fa_en: farsi_en
    }

    KeyRow9
    {
        id: row9
        anchors.top: row8.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
        shift_hold: shift_status
        caps_hold: caps_status
        fa_en: farsi_en
    }

    KeyRow10
    {
        id: row10
        anchors.top: row9.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
    }

    function keyboard_press(key_val)
    {
        keyPress(key_val)
        if (key_val === "Language")
        {
            farsi_en = !farsi_en
        }
    }

    function keyboard_release(key_val)
    {
        keyRelease(key_val)
        if (key_val === "CapsLock")
        {
            caps_status =! caps_status
        }
        else if (key_val === "Shift")
        {
            shift_status = !shift_status
        }
        else if (shift_status)
        {
            shift_status = 0
        }
    }

    function set_connected()
    {
        status_row.connected = true
    }
    function set_disconnected()
    {
        status_row.connected = false
    }

    signal keyPress(string key_value)
    signal keyRelease(string key_value)
    signal volumeChange(int level)

}
