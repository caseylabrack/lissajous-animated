#!/bin/sh

palette="/tmp/palette.png"
filters="fps=30,scale=320:-1:flags=lanczos"

ffmpeg -v warning -i output/frame-%03d.png -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i output/frame-%03d.png -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $1
