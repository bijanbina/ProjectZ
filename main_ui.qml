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
    visibility: Window.FullScreen
    visible: true
    width: 840
    height: 520
    x: 2600
    y: 600
    property bool darkEnbl: settings.dark;
    property bool shift_status: false;
    property bool caps_status: false;
    property double scale_factor: 1.52
    property string statusMSG: "Debug Message"
    property string statusWork: ""
    property bool farsi_en: false;
    property bool scroll_en: true;
    property bool vpn_en: false;
    property double volume_level: 0.5

    Settings
    {
        id: settings
        property bool dark: false
    }


    Component.onDestruction:
    {
       settings.dark = darkEnbl
    }


    color: if (darkEnbl)
    {
       "#161616"
    }
    else
    {
       "#838288"
    }
    title: "ProjectZ"

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
        anchors.left: scrl_cell.right
        anchors.right: parent.right
        anchors.topMargin: 5 * scale_factor
        anchors.leftMargin: 5 * scale_factor
        message: statusMSG
        onLevelChange: volumeChange(level_val)
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
        vol_level: volume_level
    }

    KeyRow1
    {
        id: row1
        anchors.top: status_row.bottom
        anchors.left: scrl_cell.right
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
        fa_en: farsi_en
        statusWin: statusWork
    }

    KeyRow2
    {
        id: row2
        anchors.top: row1.bottom
        anchors.left: scrl_cell.right
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
        fa_en: farsi_en
    }

    KeyRow3
    {
        id: row3
        anchors.top: row2.bottom
        anchors.left: scrl_cell.right
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
        fa_en: farsi_en
    }

    KeyRow4
    {
        id: row4
        anchors.top: row3.bottom
        anchors.left: scrl_cell.right
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
    }

    KeyRow5
    {
        id: row5
        anchors.top: row4.bottom
        anchors.left: scrl_cell.right
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
        anchors.left: scrl_cell.right
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
        fa_en: farsi_en
    }

    KeyRow7
    {
        id: row7
        anchors.top: row6.bottom
        anchors.left: scrl_cell.right
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
        anchors.left: scrl_cell.right
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
        anchors.left: scrl_cell.right
        anchors.leftMargin: 16 * scale_factor
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
        anchors.left: scrl_cell.right
        anchors.leftMargin: 5 * scale_factor
        onRowPressed: keyboard_press(key_value)
        onRowReleased: keyboard_release(key_value)
    }

    ScrollCell
    {
        id: scrl_cell
        anchors.left: parent.left
        anchors.top: parent.top
        theme_dark: darkEnbl
        anchors.leftMargin: -5 * scale_factor
        anchors.topMargin: -10 * scale_factor
        width: if (scroll_en)
               {
                   72 * scale_factor
               }
               else
               {
                   5
               }

        onScrollDown: scrlDown(value)
        onScrollUp: scrlUp(value)
        onKeyPressed: keyboard_press(key_val)
        onKeyReleased: keyboard_release(key_val)
        visible: scroll_en

    }

    function keyboard_press(key_val)
    {
        if (key_val === "ffe1" || key_val === "ffe2") //Shift
        {
            ;
        }
        else
        {
            keyPress(key_val)
        }
        if (key_val === "Language")
        {
            farsi_en = !farsi_en
        }
    }

    function keyboard_release(key_val)
    {
        if (key_val === "ffe1" || key_val === "ffe2") //Shift
        {
            shift_status = !shift_status
            if(shift_status)
            {
                //keyPress(key_val);
                keyPress("ffe1");
            }
            else
            {
                keyRelease("ffe1");
            }
        }
        else
        {
            keyRelease(key_val)
            if (shift_status)
            {
                shift_status = 0
                keyRelease("ffe1");
                //keyRelease("ffe2");
            }
        }
        if (key_val === "Settings")
        {
            darkEnbl = !darkEnbl;
        }
        else if (key_val === "CapsLock")
        {
            caps_status =! caps_status
        }
        else if (key_val === "VolUp")
        {
            volume_level += 0.09
        }
        else if (key_val === "VolDown")
        {
            volume_level -= 0.09
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

    function set_vpnon()
    {
        vpn_en = true
    }
    function set_vpnoff()
    {
        vpn_en = false
    }

    signal keyPress(string key_value)
    signal keyRelease(string key_value)
    signal volumeChange(int level)
    signal scrlUp(int level)
    signal scrlDown(int level)

}
