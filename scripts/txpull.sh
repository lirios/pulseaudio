#!/bin/bash

# Fetch translations
tx pull --force --all --minimum-perc=5

# Commit to git
if [ "$CI" = "true" ]; then
    AUTHOR="Liri CI <ci@liri.io>"
    SUBJECT="Automatic merge of Transifex translations"
    git config --global push.default simple
    git add --verbose src/indicators/pulseaudio/translations/pulseaudio_*.ts
    git add --verbose src/indicators/pulseaudio/translations/metadata_*.desktop
    git add --verbose src/settings/pulseaudio/translations/pulseaudio_*.ts
    git add --verbose src/settings/pulseaudio/translations/metadata_*.desktop
    git commit --author="$AUTHOR" --message="$SUBJECT"
    git push
fi
