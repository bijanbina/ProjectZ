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
        value: "ff09"
        label: "Tab"
        alt_value: "Shift+Tab"
        alt_label: "STab"
        alt_status: shift_hold
        theme_dark: darkEnbl
        width: 80 * scale_factor
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "0071"
        label: "q"
        alt_value: "Q"
        alt_label: "Q"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05d6"
        fa_label: "ض"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0077"
        label: "w"
        alt_value: "W"
        alt_label: "W"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05d5"
        fa_label: "ص"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0065"
        label: "e"
        alt_value: "E"
        alt_label: "E"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05cb"
        fa_label: "ث"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "72"
        label: "r"
        alt_value: "R"
        alt_label: "R"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05e2"
        fa_label: "ق"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "74"
        label: "t"
        alt_value: "T"
        alt_label: "T"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        font_coeff: default_coeff
        fa_value: "05e1"
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
        fa_value: "05da"
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
        fa_value: "05d9"
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
        fa_value: "05e7"
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
        fa_value: "05ce"
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
        fa_value: "05cd"
        fa_label: "ح"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "005b"
        label: "["
        alt_value: "007b"
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
        fa_value: "05cc"
        fa_label: "ج"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "005d"
        label: "]"
        alt_value: "007d"
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
        fa_value: "1000686"
        fa_label: "چ"
        fa_enable: fa_en
    }
    KeyCell
    {
        width: 88 * scale_factor
        value: "005c"
        label: "\\"
        alt_value: "007c"
        alt_label: "|"
        alt_status: shift_hold || caps_hold
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "1000698"
        fa_label: "ژ"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "ScrollUp"
        label: "\uf102"
        theme_dark: darkEnbl
        width: 60 * scale_factor
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
}
