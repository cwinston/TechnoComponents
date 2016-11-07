import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0

ComboBox
{
    id: box
    currentIndex: 2
    activeFocusOnPress: true

    style: ComboBoxStyle
    {
        id: comboBox

        label:
            DropShadowText
            {
                id:dsText
               // verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                width: background.width-dropDownButtonWidth
                fontSize: 14
            //    font.family: "Courier"
            //    font.capitalization: Font.SmallCaps
                fontColor: "#fff"
                text: control.currentText
//                Rectangle {
//                    anchors.fill: parent
//                    color: "blue"
//                }
            }

        background:
            Rectangle
            {
                id: rectCategory
                radius: 5
                border.width: 2
                color: "#000"
               // height: label.contentHeight
                width: 200-dropDownButtonWidth
                antialiasing: true

            PanelHighlight3D
            {
                id: buttonHighlight
                width: dropDownButtonWidth+2
                height: rectCategory.height+3
                        bottomShadowColor:  "#000" ;
                        upperShadowColor: "#000000" ;
                        innerRightHighlightColor: "#999999" ;
                        innerBottomHighlightColor: "#999999"
                        outerRightShadowColor: "#000000"
                        innerLeftShadowColor:  "#000000"
                        outterUpperHighlightColor: "#bbbbbb" ;
                        outerLeftHighlightColor:  "#cecece" ;
               x:rectCategory.width-dropDownButtonWidth
               // y:29
               Rectangle
               {
                            width: dropDownButtonWidth-4
                            height: rectCategory.height-3
                            x:2
                            y:2
                   // anchors.fill: parent
                    gradient: Gradient
                    {
                      //  GradientStop { position: 0.027; color: "#000000" }
                        GradientStop { position: 0.05;  color: "#142eb0" }
                        GradientStop { position: 0.2; color: "lightsteelblue" }
                        GradientStop { position: 0.5; color: "#0000ee" }
                        GradientStop { position: 0.841; color: "blue" }
                        GradientStop { position: 0.946; color: "#000000" }
                    }
               }
                Rectangle
                {
                    id: glyph
                    width: 10
                    height: 10
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    color: !control.enabled ? "#DADAD9" : control.hovered ? "#1D5086" : "#5791CD"
                    states: State
                    {
                            name: "inverted"
                            when: __popup.__popupVisible
                            PropertyChanges { target: glyph; rotation: 180 }
                    }

                    transitions: Transition
                    {
                      RotationAnimation { duration: 50; direction: RotationAnimation.Clockwise }
                    }

//                    Image
//                    {
//                      id: imageItem
//                      source: "qrc:/index.png"
//                      anchors.fill: parent
//                    }
                    Canvas
                    {
                        id:triangle
                        antialiasing: true

                        property int triangleWidth: 60
                        property int triangleHeight: 60
                        property color strokeStyle:  "#ffffff"
                        property color fillStyle: "#ffffff"
                        property int lineWidth: 3
                        property bool fill: false
                        property bool stroke: true
                        property real alpha: 1.0

                        onLineWidthChanged:requestPaint();
                        onFillChanged:requestPaint();
                        onStrokeChanged:requestPaint();

                          onPaint: {
                            console.log("MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM")
                              var ctx = getContext("2d");
                              ctx.save();
                              ctx.clearRect(0,0,triangle.width, triangle.height);
                              ctx.strokeStyle = triangle.strokeStyle;
                              ctx.lineWidth = triangle.lineWidth
                              ctx.fillStyle = triangle.fillStyle
                              ctx.globalAlpha = triangle.alpha
                              ctx.lineJoin = "round";
                              ctx.beginPath();

                              // put rectangle in the middle
                              ctx.translate( (0.5 *width - 0.5*triangleWidth),
                                             (0.5 * height - 0.5 * triangleHeight))

                              // draw the rectangle
                              ctx.moveTo(0,triangleHeight/2 ); // left point of triangle
                              ctx.lineTo(triangleWidth, 0);
                              ctx.lineTo(triangleWidth,triangleHeight);

                              ctx.closePath();
                              if (triangle.fill)
                                  ctx.fill();
                              if (triangle.stroke)
                                  ctx.stroke();
                              ctx.restore();
                          }
                            Component.onCompleted:
                            {
                                console.log("triangle width  "+triangle.width)
                                console.log("triangle height  "+triangle.height)
                                triangle.requestPaint();
                            }
                    }
                }
            }

            PanelHighlight3D
            {
                id: highlight
                width: rectCategory.width-dropDownButtonWidth
                height: rectCategory.height+3
                bottomShadowColor: "#000000"
                upperShadowColor:"#000000";
                innerRightHighlightColor: "#cecece";
                innerBottomHighlightColor:  "#cecece"
                outerRightShadowColor:"#999999"
                innerLeftShadowColor:"#000000"
                outterUpperHighlightColor: "#444444";
                outerLeftHighlightColor: "#999999";
               // y:29
            }

            Component.onCompleted:
            {
                console.log("background width: "+rectCategory.width)
                console.log("highlight width: "+highlight.width)
                console.log("dsText width: "+comboBox.label.dsText)
            }
        }


        dropDownButtonWidth: 30


     //   }



        // drop-down customization here
        property Component __dropDownStyle: Style
        {
              property Component frame: Rectangle
              {
                width: (parent ? parent.contentWidth : 0)
                height: (parent ? parent.contentHeight : 0)
              }
              property Component menuItem: Rectangle
            {
                property string textRef: text
                color: "red"
                implicitWidth: textItem.contentWidth
                implicitHeight: textItem.contentHeight + 10
                Rectangle
                {
                      anchors.fill: parent
                      color: selected ? "#B2B2B1" : "#FFFFFF"
                      anchors.margins: 1
                      anchors.topMargin: 0
                    Label
                    {
                        id: textItem
                        text: textRef
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        color: selected ? "#FFFFFF" : "#6F6E6E"
                        font.pixelSize: 12
                        font.family: customFont.name
                    }
                }
            }
        }
    }
    model: ListModel {
        id: cbItems
        ListElement { text: "Banana" }
        ListElement { text: "Apple" }
        ListElement { text: "Coconut" }
    }
    width: 200
    height: 30



}
