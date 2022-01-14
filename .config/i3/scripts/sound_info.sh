#!/bin/sh
VOLUME_MUTE="🔇"
VOLUME_LOW="🔈"
VOLUME_MID="🔉"
VOLUME_HIGH="🔊"
SOUND_LEVEL=$(pamixer --get-volume-human)
NUMBER=$(pamixer --get-volume-human | tr -d '%')
if [ $NUMBER = "0" ]
then
    ICON="$VOLUME_MUTE"
else
if [ $NUMBER -lt 34 ]
    then
        ICON="$VOLUME_LOW"
elif [ $NUMBER -lt 67 ]
    then
        ICON="$VOLUME_MID"
    else
        ICON="$VOLUME_HIGH"
    fi
fi
echo "$ICON" "$SOUND_LEVEL"
