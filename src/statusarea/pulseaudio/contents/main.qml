// SPDX-FileCopyrightText: 2021 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
//
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import Fluid.Controls 1.0 as FluidControls
import Liri.Shell 1.0 as Shell
import Liri.Mpris 1.0 as Mpris
import Liri.PulseAudio 1.0 as PA

Shell.StatusAreaExtension {
    Mpris.Mpris {
        id: mpris2
    }

    PA.VolumeControl {
        id: volumeControl

        onVolumeChanged: {
            // Show overlay
            Shell.OsdClient.showProgress(volumeControl.getIconName(), volume);
        }
        onMutedChanged: {
            // Show overlay
            Shell.OsdClient.showProgress(volumeControl.getIconName(), muted ? 0 : getVolumePercentage());
        }
    }

    Connections {
        target: MultimediaKeysClient
        onVolumeMute: volumeControl.toggleMute()
        onVolumeUp: volumeControl.increase()
        onVolumeDown: volumeControl.decrease()
    }

    Component {
        id: pageComponent

        Page {
            padding: 0
            header: RowLayout {
                ToolButton {
                    icon.source: FluidControls.Utils.iconUrl("navigation/arrow_back")
                    onClicked: {
                        popFromMenu();
                    }
                }

                FluidControls.TitleLabel {
                    text: qsTr("Music")

                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillWidth: true
                }
            }

            Repeater {
                model: mpris2.players

                MprisItem {
                    player: modelData
                }
            }
        }
    }

    indicator: Shell.Indicator {
        title: qsTr("Sound")
        iconSource: FluidControls.Utils.iconUrl(volumeControl.getIconName())
        visible: volumeControl.visible || mpris2.players.length > 0
    }

    menu: ColumnLayout {
        spacing: 0

        VolumeSlider {
            visible: volumeControl.visible
        }

        FluidControls.ListItem {
            icon.source: FluidControls.Utils.iconUrl("image/music_note")
            text: qsTr("Music")
            visible: mpris2.players.length > 0
            onClicked: {
                pushToMenu(pageComponent);
            }
        }
    }
}
