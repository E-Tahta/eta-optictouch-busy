/*****************************************************************************
 *   Copyright (C) 2017 by Yunusemre Senturk                                 *
 *   <yunusemre.senturk@pardus.org.tr>                                       *
 *                                                                           *
 *   This program is free software; you can redistribute it and/or modify    *
 *   it under the terms of the GNU General Public License as published by    *
 *   the Free Software Foundation; either version 2 of the License, or       *
 *   (at your option) any later version.                                     *
 *                                                                           *
 *   This program is distributed in the hope that it will be useful,         *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           *
 *   GNU General Public License for more details.                            *
 *                                                                           *
 *   You should have received a copy of the GNU General Public License       *
 *   along with this program; if not, write to the                           *
 *   Free Software Foundation, Inc.,                                         *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .          * 
 *****************************************************************************/
import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.0
import eta.helper 1.0


ApplicationWindow {
    id: appwin
    flags: Qt.FramelessWindowHint | Qt.X11BypassWindowManagerHint
    visible: true
    width: Screen.width * 14/100
    minimumWidth: Screen.width * 14/100
    height: Screen.height
    minimumHeight: Screen.height
    opacity: 1
    title: qsTr("Loading Touch Driver")
    x:0
    y:0

    onXChanged: {
        appwin.x = 0
        appwin.y = 0

    }
    onYChanged: {
        appwin.x = 0
        appwin.y = 0
    }    
    Helper {
        id:helper
        onTerminateCalled: fade.start()
    }

    Rectangle {
        id: root
        anchors.fill: parent
        color: "#383838"
        property string sliceColorFirst : "#ff6c00"
        property string sliceColorSecond : "#ff6c00"
        property string baseColor : root.color

        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: {
                fade.start()
            }

        }

        Text {
            id: txtSplash
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: busyIndicator.bottom
                topMargin: 50
            }
            color: "#ffffff"
            text: qsTr("Dokunmatik\nSürücüsü\nBekleniyor")
            font.family: "OpenSymbol"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 14

        }        

        Item {
            id:busyIndicator
            width: appwin.width / 2
            height: busyIndicator.width
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
                verticalCenterOffset: -appwin.width/2
            }

            antialiasing: true
            smooth: true
            property int thick: busyIndicator.width / 11
            property int r: busyIndicator.width
            property int dura: 7200


            Slice {
                rad: busyIndicator.r
                animationDuration: busyIndicator.dura / 5
                thickness: busyIndicator.thick

            }
            Slice {
                rad: busyIndicator.r - busyIndicator.thick * 2
                animationDuration: busyIndicator.dura / 4
                thickness: busyIndicator.thick

            }
            Slice {
                rad: busyIndicator.r - busyIndicator.thick * 4
                animationDuration: busyIndicator.dura / 3
                thickness: busyIndicator.thick

            }
            Slice {
                rad: busyIndicator.r - busyIndicator.thick * 6
                animationDuration: busyIndicator.dura / 2
                thickness: busyIndicator.thick

            }
            Slice {
                rad: busyIndicator.r - busyIndicator.thick * 8
                animationDuration: busyIndicator.dura
                thickness: busyIndicator.thick

            }
        }

    }

    NumberAnimation {
        id: fade
        target: appwin
        property: "opacity"
        easing.type: Easing.InOutQuart
        from: 1.0
        to: 0.0
        duration: 1500
        loops: 1
        onStopped: Qt.quit()
    }

}
