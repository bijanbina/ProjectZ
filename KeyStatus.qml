import QtQuick 2.2
import QtQuick.Layouts 1.0

Item
{
    id: row_status
    property bool connected: false;
    property string message: "test"
    signal levelChange(int level_val)
    signal rowPressed(string key_value)
    signal rowReleased(string key_value)

    property bool lock1_status: false;
    property bool lock2_status: false;
    property bool lock3_status: false;
    property double vol_level: 0.5

    //spacing: 4 * scale_factor
    height: 45 * scale_factor


    KeyCell
    {
        value: "Cut"
        label: "\uf0c4"
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
        fa_solid: true
    }
    KeyCell
    {
        value: "Lock2"
        label: if(lock2_status)
               {
                   "\uf13e"
               }
               else
               {
                   "\uf023"
               }
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: {
                         rowReleased(key_val);
                         lock3_status = !lock1_status
                       }
        fa_solid: true
    }
    KeyCell
    {
        value: "Lock3"
        label: if(lock3_status)
               {
                   "\uf13e"
               }
               else
               {
                   "\uf023"
               }
        theme_dark: darkEnbl
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: {
                         rowReleased(key_val);
                         lock3_status = !lock1_status
                       }
        fa_solid: true
    }
    KeyCell
    {
        value: "Settings"
        label: "\uf013"
        theme_dark: darkEnbl
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "Power"
        label: "\uf011"
        theme_dark: darkEnbl
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: ""
        label: message
        theme_dark: darkEnbl

        font_coeff: 0.3
        //onKeyPressed: rowPressed(key_val)
        onKeyReleased: {
                            scroll_en = !scroll_en
                            //row_status.width =
                            //scrl_cell.visible = !scrl_cell.visible
                        }

        width: if (scroll_en)
               {
                   192 * scale_factor
               }
               else
               {
                   242 * scale_factor
               }

        //Layout.maximumWidth: 242 * scale_factor
    }
    KeyCell
    {
        value: "VolDown"
        label: "\uf027"
        theme_dark: darkEnbl
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    KeyCell
    {
        value: "VolUp"
        label: "\uf028"
        theme_dark: darkEnbl
        fa_solid: true
        onKeyPressed: rowPressed(key_val)
        onKeyReleased: rowReleased(key_val)
    }
    Rectangle
    {
        width: 170 * scale_factor
        height: 40 * scale_factor
        color: "Transparent"
        VolumeSlider
        {
            theme_dark: darkEnbl
            anchors.leftMargin: 8 * scale_factor
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            onValueChanged: levelChange(value * 100)
            value: vol_level
        }
    }
    Rectangle
    {
        //anchors.leftMargin: 50
        Rectangle
        {
            anchors.leftMargin: if (scroll_en)
                                {
                                    19 * scale_factor
                                }
                                else
                                {
                                    25 * scale_factor
                                }

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            radius: 10 * scale_factor
            color: if(connected)
                   {
                      "#eee"
                   }
                   else
                   {
                       "#777"
                   }
            height: 20 * scale_factor
            width: 20 * scale_factor
        }

        MultiPointTouchArea
        {
            anchors.fill: parent
            onPressed: rowPressed("ff13")
            onReleased: rowReleased("ff13")
        }

        height: 42 * scale_factor
        width: 55 * scale_factor
        color: "transparent"
    }

    onChildrenChanged: setChildAnchors()

    function setChildAnchors()
    {
        row_status.children[0].anchors.left = row_status.left;
        for (var i = 1; i < row_status.children.length; i++)
        {
            row_status.children[i].anchors.left = row_status.children[i-1].right
            row_status.children[i].anchors.leftMargin = 6.6
            row_status.children[i].anchors.verticalCenter= row_status.verticalCenter
        }
        console.log("this child changed")
    }

    Component.onCompleted: setChildAnchors()

    //on
}
