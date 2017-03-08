import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0

TextField
{
    id: txtField
    property alias bottomShadowColor: highlight2.bottomShadowColor
    property alias upperShadowColor: highlight2.upperShadowColor
    property alias innerRightHighlightColor: highlight2.innerRightHighlightColor
    property alias outterUpperHighlightColor: highlight2.outterUpperHighlightColor
    property alias innerLeftShadowColor: highlight2.innerLeftShadowColor
    property alias outerRightShadowColor: highlight2.outerRightShadowColor
    property alias outerLeftHighlightColor: highlight2.outerLeftHighlightColor
    property alias innerBottomHighlightColor: highlight2.innerBottomHighlightColor
    property bool invalid: false
    width: 111
    height: 25
    font.pointSize: 12

    onInvalidChanged:
    {
        if (invalid)
        {
            innerBottomHighlightColor = "red";
            outerLeftHighlightColor = "red";
            outterUpperHighlightColor = "red";
            innerRightHighlightColor = "red";
        }
        else
        {
            innerBottomHighlightColor =  "#000000";
            outerLeftHighlightColor =  "#000000";
            outterUpperHighlightColor =  "#000000";
            innerRightHighlightColor =  "#000000";
        }
    }

 //   property alias fontSize: textField..pointSize
 //   property alias font: font.

    PanelHighlight3D
    {
        id: highlight2
        width: txtField.width
        height: txtField.height+3
        bottomShadowColor: "#999999";
        upperShadowColor:"#999999";
        innerRightHighlightColor: "#000000";
        innerBottomHighlightColor:  "#000000"
        outerRightShadowColor:"#999999"
        innerLeftShadowColor:"#999999"
        outterUpperHighlightColor: "#000000";
        outerLeftHighlightColor: "#000000";

    }

    style: TextFieldStyle
    {
            id: insetStyle
            textColor: (control.enabled)? "black" : "#777";
            background: Rectangle
            {
                id: background
                radius: 2
                implicitWidth: 100
                implicitHeight: 24
                border.color: "#333"
                border.width: 1
                color: "#fff"


            }
        }
}


