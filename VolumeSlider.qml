import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.1

Slider {
    value: 0.4
    style: SliderStyle
    {
       groove: Rectangle
               {
                   anchors.left: parent.left
                   implicitHeight: 4
                   opacity: 0.8
                   color: "#fff"
                   Rectangle
                   {
                     anchors.left: parent.left
                     implicitHeight: 4
                     opacity: 0.8
                     width: parent.width * value
                     color: "#63eaea"
                     z:10
                   }
               }
       handle: Rectangle
               {
                   anchors.centerIn: parent
                   width: parent.parent.height
                   height: parent.parent.height
                   color: "#fff"
                   radius: 5 * scale_factor
               }
   }
}
