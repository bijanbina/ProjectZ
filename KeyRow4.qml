import QtQuick 2.2
import QtQuick.Layouts 1.0

RowLayout
{
    property double default_coeff: 0.5;
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)

    spacing: 4 * scale_factor
    KeyCell
    {
        value: "Escape"
        label: "Esc"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F1"
        label: "F1"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F2"
        label: "F2"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F3"
        label: "F3"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F4"
        label: "F4"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F5"
        label: "F5"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F6"
        label: "F6"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F7"
        label: "F7"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F8"
        label: "F8"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F9"
        label: "F9"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F10"
        label: "F10"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F11"
        label: "F11"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "F12"
        label: "F12"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "XF86AudioPrev"
        label: "\uf04a"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "XF86AudioStop"
        label: "\uf04d"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        width: 43 * scale_factor
        side_margin: 4 * scale_factor
        font_coeff: default_coeff * 0.9
        func_key: true
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "XF86AudioPlay"
        label: "\uf04b/\uf04c"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        width: 43 * scale_factor
        side_margin: 4 * scale_factor
        font_coeff: default_coeff * 0.8
        func_key: true
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "XF86AudioNext"
        label: "\uf04e"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        width: 43 * scale_factor
        side_margin: 4 * scale_factor
        font_coeff: default_coeff
        func_key: true
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
}
