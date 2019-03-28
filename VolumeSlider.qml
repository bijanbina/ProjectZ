import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.1

Slider {
    property bool theme_dark: false;

    value: 0.4
    style: SliderStyle
    {
       groove: Rectangle
               {
                  anchors.left: parent.left
                  implicitHeight: 35
                  opacity: 0.8
                  color: "transparent"
                  Rectangle
                  {
                      anchors.left: parent.left
                      implicitHeight: 4
                      opacity: 0.8
                      width: parent.width
                      anchors.verticalCenter: parent.verticalCenter
                      color: if(theme_dark)
                             {
                                 "#777"
                             }
                             else
                             {
                                 "#fff"
                             }
                      Rectangle
                      {
                        anchors.left: parent.left
                        implicitHeight: 4
                        opacity: 0.8
                        width: parent.width * value
                        color: if(theme_dark)
                               {
                                   "#63eaea"
                               }
                               else
                               {
                                   "#63eaea"
                               }
                        z:10
                      }
                  }
               }
       handle: Rectangle
               {
                   anchors.centerIn: parent
                   width: parent.parent.height/2.5
                   height: parent.parent.height/2.5
                   color: if(theme_dark)
                          {
                            "#aaa"
                          }
                          else
                          {
                            "#fff"
                          }
                   radius: 5 * scale_factor
               }
   }
}
