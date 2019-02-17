import QtQuick 2.2
import QtQuick.Layouts 1.0

RowLayout
{
    property bool connected: false;
    property string message: "test"
    signal levelChange(int level_val)
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)

    spacing: 5 * scale_factor

    Rectangle
    {
        Rectangle
        {
            radius: 10 * scale_factor
            color: if(connected)
                   {
                      "#eee"
                   }
                   else
                   {
                       "#aaa"
                   }
            height: 20 * scale_factor
            width: 20 * scale_factor
        }

        height: 20 * scale_factor
        width: 32 * scale_factor
        color: "transparent"
    }
    KeyCell
    {
        value: "Settings"
        label: "\uf013"
        theme_dark: darkEnbl
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "Power"
        label: "\uf011"
        theme_dark: darkEnbl
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: ""
        label: message
        theme_dark: darkEnbl
        width: 280 * scale_factor
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "Sound"
        label: "\uf6a8"
        theme_dark: darkEnbl
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    Rectangle
    {
        width: 180 * scale_factor
        height: 15 * scale_factor
        color: "Transparent"
        VolumeSlider
        {
            anchors.leftMargin: 8 * scale_factor
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            onValueChanged: levelChange(value * 100)
        }
    }
}
