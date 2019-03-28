import QtQuick 2.2
import QtQuick.Layouts 1.0

Item
{
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)
    property bool fa_en: false;
    property string statusWin: ""

    id: key_row1
    height: 45 * scale_factor

    //spacing: 4 * scale_factor
    KeyCell
    {
        value: "Copy"
        label: "\uf0c5"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    /*KeyCell
    {
        value: "Scroll"
        label: "\uf338"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }*/
    KeyCell
    {
        value: "RPaste"
        label: "\uf0ea"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
        fg_dark: "#c8b3a8"
    }
    KeyCell
    {
        value: "Music"
        label: "\uf025"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        value: "Terminal"
        label: "\uf120"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        value: "VPN"
        label: "\uf3ed"
        theme_dark: darkEnbl
        onKeyPressed: {
                        rowPressed(key_val);
                        vpn_en = !vpn_en
                      }
        onKeyReleased: {
                         if ( vpn_en )
                         {
                            rowReleased("VPN")
                         }
                         else
                         {
                            rowReleased("VPF")
                         }
                       }
        fa_solid: true
        shift_status: vpn_en
    }
    KeyCell
    {
        value: "tab"
        label: "\uf55f"
        fa_solid: true
        theme_dark: darkEnbl
        width: if (scroll_en)
               {
                   45 * scale_factor
               }
               else
               {
                   95 * scale_factor
               }
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)

    }
    KeyCell
    {
        value: "Win0"
        label: "\uf17a"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: {
            rowReleased(key_val);
            statusWin = value;
        }
        shift_status: ( statusWin === value )
        fa_brand: true
    }
    KeyCell
    {
        value: "Win1"
        label: "\uf17a"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: {
            rowReleased(key_val);
            statusWin = value;
        }
        shift_status: ( statusWin === value )
        fa_brand: true
    }
    KeyCell
    {
        value: "Win2"
        label: "\uf17a"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: {
            rowReleased(key_val);
            statusWin = value;
        }
        shift_status: ( statusWin === value )
        fa_brand: true
    }
    KeyCell
    {
        value: "Win3"
        label: "\uf17a"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: {
            rowReleased(key_val);
            statusWin = value;
        }
        shift_status: statusWin === value

        fa_brand: true
    }
    KeyCell
    {
        value: "Win4"
        label: "\uf17a"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: {
            rowReleased(key_val);
            statusWin = value;
        }
        shift_status: ( statusWin === value )
        fa_brand: true
    }
    KeyCell
    {
        value: "Win5"
        label: "\uf17a"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: {
            rowReleased(key_val);
            statusWin = value;
        }
        shift_status: ( statusWin === value )
        fa_brand: true
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
        value: "Mon1"
        label: "\uf060"
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
        value: "Mon2"
        label: "\uf063"
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
        value: "Mon3"
        label: "\uf061"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }

    function setChildAnchors()
    {
        key_row1.children[0].anchors.left = key_row1.left;
        for (var i = 1; i < key_row1.children.length; i++)
        {
            key_row1.children[i].anchors.left = key_row1.children[i-1].right
            key_row1.children[i].anchors.leftMargin = 6.6
            key_row1.children[i].anchors.verticalCenter= key_row1.verticalCenter
        }
    }

    Component.onCompleted: setChildAnchors()
}
