import QtQuick 2.2
import QtQuick.Layouts 1.0

RowLayout
{
    property double default_coeff: 0.5;
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)
    property bool fa_en: false;

    spacing: 4 * scale_factor
    KeyCell
    {
        value: "`"
        label: "`"
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "1"
        label: "1"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Farsi_1"
        fa_label: "۱"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "2"
        label: "2"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Farsi_2"
        fa_label: "۲"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "3"
        label: "3"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Farsi_3"
        fa_label: "۳"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "4"
        label: "4"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Farsi_4"
        fa_label: "۴"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "5"
        label: "5"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Farsi_5"
        fa_label: "۵"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "6"
        label: "6"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Farsi_6"
        fa_label: "۶"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "7"
        label: "7"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Farsi_7"
        fa_label: "۷"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "8"
        label: "8"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Farsi_8"
        fa_label: "۸"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "9"
        label: "9"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Farsi_9"
        fa_label: "۹"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0"
        label: "0"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Farsi_0"
        fa_label: "۰"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "minus"
        label: "-"
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "equal"
        label: "="
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 123 * scale_factor
        value: "BackSpace"
        label: "Backspace"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "Language"
        label: "En"
        fa_value: "Language"
        fa_label: "Fa"
        fa_enable: fa_en
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
    }
}
