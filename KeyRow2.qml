import QtQuick 2.2
import QtQuick.Layouts 1.0

Item
{
    property double default_coeff: 0.5;
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)
    property bool fa_en: false;

    id: key_row2
    height: 45 * scale_factor

    //spacing: 4 * scale_factor
    KeyCell
    {
        value: "Paste"
        label: "\uf0ea"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        value: "SCopy"
        label: "\uf0c5"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
        fg_dark: "#c8c3a8"
    }
    KeyCell
    {
        value: "SPaste"
        label: "\uf0ea"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
        fg_dark: "#c8c3a8"
    }
    KeyCell
    {
        value: "undo"
        label: "\uf0e2"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        value: "redo"
        label: "\uf01e"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        value: "save"
        label: "\uf0c7"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        value: "007e"
        label: "~"
        fa_value: "division"
        fa_label: "÷"
        fa_enable: fa_en
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ampersand"
        label: "&"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        visible: !scroll_en
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
        value: "7b"
        label: "{"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "7d"
        label: "}"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "22"
        label: "\""
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "7c"
        label: "|"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: if (scroll_en)
               {
                   55 * scale_factor
               }
               else
               {
                   60 * scale_factor
               }
        value: "ff63"
        label: "Insert"
        font_coeff: 0.28
        theme_dark: darkEnbl
        side_margin: 5
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: if (scroll_en)
               {
                   53 * scale_factor
               }
               else
               {
                   57 * scale_factor
               }
        value: "ff50"
        label: "Home"
        font_coeff: 0.3
        font_family: openSans.name
        theme_dark: darkEnbl
        font_weight: Font.Normal
        txt_lineHeight: 0.85
        side_margin: 3
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        txt_yoffset: -2
    }
    KeyCell
    {
        width: if (scroll_en)
               {
                   59 * scale_factor
               }
               else
               {
                   64 * scale_factor
               }
        value: "ff55"
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

    function setChildAnchors()
    {
        key_row2.children[0].anchors.left = key_row2.left;
        var j = 1
        for (var i = 1; i < key_row2.children.length; i++)
        {
            if ( (key_row2.children[i].visible) ) //skip invisible items
            {
                key_row2.children[i].anchors.left = key_row2.children[i-j].right
                key_row2.children[i].anchors.leftMargin = 6.7
                key_row2.children[i].anchors.verticalCenter= key_row2.verticalCenter
                if ( j > 1 )
                    j = 1
            }
            else
            {
                j++
            }
            //console.log(j)
        }
    }

    Component.onCompleted: setChildAnchors()
    onVisibleChildrenChanged: setChildAnchors()
}
