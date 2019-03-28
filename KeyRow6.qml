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
        value: if(scroll_en)
               {
                   "ScrollDown"
               }
               else
               {
                   "`"
               }
        label: if(scroll_en)
               {
                   "\uf103"
               }
               else
               {
                   "`"
               }
        fa_value: "05c2"
        fa_label: "آ"
        fa_enable: fa_en && !(scroll_en)
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.9
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        //fa_solid: true
    }
    KeyCell
    {
        value: "0031"
        label: "1"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006f1"
        fa_label: "۱"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0032"
        label: "2"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006f2"
        fa_label: "۲"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0033"
        label: "3"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006f3"
        fa_label: "۳"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0034"
        label: "4"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006f4"
        fa_label: "۴"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0035"
        label: "5"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006f5"
        fa_label: "۵"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0036"
        label: "6"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006f6"
        fa_label: "۶"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0037"
        label: "7"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006f7"
        fa_label: "۷"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0038"
        label: "8"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006f8"
        fa_label: "۸"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0039"
        label: "9"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006f9"
        fa_label: "۹"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0030"
        label: "0"
        theme_dark: darkEnbl
        font_coeff: default_coeff * 0.95
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "10006f0"
        fa_label: "۰"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "002d"
        label: "-"
        theme_dark: darkEnbl
        font_coeff: default_coeff
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "003d"
        label: "="
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 123 * scale_factor
        value: "ff08"
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
