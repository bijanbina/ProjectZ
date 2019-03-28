import QtQuick 2.2
import QtQuick.Layouts 1.0

Item
{
    property double default_coeff: 0.5;
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)
    property bool fa_en: false;

    //spacing: 4 * scale_factor
    id: key_row3
    height: 45 * scale_factor

    KeyCell
    {
        value: "DoubleClick"
        label: "\uf560"
        theme_dark: darkEnbl
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "Mouse2"
        label: "\uf245"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "Mouse3"
        label: "\uf245"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "find"
        label: "\uf002"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        value: "close"
        label: "\uf410"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        value: "new"
        label: "\uf15b"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        value: "`"
        label: "`"
        fa_value: "05c2"
        fa_label: "آ"
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
        fa_value: "Arabic_comma"
        fa_label: "،"
        fa_enable: fa_en
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
        value: "3c"
        label: "<"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "3e"
        label: ">"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "3a"
        label: ":"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "3f"
        label: "?"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_value: "05bf"
        fa_label: "؟"
        fa_enable: fa_en
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
        value: "ffff"
        label: "Delete"
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
        value: "ff57"
        label: "End"
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
        value: "ff56"
        label: "Page\nDown"
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
        key_row3.children[0].anchors.left = key_row3.left;
        var j = 1
        for (var i = 1; i < key_row3.children.length; i++)
        {
            if ( (key_row3.children[i].visible) ) //skip invisible items
            {
                key_row3.children[i].anchors.left = key_row3.children[i-j].right
                key_row3.children[i].anchors.leftMargin = 6.7
                key_row3.children[i].anchors.verticalCenter= key_row3.verticalCenter
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
