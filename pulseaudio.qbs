import qbs 1.0

Project {
    name: "PulseAudio"

    readonly property string version: "0.9.0"

    readonly property string minimumQtVersion: "5.10.0"

    property bool useStaticAnalyzer: false

    property bool developmentBuild: false
    property string systemdUserUnitDir: ""

    condition: qbs.targetOS.contains("unix") && !qbs.targetOS.contains("darwin") && !qbs.targetOS.contains("android")

    minimumQbsVersion: "1.8.0"

    references: [
        "src/imports/pulseaudio/pulseaudio.qbs",
        "src/indicators/pulseaudio/pulseaudio.qbs",
        "src/settings/pulseaudio/pulseaudio.qbs",
    ]
}
