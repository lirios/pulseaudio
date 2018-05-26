#!/bin/bash

LUPDATE=${LUPDATE-lupdate}

###
# Update source translation files
###

indicatordir=src/indicators/pulseaudio
mkdir -p $indicatordir/translations
$LUPDATE $indicatordir/contents -ts -no-obsolete $indicatordir/translations/pulseaudio.ts

settingsdir=src/settings/pulseaudio
mkdir -p $settingsdir/translations
$LUPDATE $settingsdir/contents -ts -no-obsolete $settingsdir/translations/pulseaudio.ts

tx push --source --no-interactive
