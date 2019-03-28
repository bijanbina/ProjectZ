import QtQuick 2.2
import QtQuick.Layouts 1.0

RowLayout
{
    property double default_coeff: 0.5;
    property bool scroll_status: false;
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)
    property bool fa_en: false;

    spacing: 4 * scale_factor
    KeyCell
    {
        value: if(scroll_en)
               {
                   "ScrollUp"
               }
               else
               {
                   "007e"
               }
        label: if(scroll_en)
               {
                   "\uf102"
               }
               else
               {
                   "~"
               }
        fa_value: "division"
        fa_label: "÷"
        fa_enable: fa_en && !(scroll_en)
        theme_dark: darkEnbl
        font_coeff: 0.45
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "0021"
        label: "!"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "0040"
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
        value: "0023"
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
        value: "0024"
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
        value: "0025"
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
        value: "005e"
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
        value: "0026"
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
        value: "002a"
        label: "*"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "0028"
        label: "("
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "0029"
        fa_label: "("
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "0029"
        label: ")"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "0028"
        fa_label: ")"
        fa_enable: fa_en
    }
    KeyCell
    {
        value: "005f"
        label: "_"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "002b"
        label: "+"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "fd1d"
        label: "Prt Sc\nSys Rq"
        font_coeff: 0.28
        theme_dark: darkEnbl
        side_margin: 5
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 57 * scale_factor
        value: "ff14"
        label: "Scroll\nLock"
        font_coeff: 0.3
        font_family: openSans.name
        font_weight: Font.Normal
        theme_dark: darkEnbl
        txt_lineHeight: 0.85
        side_margin: 3
        onKeyPressed: {
                        rowPressed(key_val);
                        scroll_status = !scroll_status
                      }
        onKeyReleased: rowReleased(key_val)
        txt_yoffset: -2
        shift_status: scroll_status
    }
    KeyCell
    {
        width: 64 * scale_factor
        value: "ff13"
        label: "Pause\nBreak"
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
