import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.0

Item {
    property string value
    property string label
    property string alt_value
    property string alt_label
    property string fa_value
    property string fa_label
    property bool theme_dark: false;
    property bool func_key: false;
    property bool indic_key: false; //indicator key
    property bool indic_status: false; //indicator status
    property bool shift_status: false; //shift status
    property bool alt_status: false; //shift status
    property int side_margin: 5
    property double font_coeff: 0.4;
    property double txt_lineHeight: 1;
    property int txt_yoffset: 0;
    property int font_weight: Font.Normal
    property string font_family: fontAwesome.name
    property bool fa_brand: false
    property bool fa_solid: false
    property bool fa_enable: false
    property bool is_pressed: false

    signal keyPressed(string key_val)
    signal keyReleased(string key_val)

    width: 45 * scale_factor
    height: 45 * scale_factor

    Rectangle
    {
        id: button_rect
        anchors.fill: parent
        anchors.topMargin: 5 * scale_factor
        anchors.bottomMargin: 5 * scale_factor
        anchors.leftMargin: side_margin
        anchors.margins: side_margin
        color: if (theme_dark)
               {
                   if (func_key)
                   {
                       if (is_pressed)
                       {
                          "#334080"
                       }
                       else
                       {
                           "#555"
                       }
                   }
                   else
                   {
                       if (shift_status || is_pressed)
                       {
                          "#4d4f80"
                       }
                       else
                       {
                           "#333"
                       }
                   }
               }
               else
               {
                   if (func_key)
                   {
                       "#c6c5c8"
                   }
                   else
                   {
                       "#e7ebec"
                   }
               }
        radius: 5 * scale_factor

        Rectangle
        {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: 10 * scale_factor
            radius: 5 * scale_factor
            color: if (theme_dark)
                   {
                       if (indic_status)
                       {
                           "#aaa"
                       }
                       else
                       {
                           "#444"
                       }
                   }
                   else
                   {
                       if (indic_status)
                       {
                           "#81cddb"
                       }
                       else
                       {
                           "#c5d8db"
                       }
                   }
            visible: indic_key
        }

        Rectangle
        {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 6 * scale_factor
            width: 5 * scale_factor
            color: if (theme_dark)
                   {
                       if (indic_status)
                       {
                           "#aaa"
                       }
                       else
                       {
                           "#444"
                       }
                   }
                   else
                   {
                       if (indic_status)
                       {
                           "#81cddb"
                       }
                       else
                       {
                           "#c5d8db"
                       }
                   }
            visible: indic_key
        }

        Label
        {
            id: key_lbl
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: txt_yoffset

            text: if(fa_enable)
                  {
                      fa_label
                  }
                  else
                  {
                      if(alt_status)
                      {
                          alt_label
                      }
                      else
                      {
                          label
                      }
                  }

            color: if (theme_dark)
                   {
                       "#ddd"
                   }
                   else
                   {
                      "#161616"
                   }
            font.pixelSize: if(alt_status)
                            {
                                parent.height * font_coeff * 0.9
                            }
                            else
                            {
                                parent.height * font_coeff
                            }
            font.family: if (fa_brand)
                         {
                            fontAwesome_brand.name
                         }
                         else
                         {
                             font_family
                         }
            font.weight: if(fa_solid)
                         {
                            Font.Black
                         }
                         else
                         {
                            font_weight
                         }
            lineHeight: txt_lineHeight
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    MultiPointTouchArea
    {
        anchors.fill: parent
        onPressed:  {
                       is_pressed = true
                       if(fa_enable)
                       {
                           keyPressed(fa_value)
                       }
                       else
                       {
                           if(alt_status)
                           {
                               keyPressed(alt_value)
                           }
                           else
                           {
                               keyPressed(value)
                           }
                       }
                   }
        onReleased: {
                        is_pressed = false
                        if(fa_enable)
                        {
                            keyReleased(fa_value)
                        }
                        else
                        {
                            if(alt_status)
                            {
                                keyReleased(alt_value)
                            }
                            else
                            {
                                keyReleased(value)
                            }
                        }
                    }
    }

}

