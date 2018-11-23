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
import QtQuick.Layouts 1.0

Item {
    id: slice
    property int rad : 100
    property string sliceColorFirst : root.sliceColorFirst ? root.sliceColorFirst : "#ff6c00"
    property string sliceColorSecond : root.sliceColorSecond ? root.sliceColorSecond : "#ff6c00"
    property string baseColor : root.baseColor ? root.baseColor : "#34353a"
    property int animationDuration : 6000
    property int thickness : 6
    anchors.centerIn: parent
    height: parent.rad ? parent.rad - thickness * 2 : rad
    width: slice.height
    antialiasing: true
    smooth: true
    visible: true
    Canvas {
        id:outer
        anchors.fill: parent
        antialiasing: true
        smooth: true
        height: slice.height
        width: outer.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            var centreX = outer.height / 2;
            var centreY = outer.height / 2;

            ctx.beginPath();
            ctx.fillStyle = sliceColorFirst;
            ctx.moveTo(centreX, centreY);
            ctx.arc(centreX, centreY, outer.height / 2, Math.PI * 5 / 4, Math.PI * 7 / 4, false);
            ctx.lineTo(centreX, centreY);
            ctx.fill();

            ctx.beginPath();
            ctx.fillStyle = sliceColorSecond;
            ctx.moveTo(centreX, centreY);
            ctx.arc(centreX, centreY, outer.height / 2, Math.PI / 4, Math.PI * 3 / 4, false);
            ctx.lineTo(centreX, centreY);
            ctx.fill();

        }

        Rectangle {
            id:inner
            anchors.centerIn: parent
            antialiasing: true
            smooth: true
            height: outer.height - thickness
            width: inner.height
            radius: inner.height / 2
            color: baseColor
        }

    }

    NumberAnimation on rotation{
        duration: animationDuration
        from: 0
        to: 360
        loops: Animation.Infinite
    }

}
