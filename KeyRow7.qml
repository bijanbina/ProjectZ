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
        value: "Tab"
        label: "Tab"
        theme_dark: darkEnbl
        width: 80 * scale_factor
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "q"
        label: "q"
        alt_value: "Q"
        alt_label: "Q"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_dad"
        fa_label: "ض"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "w"
        label: "w"
        alt_value: "W"
        alt_label: "W"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_sad"
        fa_label: "ص"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "e"
        label: "e"
        alt_value: "E"
        alt_label: "E"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_theh"
        fa_label: "ث"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "r"
        label: "r"
        alt_value: "R"
        alt_label: "R"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_qaf"
        fa_label: "ق"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "t"
        label: "t"
        alt_value: "T"
        alt_label: "T"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        font_coeff: default_coeff
        fa_value: "Arabic_feh"
        fa_label: "ف"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "y"
        label: "y"
        alt_value: "Y"
        alt_label: "Y"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_ghain"
        fa_label: "غ"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "u"
        label: "u"
        alt_value: "U"
        alt_label: "U"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_ain"
        fa_label: "ع"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "i"
        label: "i"
        alt_value: "I"
        alt_label: "I"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_ha"
        fa_label: "ه"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "o"
        label: "o"
        alt_value: "O"
        alt_label: "O"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_khah"
        fa_label: "خ"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "p"
        label: "p"
        alt_value: "P"
        alt_label: "P"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_hah"
        fa_label: "ح"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "bracketleft"
        label: "["
        alt_value: "braceleft"
        alt_label: "{"
        alt_status: shift_hold || caps_hold
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        font_coeff: if (fa_en)
                    {
                        default_coeff
                    }
                    else
                    {
                        0.4
                    }

        theme_dark: darkEnbl
        fa_value: "Arabic_jeem"
        fa_label: "ج"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "bracketright"
        label: "]"
        alt_value: "braceright"
        alt_label: "}"
        alt_status: shift_hold || caps_hold
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        theme_dark: darkEnbl
        font_coeff: if (fa_en)
                    {
                        default_coeff
                    }
                    else
                    {
                        0.4
                    }
        fa_value: "Arabic_tcheh"
        fa_label: "چ"
        fa_enable: fa_en
    }
    KeyCell
    {
        width: 88 * scale_factor
        value: "backslash"
        label: "\\"
        alt_value: "bar"
        alt_label: "|"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "Cut"
        label: "\uf0c4"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
}
