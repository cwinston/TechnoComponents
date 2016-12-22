import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item
{
    id:buttonPanel
    width:350
    height: 50
    signal okClicked();
    signal cancelClicked();
    signal saveClicked();

    states: [
        State {
            name: "Ok"

            PropertyChanges {
                target: okButton

                text: "OK"
                opacity: 1
            }

            PropertyChanges {
                target: cancelButton
                opacity: 0
            }
        },
        State {
            name: "OkCancel"

            PropertyChanges {
                target: okButton

                text: "OK"
                opacity: 1
            }

            PropertyChanges {
                target: cancelButton
                text:"Cancel"
                opacity: 1
            }
        },
        State {
            name: "SaveCancel"
            PropertyChanges {
                target: okButton

                text: "Save"
                opacity: 1
            }

            PropertyChanges {
                target: cancelButton
                text:"Cancel"
                opacity: 1
            }
        }
    ]
    property bool showOKButton: true;
    property bool showOKCancel: false;
    property bool showSaveCance: false;

    Row
    {
        id: buttonRow
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width*.95
        height: parent.height
        spacing: 30

        SkinnedButton
        {
            id: cancelButton
            anchors.verticalCenter: parent.verticalCenter
            width: 150
            height: 30
            opacity: 0
            onClicked: button2Clicked();


        }

        SkinnedButton
        {
            id: okButton
            anchors.verticalCenter: parent.verticalCenter
            width: 150
            height: 30
            text: "default"
            opacity: 1
            onClicked: button1Clicked();
        }

    }

    onStateChanged:
    {
        console.log("state changed "+state)
    }

    Component.onCompleted:
    {

    }

    function button1Clicked()
    {
        if (state === "SaveCancel")
        {
             console.log(" [BLC]  save clicked ");
            saveClicked();
        }
        else
        {
             console.log(" [BLC]  ok clicked ");
            okClicked();
        }
    }

    function button2Clicked()
    {
        cancelClicked();
    }

}
