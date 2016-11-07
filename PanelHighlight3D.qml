import QtQuick 2.4

Item {
    id:panelHighlight
    property alias bottomShadowColor: bottomShadow.color
    property alias upperShadowColor: upperShadow.color
    property alias innerRightHighlightColor: innerRightHighlight.color
    property alias outterUpperHighlightColor: outterUpperHighlight.color
    property alias innerLeftShadowColor: innerLeftShadow.color
    property alias outerRightShadowColor: outerRightShadow.color
    property alias outerLeftHighlightColor: outerLeftHighlight.color
    property alias innerBottomHighlightColor: innerBottomHighlight.color

    height: 140
    width: 400




    Rectangle {
        id: bottomShadow
        x: 0
        y: panelHighlight.height-2
        width: panelHighlight.width
        height: 2
        color: "#00000000"
        border.color: bottomShadow.color
        border.width: 2
    }

    Rectangle {
        id: upperShadow
        x: 0
        y: 2
        width: panelHighlight.width
        height: 2
        color: "#000000"
        border.color: upperShadow.color
        border.width: 2
    }




    Rectangle {
        id: innerRightHighlight
        x: panelHighlight.width-4
        y: 2
        width: 2
        height: panelHighlight.height-4
        color: "#cecece"
        border.color: innerRightHighlight.color
        border.width: 2
    }



    Rectangle {
        id: innerBottomHighlight
        x: 2
        y: panelHighlight.height-4
        width: panelHighlight.width-6
        height: 2
        color: "#999999"
        border.color: innerBottomHighlight.color
        border.width: 2
    }



    Rectangle {
        id: outerLeftHighlight
        x: 0
        y: 0
        width: 2
        height: panelHighlight.height-2
        color: "#999999"
        border.color: outerLeftHighlight.color
        border.width: 1
    }


    Rectangle {
        id: outerRightShadow
        x: panelHighlight.width-2
        y: 0
        width: 2
        height: panelHighlight.height-2
        color: "#000000"
        border.color: outerRightShadow.color
        border.width: 2
    }

    Rectangle {
        id: innerLeftShadow
        x: 2
        y: 2
        width: 2
        height: panelHighlight.height-6
        color: "#000000"
        border.color: innerLeftShadow.color
        border.width: 2
    }

    Rectangle {
        id: outterUpperHighlight
        x: 0
        y: 0
        width: panelHighlight.width-2
        height: 2
        color:  "#cecece"
        border.color: outterUpperHighlight.color
        border.width: 1
    }

}
