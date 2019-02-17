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
        fa_value: "Arabic_sheen"
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
        fa_value: "Arabic_seen"
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
        fa_value: "Arabic_yeh"
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
        fa_value: "Arabic_beh"
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
        fa_value: "Arabic_lam"
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
        fa_value: "Arabic_alef"
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
        fa_value: "Arabic_teh"
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
        fa_value: "Arabic_noon"
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
        fa_value: "Arabic_meem"
        fa_label: "م"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "semicolon"
        label: ";"
        alt_value: "colon"
        alt_label: ":"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_keheh"
        fa_label: "ک"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "apostrophe"
        label: "'"
        alt_value: "quotedbl"
        alt_label: "\""
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_gaf"
        fa_label: "گ"
        fa_enable: fa_en
    }
    KeyCell
    {
        width: 117 * scale_factor
        value: "Return"
        label: "Enter"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "Copy"
        label: "\uf0c5"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
}
