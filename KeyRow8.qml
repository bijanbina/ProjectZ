import QtQuick 2.2
import QtQuick.Layouts 1.0

RowLayout
{
    property double default_coeff: 0.5;
    property bool caps_hold: false;
    property bool shift_hold: false;
    property bool fa_en: false;
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)

    spacing: 4 * scale_factor
    KeyCell
    {
        value: "CapsLock"
        label: "Caps"
        theme_dark: darkEnbl
        width: 100 * scale_factor
        indic_key: true
        indic_status: caps_hold
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "a"
        label: "a"
        alt_value: "A"
        alt_label: "A"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05d4"
        fa_label: "ش"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "s"
        label: "s"
        alt_value: "S"
        alt_label: "S"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05d3"
        fa_label: "س"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "d"
        label: "d"
        alt_value: "D"
        alt_label: "D"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006"
        fa_label: "ی"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "f"
        label: "f"
        alt_value: "F"
        alt_label: "F"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05c8"
        fa_label: "ب"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "g"
        label: "g"
        alt_value: "G"
        alt_label: "G"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05e4"
        fa_label: "ل"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "h"
        label: "h"
        alt_value: "H"
        alt_label: "H"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05c7"
        fa_label: "ا"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "j"
        label: "j"
        alt_value: "J"
        alt_label: "J"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05ca"
        fa_label: "ت"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "k"
        label: "k"
        alt_value: "K"
        alt_label: "K"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        font_coeff: default_coeff
        fa_value: "05e6"
        fa_label: "ن"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "l"
        label: "l"
        alt_value: "L"
        alt_label: "L"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05e5"
        fa_label: "م"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "003b"
        label: ";"
        alt_value: "003b"
        alt_label: ":"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006a9"
        fa_label: "ک"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0027"
        label: "'"
        alt_value: "0022"
        alt_label: "\""
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006af"
        fa_label: "گ"
        fa_enable: fa_en
    }
    KeyCell
    {
        width: 77 * scale_factor
        value: "ff0d"
        label: "Enter"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "CEnter"
        label: "CE"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        side_margin: -10
        width: 25 * scale_factor
    }
    KeyCell
    {
        value: "ScrollDown"
        label: "\uf103"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        width: 80 * scale_factor
        side_margin: 20
    }
}
