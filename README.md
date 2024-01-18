PulseAudio
==========

[![License](https://img.shields.io/badge/license-GPLv3.0-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.html)
[![GitHub release](https://img.shields.io/github/release/lirios/pulseaudio.svg)](https://github.com/lirios/pulseaudio)
[![GitHub issues](https://img.shields.io/github/issues/lirios/pulseaudio.svg)](https://github.com/lirios/pulseaudio/issues)
[![CI](https://github.com/lirios/pulseaudio/workflows/CI/badge.svg?branch=develop)](https://github.com/lirios/pulseaudio/actions?query=workflow%3ACI)

PulseAudio support for Liri.

## Features

This repository contains:

 * A QML plugin for PulseAudio
 * An indicator for the shell
 * A configuration module for Settings

## Dependencies

Qt >= 6.6.0 with at least the following modules is required:

 * [qtbase](http://code.qt.io/cgit/qt/qtbase.git)
 * [qtdeclarative](http://code.qt.io/cgit/qt/qtdeclarative.git)

The following modules and their dependencies are required:

 * [cmake](https://gitlab.kitware.com/cmake/cmake) >= 3.19.0
 * [liri-settings](https://github.com/lirios/settings)
 * [liri-shell](https://github.com/lirios/shell)
 * [fluid](https://github.com/lirios/fluid) >= 2.0.0
 * [pulseadio](https://cgit.freedesktop.org/pulseaudio/pulseaudio/) >= 5.0.0

## Installation

```sh
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/path/to/prefix ..
make
make install # use sudo if necessary
```

Replace `/path/to/prefix` to your installation prefix.
Default is `/usr/local`.

## Licensing

Licensed under the terms of the GNU General Public License version 3.

## Translations

We use Transifex to translate this project, please submit your
translations [here](https://www.transifex.com/lirios/liri-pulseaudio/dashboard/).

```sh
./scripts/txpush.sh
```

New translations can be pulled from Transifex with:

```sh
./scripts/txpull.sh
```

## Notes

### Logging categories

Qt 5.2 introduced logging categories and Liri Shell takes advantage of
them to make debugging easier.

Please refer to the [Qt](http://doc.qt.io/qt-5/qloggingcategory.html) documentation
to learn how to enable them.

### Available categories

 * PulseAudio QML plugin:
   * **liri.pulseaudio:** PulseAudio.
