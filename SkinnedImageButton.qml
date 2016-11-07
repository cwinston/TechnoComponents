import QtQuick 2.4
import QtQuick.Controls 1.3

Button {
    id: skinnedButton
//    property alias source: buttonImage.source
//    property alias sourceHeight: buttonImage.sourceSize.height
//    property alias sourceWidth: buttonImage.sourceSize.width
    width: 64
    height: 64


    Rectangle {
        id: buttonBackground
        width: skinnedButton.width
        height: skinnedButton.height
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#ffffff" }
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
    }

//    DropShadowText {
//        id: dsText
//        width: (skinnedButton.width < dsText.contentWidth)? dsText.contentWidth+20 : skinnedButton.width
//        height:  (skinnedButton.height < dsText.contentHeight)? dsText.contentHeight+20 : skinnedButton.height
//        text: "choose world bounds"
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.verticalCenterOffset: 3
//        anchors.verticalCenter: parent.verticalCenter
    //    }


    Image {
        id: buttonImage
        x: 0
        y: 0
        width: 32
        height: 32
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false
        source: "closablePanelIcon.png"
    }

    PanelHighlight3D {
        id: panelHighlight3D1
        height: skinnedButton.height
        width: skinnedButton.width
        bottomShadowColor: (!pressed)?  "#000" : "#cecece";
        upperShadowColor: (!pressed)? "#000000" : "#999999";
        innerRightHighlightColor: (!pressed)? "#999999" : "#000000";
        innerBottomHighlightColor: (!pressed)? "#999999" : "#000000"
        outerRightShadowColor:(!pressed)? "#000000" : "#cecece"
        innerLeftShadowColor: (!pressed)? "#000000" : "#999999"
        outterUpperHighlightColor: (!pressed)? "#bbbbbb" : "#000000";
        outerLeftHighlightColor: (!pressed)? "#cecece" : "#000000";
        y: 0
    }


    Component.onCompleted:
    {

    }
}
