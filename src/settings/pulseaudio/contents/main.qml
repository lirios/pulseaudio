/****************************************************************************
 * This file is part of Liri.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 * Copyright (C) 2016 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * $BEGIN_LICENSE:GPL3+$
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * $END_LICENSE$
 ***************************************************************************/

import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import Fluid.Core 1.0 as FluidCore
import Fluid.Controls 1.0 as FluidControls
import Liri.Settings 1.0
import Liri.PulseAudio 1.0 as PA

ModulePage {
    header: ToolBar {
        height: bar.height

        TabBar {
            id:bar
            width: parent.width

            TabButton {
                text: qsTr("Volume")
            }

            TabButton {
                text: qsTr("Output")
            }

            TabButton {
                text: qsTr("Input")
            }

            TabButton {
                text: qsTr("Applications")
            }
        }
    }

    PA.SinkModel {
        id: sinkModel
    }

    PA.SourceModel {
        id: sourceModel
    }

    PA.CardModel {
        id: cardModel
    }

    StackLayout {
        anchors.fill: parent
        currentIndex: bar.currentIndex

        VolumePage {}

        OutputPage {}

        InputPage {}

        AppsPage {}
    }
}
