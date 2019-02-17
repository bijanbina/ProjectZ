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
        value: "asciitilde"
        label: "~"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "division"
        fa_label: "÷"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "exclam"
        label: "!"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "at"
        label: "@"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "U066C"
        fa_label: "٬"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "numbersign"
        label: "#"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "U066B"
        fa_label: "٫"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "dollar"
        label: "$"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "UFDFC"
        fa_label: "﷼"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "percent"
        label: "%"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_percent"
        fa_label: "٪"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "asciicircum"
        label: "^"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "multiply"
        fa_label: "×"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "ampersand"
        label: "&"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "Arabic_comma"
        fa_label: "،"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "asterisk"
        label: "*"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "parenleft"
        label: "("
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "parenright"
        label: ")"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "underscore"
        label: "_"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "plus"
        label: "+"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "Insert"
        label: "Insert"
        font_coeff: 0.28
        theme_dark: darkEnbl
        side_margin: 5
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 57 * scale_factor
        value: "Home"
        label: "Home"
        font_coeff: 0.3
        font_family: openSans.name
        font_weight: Font.Normal
        txt_lineHeight: 0.85
        side_margin: 3
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        txt_yoffset: -2
    }
    KeyCell
    {
        width: 64 * scale_factor
        value: "Prior"
        label: "Page\nUp"
        font_coeff: 0.3
        font_family: openSans.name
        font_weight: Font.Normal
        txt_lineHeight: 0.85
        theme_dark: darkEnbl
        side_margin: 7
        txt_yoffset: -2
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
}
