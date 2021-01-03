// SPDX-FileCopyrightText: 2021 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
//
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import Fluid.Controls 1.0 as FluidControls

FluidControls.ListItem {
    contentItem: RowLayout {
        ToolButton {
            icon.source: FluidControls.Utils.iconUrl("av/volume_off")
            onClicked: volumeControl.setMinimumVolume()

            Layout.alignment: Qt.AlignVCenter
        }

        // Remember that position is in the 0:1 range and value is in the 0:100 range
        Slider {
            id: slider

            from: volumeControl.from
            to: volumeControl.to
            stepSize: volumeControl.stepSize
            onPositionChanged: {
                // Change volume on if the handle is pressed to avoid loops
                if (slider.pressed)
                    volumeControl.setVolumePercentage(slider.position * 100.0)
            }

            // Set slider value as soon as the default sink is available
            Connections {
                target: volumeControl
                onVolumeChanged: {
                    // Change the slider value for external events to avoid loops
                    if (!slider.pressed)
                        slider.value = volume
                }

                Component.onCompleted: slider.value = volumeControl.getVolumePercentage()
            }

            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
        }

        ToolButton {
            icon.source: FluidControls.Utils.iconUrl("av/volume_up")
            onClicked: volumeControl.setMaximumVolume()

            Layout.alignment: Qt.AlignVCenter
        }
    }
}
