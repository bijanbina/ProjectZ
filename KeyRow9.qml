import QtQuick 2.2
import QtQuick.Layouts 1.0

RowLayout
{
    property double default_coeff: 0.5;
    property bool shift_hold: false;
    property bool caps_hold: false;
    property bool fa_en: false;
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)

    spacing: 4 * scale_factor
    KeyCell
    {
        value: "Language"
        label: "En"
        fa_value: "Language"
        fa_label: "Fa"
        fa_enable: fa_en
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        side_margin: -10
        width: 25 * scale_factor
    }
    KeyCell
    {
        value: "ffe1"
        label: "\uf151"
        theme_dark: darkEnbl
        width: 80 * scale_factor
        font_coeff: default_coeff
        shift_status: shift_hold
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        value: "z"
        label: "z"
        alt_value: "Z"
        alt_label: "Z"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05d8"
        fa_label: "ظ"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "x"
        label: "x"
        alt_value: "X"
        alt_label: "X"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05d7"
        fa_label: "ط"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "c"
        label: "c"
        alt_value: "C"
        alt_label: "C"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05d2"
        fa_label: "ز"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "v"
        label: "v"
        alt_value: "V"
        alt_label: "V"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05d1"
        fa_label: "ر"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "b"
        label: "b"
        alt_value: "B"
        alt_label: "B"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05d0"
        fa_label: "ذ"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "n"
        label: "n"
        alt_value: "N"
        alt_label: "N"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05cf"
        fa_label: "د"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "m"
        label: "m"
        alt_value: "M"
        alt_label: "M"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "100067e"
        fa_label: "پ"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "002c"
        label: ","
        alt_value: "003c"
        alt_label: "<"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05e8"
        fa_label: "و"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "002e"
        label: "."
        alt_value: "003e"
        alt_label: ">"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "002f"
        label: "/"
        alt_value: "003f"
        alt_label: "?"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 82 * scale_factor
        value: "ffe2"
        label: "\uf151"
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
        shift_status: shift_hold
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "ff52"
        label: "\uf062"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "Paste"
        label: "\uf0ea"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
}
