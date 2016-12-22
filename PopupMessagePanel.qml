import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item
{
    id:popUpPanel
    width:600
    height:300
    property alias title: titleText.text;
    property alias message: messageText.text;
    property bool closeOnCancel: false;
    property bool closeOnOk: false;
    property bool useMessageText: true;
    property alias gradient: titleBackground.gradient;
    signal ok();
    signal cancel();
    signal save();

    Rectangle
    {
        id:dropShadow
        opacity: .6;
        visible: highlight.visible;
        width: popUpPanel.width;
        height: popUpPanel.height;
        x:8
        y:8
        color: "#343434"
    }

    Rectangle
    {
        id: panelBackground
        anchors.fill: parent;
        color: "#6b6b6b"
    }
    Rectangle
    {
        id:titleBackground
        width: parent.width;
        anchors.top: parent.top
        height: 40
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#000000" }
            GradientStop { position: 0.027; color: "#ffffff" }
            GradientStop {
                position: 0.05
                color: "#142eb0"
            }

            GradientStop { position: 0.2; color: "lightsteelblue" }
               GradientStop { position: 0.5; color: "#0000ee" }
               GradientStop { position: 0.941; color: "blue" }


               GradientStop {
                   position: 0.986
                   color: "#020721"
               }
        }

        DropShadowText {
            id: titleText
            x: 48
            y: 8
            width: 490
            height: 24
            text: qsTr("Title")
            horizontalAlignment: Text.AlignHCenter

        }
    }

    DropShadowText
    {
        id: messageText
        width:parent.width*.9;
        height: parent.height - 100;

        anchors.top: titleBackground.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.topMargin: 10;
    }

    ButtonLayoutComponent
    {
        id:buttons
        height:50
        width: parent.width*.95
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom;
        state: "Ok"

        onOkClicked:
        {
            console.log(" [popup]  ok clicked ");
            if (closeOnOk)
            {
                popUpPanel.visible = false;
            }
            ok();
        }


        onCancelClicked:
        {
             console.log(" [popup]  cancel clicked ");
            popUpPanel.visible = false;
            cancel();
        }
    }

    PanelHighlight3D
    {
        id:highlight
        anchors.fill: parent
        visible: true;
    }



}
