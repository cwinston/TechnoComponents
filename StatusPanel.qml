import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.2
import QtQuick.Controls.Styles 1.4
import TechnoComponents 1.0

Item
{
    id: statusPanel


//    Column
//    {
//        id: columnLayout1
 //       anchors.fill: parent
        Rectangle
        {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0; color: "#ffffff" }
                GradientStop { position: 0.02; color: "#222222" }
                GradientStop { position: 0.4; color: "#444444" }
               // GradientStop { position: 0.7; color: "#575757" }
                GradientStop { position: 0.925; color: "#777777" }
           }

            TextArea
            {
                id: status
                 anchors.fill: parent
              // anchors.bottom: statusPanel.bottom
              //  height: statusPanel.height

                 style: ScrollViewStyle
                 {
                 id:statusScrollStyle
                         transientScrollBars: false
                         handle: SkinnedVerticalScrollHandle
                         {
                             width:24
                             height: 24
                         }//: SkinnedVerticleScrollHandle{};

                         scrollBarBackground: Item
                         {
                             implicitWidth: 24
                             implicitHeight: 26
                             Rectangle
                             {
                                 anchors.fill: parent
                                 gradient: Gradient {
                                     GradientStop { position: 0; color: "#000000" }
                                     GradientStop { position: 0.02; color: "#222222" }
                                     GradientStop { position: 0.4; color: "#444444" }
                                    // GradientStop { position: 0.7; color: "#575757" }
                                     GradientStop { position: 0.925; color: "#777777" }
                                }
                             }
                         }
                         decrementControl: SkinnedImageButton
                         {
                             width:24
                             height: 24
                         }
                         incrementControl: SkinnedImageButton
                         {
                             width:24
                             height: 24
                         }
                     }
            }
        }


 //   }

    function updateStatus(statusMsg, showTime, system)
    {
        console.log("[Status Panel]  status update   "+statusMsg);
        var time;
        if (showTime)
        {
            time = new Date();
        }
        else
        {
            time = "";
        }

        if (system !== "")
        {
            status.text = status.text + time + " [" + system + "] " + statusMsg + "\n";
        }
        else
        {
            status.text = status.text + time + statusMsg + "\n";
        }
    }

    function clearStatus()
    {
        status.text = "";
    }

}
