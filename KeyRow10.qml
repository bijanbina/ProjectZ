import QtQuick 2.2
import QtQuick.Layouts 1.0

Item
{
    property int default_width: 70 * scale_factor;
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)

    id: key_row10
    height: 45 * scale_factor
    //spacing: 5 * scale_factor
    KeyCell
    {
        value: "ffe3"
        label: "Ctrl"
        theme_dark: darkEnbl
        width: default_width
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffeb"
        label: "\uf17a"
        theme_dark: darkEnbl
        width: default_width
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_brand: true
    }
    KeyCell
    {
        value: "ffe9"
        label: "Alt"
        theme_dark: darkEnbl
        width: default_width
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "20"
        label: ""
        theme_dark: darkEnbl
        width: if (scroll_en)
               {
                   195 * scale_factor
               }
               else
               {
                   186 * scale_factor
               }
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffea"
        label: "Alt"
        theme_dark: darkEnbl
        width: default_width
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ff67"
        label: "\uf039"
        theme_dark: darkEnbl
        width: default_width
        visible: !scroll_en
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "ffe4"
        label: "Ctrl"
        theme_dark: darkEnbl
        width: default_width
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: "ff51"
        label: "\uf060"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: if (scroll_en)
               {
                   "ff53"
               }
               else
               {
                   "ff54"
               }
        label: if (scroll_en)
               {
                   "\uf061"
               }
               else
               {
                   "\uf063"
               }
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        width: 60 * scale_factor
        value: if (scroll_en)
               {
                   "ff54"
               }
               else
               {
                   "ff53"
               }
        label: if (scroll_en)
               {
                   "\uf063"
               }
               else
               {
                   "\uf061"
               }
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }

    function setChildAnchors()
    {
        key_row10.children[0].anchors.left = key_row10.left;
        key_row10.children[0].anchors.verticalCenter= key_row10.verticalCenter
        var j = 1
        for (var i = 1; i < key_row10.children.length; i++)
        {
            if ( (key_row10.children[i].visible) ) //skip invisible items
            {
                key_row10.children[i].anchors.left = key_row10.children[i-j].right
                key_row10.children[i].anchors.leftMargin = 7.5
                key_row10.children[i].anchors.verticalCenter= key_row10.verticalCenter
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
