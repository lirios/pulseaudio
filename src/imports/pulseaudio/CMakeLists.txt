ecm_add_qml_module(PulseAudioQmlPlugin
    URI Liri.PulseAudio
    VERSION 1.0
    CLASS_NAME PulseAudioPlugin
    NO_GENERATE_PLUGIN_SOURCE
    DEPENDENCIES QtQuick
)

target_sources(PulseAudioQmlPlugin
    PRIVATE
        qpulseaudio/card.cpp qpulseaudio/card.h
        qpulseaudio/client.cpp qpulseaudio/client.h
        qpulseaudio/context.cpp qpulseaudio/context.h
        qpulseaudio/debug.cpp qpulseaudio/debug.h
        qpulseaudio/device.cpp qpulseaudio/device.h
        qpulseaudio/maps.cpp qpulseaudio/maps.h
        qpulseaudio/operation.cpp qpulseaudio/operation.h
        qpulseaudio/port.cpp qpulseaudio/port.h
        qpulseaudio/profile.cpp qpulseaudio/profile.h
        qpulseaudio/pulseaudio.cpp qpulseaudio/pulseaudio.h
        qpulseaudio/pulseobject.cpp qpulseaudio/pulseobject.h
        qpulseaudio/ref.cpp qpulseaudio/ref.h
        qpulseaudio/server.cpp qpulseaudio/server.h
        qpulseaudio/sink.cpp qpulseaudio/sink.h
        qpulseaudio/sinkinput.cpp qpulseaudio/sinkinput.h
        qpulseaudio/source.cpp qpulseaudio/source.h
        qpulseaudio/sourceoutput.cpp qpulseaudio/sourceoutput.h
        qpulseaudio/stream.cpp qpulseaudio/stream.h
        qpulseaudio/streamrestore.cpp qpulseaudio/streamrestore.h
        qpulseaudio/volumeobject.cpp qpulseaudio/volumeobject.h
        plugin.cpp
)

ecm_target_qml_sources(PulseAudioQmlPlugin
    SOURCES
        VolumeControl.qml
)

target_include_directories(PulseAudioQmlPlugin PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/qpulseaudio")

target_link_libraries(PulseAudioQmlPlugin PRIVATE Qt6::Qml PkgConfig::Libpulse)

ecm_finalize_qml_module(PulseAudioQmlPlugin)
