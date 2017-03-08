import QtQuick 2.5

Item
{
   implicitWidth: 14
   implicitHeight: 26
    Rectangle
    {
        anchors.fill: parent;
       gradient: Gradient
       {
           GradientStop { position: 0.027; color: "#020721" }
           GradientStop { position: 0.05;  color: "#142eb0" }
           GradientStop { position: 0.2; color: "lightsteelblue" }
              GradientStop { position: 0.5; color: "#0000ee" }
              GradientStop { position: 0.941; color: "blue" }
              GradientStop { position: 0.986; color: "#000000" }
       }
       //anchors.fill: parent
       anchors.topMargin: 2
       anchors.leftMargin: 1
       anchors.rightMargin: 1
       anchors.bottomMargin: 2
       radius: 5
   }
}
