import QtQuick 2.4
import QtQuick.Controls 1.3

Button {
    id: skinnedButton
    property alias text: dsText.text
    width: 150
    height: 30

    onPressedChanged:
    {
        //console.log("pressed changed  "+pressed)
        if (pressed)
        {
            dsText.x = dsText.x + 2;
            dsText.y = dsText.y + 2;
        }
        else
        {
            dsText.x = dsText.x - 2;
            dsText.y = dsText.y - 2;
        }
    }

    onHoveredChanged:
    {
        if (hovered)
        {
            dsText.fontColor = "#ffff00";
        }
        else
        {
            dsText.fontColor = "#ffffff";
        }
    }

    onEnabledChanged:
    {
        if (!enabled)
        {
            buttonBackground.opacity = .65;
            dsText.opacity = .4;
        }
        else
        {
            buttonBackground.opacity = 1;
            dsText.opacity = 1;
        }
    }


    Rectangle {
        id: buttonBackground
        width: (skinnedButton.width < dsText.contentWidth)? dsText.contentWidth+10 : skinnedButton.width
        height: skinnedButton.height
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
    }

    DropShadowText {
        id: dsText
        width: (skinnedButton.width < dsText.contentWidth)? dsText.contentWidth+20 : skinnedButton.width
        height:  (skinnedButton.height < dsText.contentHeight)? dsText.contentHeight+20 : skinnedButton.height
        text: "choose world bounds"
        x: ((parent.width-width) /2)+3;
        y: ((parent.height-height)/2)+3;

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
        if (dsText.contentWidth > skinnedButton.width)
        {
            skinnedButton.width = dsText.width;
        }
    }
}
