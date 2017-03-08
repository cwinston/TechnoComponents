import QtQuick 2.5
import QtGraphicalEffects 1.0

Item
{
   implicitWidth: 32
   implicitHeight: 14
   Rectangle
   {
       radius: 5
       anchors.fill: parent
        LinearGradient
        {
           anchors.fill: parent
           start: Qt.point(0, 0)
           end: Qt.point(30, 0)
           gradient: Gradient
           {
               GradientStop { position: 0.027; color: "blue" }
             //  GradientStop { position: 0.05;  color: "#020721" }
               GradientStop { position: 0.2; color: "lightsteelblue" }
                  GradientStop { position: 0.5; color: "blue" }
                  GradientStop { position: 0.941; color: "#142eb0" }
                  GradientStop { position: 0.9; color: "#000000" }
           }
           //anchors.fill: parent
           anchors.topMargin: 2
           anchors.leftMargin: 1
           anchors.rightMargin: 1
           anchors.bottomMargin: 2
           //radius: 5
       }
}
}
