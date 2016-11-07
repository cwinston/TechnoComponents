import QtQuick 2.0

Item
{
    property alias source : pageLoader.source
    property alias content: pageLoader.item
    property Item component
    signal panelLoaded();

    anchors.fill: parent
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

    Loader
    {
        id: pageLoader
        asynchronous: true
        focus: true
        anchors.fill: parent
        onLoaded: handleLoaded();
    }

    function handleLoaded()
    {
        console.log("handle loaded")
        panelLoaded();
    }

    Component.onCompleted:
    {
        console.log("pageLoader  "+source)
    }
}
