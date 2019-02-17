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
        value: "Shift"
        label: "\uf151"
        theme_dark: darkEnbl
        width: 120 * scale_factor
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
        fa_value: "Arabic_zah"
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
        fa_value: "Arabic_tah"
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
        fa_value: "Arabic_zain"
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
        fa_value: "Arabic_ra"
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
        fa_value: "Arabic_thal"
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
        fa_value: "Arabic_dal"
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
        fa_value: "Arabic_peh"
        fa_label: "پ"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "comma"
        label: ","
        alt_value: "less"
        alt_label: "<"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_waw"
        fa_label: "و"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "period"
        label: "."
        alt_value: "greater"
        alt_label: ">"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "slash"
        label: "/"
        alt_value: "question"
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
        value: "Shift"
        label: "\uf151"
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "Up"
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
