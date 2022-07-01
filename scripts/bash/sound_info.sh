#!/bin/sh
VOLUME_MUTE="🔇"
VOLUME_LOW="🔈"
VOLUME_MID="🔉"
VOLUME_HIGH="🔊"
NUMBER=$(pactl list sinks \
    | grep '^[[:space:]]Volume:' \
    | head -n $(( $SINK + 1 )) \
    | tail -n 1 \
    | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
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
echo "$ICON" "$SOUND_LEVEL""%"
