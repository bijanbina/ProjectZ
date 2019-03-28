import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.0

Item {
    property string value
    property string label
    property bool theme_dark: false;
    property bool isPressed: false;
    property bool inDrag: false;
    property bool isClick: false;
    property int side_margin: 5
    property double scrll_coeff: 0.1;

    property int touch_y1: 5
    property int touch_y2: 5
    property int touch_starty: 5
    property int touch_startx: 5
    property double startTime: 0

    signal scrollUp(int value)
    signal scrollDown(int value)
    signal keyPressed(string key_val)
    signal keyReleased(string key_val)

    width: 80 * scale_factor
    height: 550 * scale_factor

    Rectangle
    {
        anchors.fill: parent
        anchors.bottomMargin: 5 * scale_factor
        anchors.leftMargin: side_margin
        anchors.margins: side_margin
        color: if (theme_dark)
               {
                   "#333"
               }
               else
               {
                  "#e7ebec"
               }
        border.width: 3
        border.color:if (theme_dark)
                     {
                         "#666"
                     }
                     else
                     {
                        "#e7ebec"
                     }
        radius: 5 * scale_factor


        Label
        {
            id: key_lbl
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            text: label

            color: if (theme_dark)
                   {
                       "#ddd"
                   }
                   else
                   {

                       "#161616"
                   }
            font.pixelSize: parent.height * 0.2
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
    Rectangle
    {
        width: parent.width - 9
        height: parent.height * 0.2
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        color: if (theme_dark)
               {
                   "#222"
               }
               else
               {
                  "#e7ebec"
               }
    }

    MouseArea
    {
        id: mpt1
        anchors.fill: parent
        onPressed: touchStart(mouseY)
        onReleased: touchEnd(mouseY)
        onMouseYChanged: touchChange(mouseY)
    }

    Timer
    {
        id: dragTimer
        interval: 200
        running: false
        repeat: false
        onTriggered: {
                        var diff_start =  mpt1.mouseY - touch_starty
                        if ( Math.abs(diff_start) < 10 )
                        {
                            inDrag = true;
                            keyPressed("Mouse1")
                            //console.debug("Timer Triggered")
                        }
                    }
    }

    function touchStart(mouse_pos)
    {
        touch_y1 = mouse_pos;
        touch_starty = mouse_pos
        isPressed = true;
        if (touch_y1 < 550)
        {
            isClick = true;
            inDrag = false
            dragTimer.start();
        }
        startTime = new Date().getTime();
    }

    function touchChange(mouse_pos)
    {
        if (isPressed)
        {
            touch_y2 = mouse_pos
            var diff =  Math.abs( Math.floor( (touch_y2 - touch_y1) / 5.0 ) )
            if ( diff > 1 )
            {
                var timeNow = new Date().getTime()
                var timeDiff = timeNow - startTime;
                startTime = timeNow;
                if (timeDiff>50)
                {
                    diff = Math.floor( diff / 2 );
                }
                if ( isClick )
                {
                    isClick = false;
                    diff=1;
                }

                //console.log(timeDiff);
                if (inDrag)
                {
                    inDrag = false;
                    keyReleased("Mouse1")
                }

                if ( touch_y2 > touch_y1 )
                {
                    scrollUp(diff);
                }
                else
                {
                    scrollDown(diff);
                }
                touch_y1 = mouse_pos;
            }
        }
    }

    function touchEnd(mouse_pos)
    {
        dragTimer.stop()
        touch_y2 = mouse_pos;
        isPressed = false;
        var diff_start =  touch_y2 - touch_starty
        if ( inDrag )
        {
            keyReleased("Mouse1")
            return;
        }
        else if ( isClick )
        {
            keyPressed("Click1")
            return;
        }

        var diff =  Math.floor( (touch_y2 - touch_y1) / 5.0 )
        if ( Math.abs(diff) > 2 )
        {
            if ( touch_y2 > touch_y1 )
            {
                scrollUp(diff);
            }
            else
            {
                scrollDown(-diff);
            }
            touch_y1 = mouse_pos;
        }
    }

}

