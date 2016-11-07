import QtQuick 2.0

Item {
    id: dropSbadowText
    property string text: "test"
    property alias fontSize: mainText.font.pixelSize
    property alias horizontalAlignment: mainText.horizontalAlignment
    property alias font: mainText.font.family
    property alias fontColor: mainText.color
    property alias contentWidth: mainText.contentWidth
    property alias contentHeight: mainText.contentHeight
    width: 200
    height: 25
    Text {
        id: text1
        x: 8
        y: 3
        width: dropSbadowText.width - 20
        height: 20
        text: qsTr(dropSbadowText.text)
        horizontalAlignment: mainText.horizontalAlignment
        font.bold: true
        font.pixelSize: mainText.font.pixelSize

        Text {
            id: mainText
            x: -2.5
            y: -2.5
            width: dropSbadowText.width - 20
            height: 20
            color: "#ffffff"
            text: qsTr(dropSbadowText.text)
           // font.family: "Tahoma"
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pixelSize: 16


        }
    }

}
