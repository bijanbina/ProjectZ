import QtQuick 2.2
import QtQuick.Layouts 1.0

RowLayout
{
    property int default_width: 70 * scale_factor;
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)

    spacing: 5 * scale_factor
    KeyCell
    {
        value: "Ctrl_L"
        label: "Ctrl"
        theme_dark: darkEnbl
        width: default_width
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "Win_L"
        label: "\uf17a"
        theme_dark: darkEnbl
        width: default_width
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_brand: true
    }
    KeyCell
    {
        value: "Alt_L"
        label: "Alt"
        theme_dark: darkEnbl
        width: default_width
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "Space"
        label: ""
        theme_dark: darkEnbl
        width: 180 * scale_factor
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "Alt_R"
        label: "Alt"
        theme_dark: darkEnbl
        width: default_width
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "Menu"
        label: "\uf039"
        theme_dark: darkEnbl
        width: default_width
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "Ctrl_R"
        label: "Ctrl"
        theme_dark: darkEnbl
        width: default_width
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "Left"
        label: "\uf060"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "Down"
        label: "\uf063"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "Right"
        label: "\uf061"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
}
