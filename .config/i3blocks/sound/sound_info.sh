#!/bin/sh

VOLUME_MUTE="🔇"
VOLUME_LOW="🔈"
VOLUME_MID="🔉"
VOLUME_HIGH="🔊"
SOUND_LEVEL=$(pamixer --get-volume-human | cut -c 1-3)

if [ "$SOUND_LEVEL" = "0" ]
then
    ICON="$VOLUME_MUTE"
else
    if [ "$SOUND_LEVEL" -lt 34 ]
    then
        ICON="$VOLUME_LOW"
    elif [ "$SOUND_LEVEL" -lt 67 ]
    then
        ICON="$VOLUME_MID"
    else
        ICON="$VOLUME_HIGH"
    fi
fi

echo "$ICON" "$SOUND_LEVEL"%

