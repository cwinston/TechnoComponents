import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0

ComboBox {
        id: comboBox
        implicitWidth: 210
        implicitHeight: 30
        width: 210
        height: 30

        FontLoader { id: labelFont; source: "../fonts/Exo-Regular.otf" }

        style: ComboBoxStyle
        {
            id: comboBoxStyle
            background: Rectangle
            {
                id: background
                width: bgTxtContainer.width
                height: control.height
                color:"transparent"
                Row
                {
                    id: bgRow
                    anchors.fill: parent
                    Rectangle
                    {
                        id: bgTxtContainer
                        width: control.width-2
                        height: control.height-1
                        radius: 8
                        color: "#999"
                        opacity: .6

                        Image
                        {
                            id:dropdownIcon
                            source:"closablePanelIcon.png";
                            width: sourceSize.width
                            height: sourceSize.height
                            sourceSize.width: 25
                            sourceSize.height: 25
                            anchors.verticalCenter: parent.verticalCenter;
                            anchors.right: parent.right
                            anchors.rightMargin: 2.5
                            rotation: 90
                        }

                        PanelHighlight3D
                        {
                            id: highlight
                            width: control.width - dropdownIcon.width
                            height: control.height
                            bottomShadowColor: "#000000"
                            upperShadowColor:"#000000";
                            innerRightHighlightColor: "#cecece";
                            innerBottomHighlightColor:  "#cecece"
                            outerRightShadowColor:"#999999"
                            innerLeftShadowColor:"#000000"
                            outterUpperHighlightColor: "#444444";
                            outerLeftHighlightColor: "#999999";
                        }
                    }
                }
          }
            renderType: Text.QtRendering
            label: Rectangle {
                     id: labelContainer
                     anchors.horizontalCenter: parent.horizontalCenter;
                     anchors.verticalCenter: parent.verticalCenter;
                     color: "transparent"

                    DropShadowText {
                        id:comboBoxText
                         horizontalAlignment: Text.AlignLeft
                         anchors.verticalCenter: parent.verticalCenter;
                         text: control.currentText
                     }
                }

            font: labelFont.name
            textColor: "white"
            property Component __dropDownStyle: MenuStyle {
                __maxPopupHeight: 250
                __menuItemType: "comboboxitem"

                property Component frame: Rectangle {
                    color: "#555"
                    width: control.width
                    height: 200
                    radius: 5
                }

                itemDelegate.label:
                            DropShadowText {
                                 id:styledDelegateLabel
                               //  verticalAlignment: Text.AlignVCenter
                                 horizontalAlignment: Text.AlignLeft
                                 width: background.width;
                        height:30
                                // color: styleData.selected ? "yellow" :  "white"
                                 text: styleData.text
                             }

                    itemDelegate.background: Rectangle {
                        radius: 2
                        opacity: .4
                        width: 128
                        height: styledDelegateLabel.implicitHeight + 2
                        color: styleData.selected ? "#555" : "transparent"
                }

                __scrollerStyle: ScrollViewStyle
                {
                    id:statusScrollStyle
                    transientScrollBars: false
                    handle: Rectangle
                    {
                        radius: 10
                        implicitWidth: 4
                        implicitHeight: 200
                        color: "#D7D7D7"
                    }

                    scrollBarBackground: Rectangle
                    {
                        id: sbBackground
                        implicitWidth: 4
                        implicitHeight: 200
                        color: "#D7D7D7"
                        opacity: .4
                    }

                   corner: Rectangle
                   {
                      visible: false
                   }
                    decrementControl: Rectangle
                    {
                          enabled : false;
                    }

                    incrementControl: Rectangle
                    {
                          enabled: false;
                    }
                }
            }
        }
    }
