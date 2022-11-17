#!/bin/bash -x

INRES=":0.0"
FPS="30"

ffmpeg -f x11grab -i "$INRES" -r "$FPS" -f pulse -ac 2 -i default -vcodec libx264 output.mkv
