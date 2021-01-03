import qbs 1.0

LiriIndicator {
    shortName: "pulseaudio"

    Group {
        name: "Metadata"
        files: ["metadata.desktop.in"]
        fileTags: ["liri.desktop.template"]
    }

    Group {
        name: "Metadata Translations"
        files: ["metadata_*.desktop"]
        prefix: "translations/"
        fileTags: ["liri.desktop.translations"]
    }

    Group {
        name: "Contents"
        prefix: "contents/"
        files: [
            "main.qml",
            "MprisItem.qml",
            "VolumeSlider.qml",
        ]
        fileTags: ["liri.indicator.contents"]
    }

    Group {
        name: "Translations"
        files: ["*_*.ts"]
        prefix: "translations/"
    }
}
