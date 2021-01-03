// SPDX-FileCopyrightText: 2021 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
//
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.15
import QtQuick.Layouts 1.5
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Fluid.Controls 1.0 as FluidControls
import Liri.Mpris 1.0

FluidControls.ListItem {
    property var player

    topPadding: 16
    bottomPadding: 8

    contentItem: ColumnLayout {
        RowLayout {
            Layout.fillWidth: true

            spacing: FluidControls.Units.smallSpacing * 2

            Item {
                Layout.preferredHeight: 40
                Layout.preferredWidth: 40

                Image {
                    id: albumArt

                    anchors.fill: parent

                    source: player ? player.metadata["mpris:artUrl"] : ""
                    // TODO: Multiply by screen ratio
                    sourceSize.width: width
                    sourceSize.height: height
                    fillMode: Image.PreserveAspectFit
                    visible: status == Image.Ready
                }

                FluidControls.Icon {
                    id: icon
                    anchors.centerIn: parent
                    name: player ? player.iconName : ""
                    source: player ? "" : FluidControls.Utils.iconUrl("image/music_note")
                    visible: !albumArt.visible
                    size: 40
                }
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.fillWidth: true

                spacing: 0

                FluidControls.SubheadingLabel {
                    Layout.fillWidth: true

                    color: Material.primaryTextColor
                    text: player && player.metadata["xesam:title"] || qsTr("Unknown Title")
                    elide: Text.ElideRight
                }

                FluidControls.BodyLabel {
                    Layout.fillWidth: true

                    color: Material.secondaryTextColor
                    elide: Text.ElideRight
                    wrapMode: Text.WordWrap

                    text: player && player.metadata["xesam:artist"] || qsTr("Unknown Artist")
                }
            }
        }

        Row {
            Layout.alignment: Qt.AlignHCenter

            ToolButton {
                ToolTip.text: qsTr("Previous")
                ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
                ToolTip.visible: hovered

                icon.source: FluidControls.Utils.iconUrl("av/skip_previous")
                onClicked: {
                    if (player)
                        player.previous();
                }
            }

            ToolButton {
                ToolTip.text: player.status === "Playing" ? qsTr("Pause") : qsTr("Play")
                ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
                ToolTip.visible: hovered

                icon.source: FluidControls.Utils.iconUrl(player ? (player.status === "Playing" ? "av/pause" : "av/play_arrow") : "")
                onClicked: {
                    if (player)
                        player.playPause();
                }
            }

            ToolButton {
                ToolTip.text: qsTr("Next")
                ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
                ToolTip.visible: hovered

                icon.source: FluidControls.Utils.iconUrl("av/skip_next")
                onClicked: {
                    if (player)
                        player.next();
                }
            }
        }
    }
}
