#!/bin/bash
# Encode the rendered PNG frames (renders/frames/f00000.png …) into the web deliverables.
# Scrub-friendly: short GOP (keyframe every 5 frames), no B-frames, faststart.
set -euo pipefail
cd "$(dirname "$0")"
IN="renders/frames/f%05d.png"
OUT=renders
ffmpeg -y -loglevel error -framerate 30 -i "$IN" -c:v libx264 -preset slow -crf 14 -pix_fmt yuv420p "$OUT/orbite-master.mp4"
ffmpeg -y -loglevel error -framerate 30 -i "$IN" -c:v libx264 -preset slow -crf 21 -g 5 -keyint_min 5 -sc_threshold 0 -bf 0 \
  -pix_fmt yuv420p -movflags +faststart -an "$OUT/orbite-scrub.mp4"
ffmpeg -y -loglevel error -framerate 30 -i "$IN" -vf scale=1280:720:flags=lanczos -c:v libx264 -preset slow -crf 23 -g 5 -keyint_min 5 \
  -sc_threshold 0 -bf 0 -pix_fmt yuv420p -movflags +faststart -an "$OUT/orbite-mobile.mp4"
ffmpeg -y -loglevel error -framerate 30 -i "$IN" -c:v libvpx-vp9 -crf 33 -b:v 0 -g 5 -row-mt 1 -deadline good -cpu-used 2 -an "$OUT/orbite-scrub.webm"
ffmpeg -y -loglevel error -i renders/frames/f00000.png -q:v 3 "$OUT/orbite-poster.jpg"
ls -la "$OUT"/orbite-*
