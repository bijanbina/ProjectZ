import QtQuick 2.2
import QtQuick.Layouts 1.0

Item
{
    property double default_coeff: 0.5;
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)

    id: key_row4
    height: 45 * scale_factor

    //spacing: 4 * scale_factor
    KeyCell
    {
        value: "ff1b"
        label: "Esc"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffbe"
        label: "F1"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffbf"
        label: "F2"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffc0"
        label: "F3"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffc1"
        label: "F4"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffc2"
        label: "F5"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffc3"
        label: "F6"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffc4"
        label: "F7"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffc5"
        label: "F8"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffc6"
        label: "F9"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffc7"
        label: "F10"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffc8"
        label: "F11"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffc9"
        label: "F12"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        font_coeff: default_coeff
        func_key: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        visible: !scroll_en

    }
    KeyCell
    {
        value: "XF86AudioPrev"
        label: "\uf04a"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        width: if (scroll_en)
               {
                   55 * scale_factor
               }
               else
               {
                   43 * scale_factor
               }
        side_margin: if (scroll_en)
                     {
                         5
                     }
                     else
                     {
                         4 * scale_factor
                     }
        font_coeff: default_coeff
        func_key: true
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "XF86AudioStop"
        label: "\uf04d"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        width: 43 * scale_factor
        side_margin: 4 * scale_factor
        font_coeff: default_coeff * 0.9
        func_key: true
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        visible: !scroll_en
    }
    KeyCell
    {
        value: "XF86AudioPlay"
        label: "\uf04b/\uf04c"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        width: if (scroll_en)
               {
                   53 * scale_factor
               }
               else
               {
                   43 * scale_factor
               }
        side_margin: if (scroll_en)
                     {
                         3
                     }
                     else
                     {
                         4 * scale_factor
                     }
        font_coeff: default_coeff * 0.8
        func_key: true
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "XF86AudioNext"
        label: "\uf04e"
        theme_dark: darkEnbl
        height: 35 * scale_factor
        width: if (scroll_en)
               {
                   59 * scale_factor
               }
               else
               {
                   43 * scale_factor
               }
        side_margin: if (scroll_en)
                     {
                         7
                     }
                     else
                     {
                         4 * scale_factor
                     }
        font_coeff: default_coeff
        func_key: true
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }

    function setChildAnchors()
    {
        key_row4.children[0].anchors.left = key_row4.left;
        key_row4.children[0].anchors.verticalCenter= key_row4.verticalCenter
        var j = 1
        for (var i = 1; i < key_row4.children.length; i++)
        {
            if ( (key_row4.children[i].visible) ) //skip invisible items
            {
                key_row4.children[i].anchors.left = key_row4.children[i-j].right
                key_row4.children[i].anchors.leftMargin = 6.7
                key_row4.children[i].anchors.verticalCenter= key_row4.verticalCenter
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
