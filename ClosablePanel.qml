import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.2

Item
{
    property alias headerBackGround: headerBackground
    property alias headerText: headerText.text
    property real expectedContentHeight
    property string source
    property QtObject panelLoader
    property QtObject loaderSprite
    property QtObject content
    signal contentLoaded();

    QtObject {
        id:privateProperties
    }

    // property string state: "closed"

    id: closablePanel
    state: "closed"


    width: 450
    height: headerBackground.height + panelBackground.height
    property alias panelBackground: panelBackground

    Rectangle {
        id: headerBackground
        width: closablePanel.width
        height: 30
        radius: 10
        gradient: Gradient
        {
        GradientStop { position: 0.027; color: "#000000" }
        GradientStop { position: 0.05;  color: "#142eb0" }
        GradientStop { position: 0.2; color: "lightsteelblue" }
        GradientStop { position: 0.5; color: "#0000ee" }
        GradientStop { position: 0.941; color: "blue" }
        GradientStop { position: 0.986; color: "#000000" }
    }
}

Rectangle {
    id: panelBackground
    width: closablePanel.width
    height: 0
    anchors.top: headerBackground.bottom
    color: "#00000000"
}

PanelHighlight3D
{
    id: highlight
    width: panelBackground.width
    height: panelBackground.height+3
    bottomShadowColor: "#000000"
    upperShadowColor:"#000000";
    innerRightHighlightColor: "#cecece";
    innerBottomHighlightColor:  "#cecece"
    outerRightShadowColor:"#999999"
    innerLeftShadowColor:"#000000"
    outterUpperHighlightColor: "#444444";
    outerLeftHighlightColor: "#999999";
    y:29
}

Column {
    id: panelLayout
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    width: parent.width
    //  anchors.fill: parent

    Row
    {
        id: header

        //            anchors.top: parent.top
        height: headerBackground.height
        // anchors.horizontalCenter: parent.horizontalCenter
        width: headerBackground.width
        spacing: 40
        Layout.fillWidth: true

        ToolButton
        {
            id: toolButton1
            checkable: true
            //    anchors.verticalCenter: parent.verticalCenter
            //    anchors.verticalCenter: parent.verticalCenter
            //   anchors.left: parent.left
            width: 30
            iconSource: "closablePanelIcon.png"
            onClicked: toggleState();
        }

    }
}



states:
[
State
{
    name: "closed"
    PropertyChanges { target: panelBackground; height:0 }
    PropertyChanges { target: highlight; visible: false; }
},
State
{
    name: "open"
    PropertyChanges { target: panelBackground; height: expectedContentHeight+20 }
    PropertyChanges { target: highlight; visible: true; }
}
]

transitions:
[
Transition
{
    id: openingTransition
    from: "closed"; to: "open"
    ParallelAnimation
    {
        onStopped: addLoader();
        //               PropertyAction { target: panelBackground; property: "visible"; value: true }
        //                NumberAnimation
        //                {
        //                    target: panelBackground
        //                    property: "opacity"
        //                    duration: 300
        //                    easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
        //                }
        NumberAnimation
        {
            id:animDialog_in
            onStopped: addLoader();
            target: panelBackground
            property: "height"
            from: 0
            to: expectedContentHeight
            duration: 400
            easing.type: Easing.OutCubic

        }

    }
    RotationAnimator{
        id:rotateButton_open
        target: toolButton1;
        from: 0;
        to: 90;
        duration: 400
        direction: RotationAnimator.Clockwise
    }

},
Transition
{
    id: closingTransition
    from: "open"; to: "closed"
    SequentialAnimation
    {
        onStarted: removeLoader();
        NumberAnimation
        {
            id:animDialog_out
            target: panelBackground
            property: "height"
            from: expectedContentHeight
            to: 0
            duration: animDialog_in.duration
            easing.type: Easing.OutCubic

        }
        //                PropertyAction { target: panelBackground; property: "visible"; value: false }
        //                NumberAnimation
        //                {
        //                    target: panelBackground
        //                    property: "opacity"
        //                    duration: 200
        //                    easing.type: Easing.Bezier; easing.bezierCurve: [0.4, 0, 0.2, 1, 1, 1]
        //                }
    }
}
]

function open()
{
    if (closablePanel.state == "closed")
    {
        closablePanel.state = "open"
        //     opening()
    }
}

function close()
{
    if (closablePanel.state == "open")
    {
        closablePanel.state = "closed"
        // closing()
    }
}

function toggleState()
{
    console.log("toggle state   "+state)
    if (closablePanel.state == "open")
    {
        console.log("????????????????????   "+loaderSprite.content)
        if (loaderSprite.content)
        {
            loaderSprite.content.visible = false;
        }
        close();
        // hide loader

    }
    else if (closablePanel.state == "closed")
    {
        open();

    }
    console.log("???  "+closablePanel.state)
}

function removeLoader()
{
    loaderSprite.destroy();
}

function addLoader()
{

    // var component =  Qt.createQmlObject('import QtQuick 2.5; Loader {id: "panelLoader"}', panelBackground);
    panelLoader = Qt.createComponent("ContentLoader.qml");

    if (panelLoader.status == Component.Ready)
    {
        finishCreation();
    }
    else
    {
        console.log("adding listener    "+panelLoader.status);
        panelLoader.statusChanged.connect(finishCreation);
    }

}

function finishCreation()
{
    panelLoader.statusChanged.disconnect(finishCreation);
    if (panelLoader.status === Component.Ready)
    {
        loaderSprite = panelLoader.createObject(panelBackground, {id:"panelLoader", x:0, y:0});

        if (loaderSprite == null)
        {
            // Error Handling
            console.log("Error creating object");
        }
    } else if (panelLoader.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", panelLoader.errorString());
    }
    console.log("adding loader    "+panelLoader.loaded+"   "+source);
    //        loaderSprite.width = panelBackground.width;
    //        loaderSprite.height = panelBackground.height*.8
    loaderSprite.source = source;

    loaderSprite.panelLoaded.connect(handlePanelLoaded);
    console.log("adding loader    "+loaderSprite+"   "+panelLoader.width);
}

function handlePanelLoaded()
{
    console.log("loader  has content  "+loaderSprite.content);
    loaderSprite.panelLoaded.disconnect(handlePanelLoaded);
    content = loaderSprite.content;
    contentLoaded();
    //panelBackground.width =  loaderSprite.content.width;
    // panelBackground.height = loaderSprite.content.height;
}

Connections
{
    target:openingTransition

    onRunningChanged:{
        if( openingTransition.running === false)
        {
            //rect.state = "shrinking"
            console.log("????????????????????");

            addLoader();
        }
        else
        {
            //  rotateButton_open.running = true;
        }
    }
}

Connections
{
    target:closingTransition

    onRunningChanged:{
        if( closingTransition.running === false)
        {
            //rect.state = "shrinking"
            console.log("????????????????????   "+loaderSprite.content);
            removeLoader();
        }
        else
        {

        }
    }
}

Connections
{
    id: panelLoadedConnector
    target: loaderSprite

    onPanelLoaded:
    {
        console.log("loader loaded :  ");
        handlePanelLoaded();

    }
}

DropShadowText
{
    id: headerText
    x: 39
    y: 4
    text: qsTr("Text")
    //                anchors.verticalCenter: parent.verticalCenter
    //                horizontalAlignment: Text.AlignHCenter
    //                verticalAlignment: Text.AlignVCenter
    //                font.pixelSize: 24
    width: headerBackground.width - toolButton1.width - 30
    height: headerBackground.height - toolButton1.height
    //  x: toolButton1 + 15
}



}


