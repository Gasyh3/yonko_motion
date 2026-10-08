#!/bin/bash
# Encode the rendered PNG frames (renders/frames/f00000.png …) into the web deliverables.
# Scrub-friendly: short GOP (keyframe every 10 frames = 0.33 s), no B-frames, faststart,
# bitrate capped so the files stay light enough for a website.
set -euo pipefail
cd "$(dirname "$0")"
IN="renders/frames/f%05d.png"
OUT=renders
ffmpeg -y -loglevel error -framerate 30 -i "$IN" -c:v libx264 -preset slow -crf 14 -pix_fmt yuv420p "$OUT/orbite-master.mp4"
ffmpeg -y -loglevel error -framerate 30 -i "$IN" -c:v libx264 -preset slow -crf 23 -maxrate 4500k -bufsize 9000k -g 10 -keyint_min 10 -sc_threshold 0 -bf 0 \
  -pix_fmt yuv420p -movflags +faststart -an "$OUT/orbite-scrub.mp4"
ffmpeg -y -loglevel error -framerate 30 -i "$IN" -vf scale=1280:720:flags=lanczos -c:v libx264 -preset slow -crf 24 -maxrate 2200k -bufsize 4400k -g 10 -keyint_min 10 \
  -sc_threshold 0 -bf 0 -pix_fmt yuv420p -movflags +faststart -an "$OUT/orbite-mobile.mp4"
PASSLOG="$(mktemp -d)/vp9"
ffmpeg -y -loglevel error -framerate 30 -i "$IN" -c:v libvpx-vp9 -b:v 3500k -g 10 -row-mt 1 -deadline good -cpu-used 4 -pass 1 -passlogfile "$PASSLOG" -an -f null /dev/null
ffmpeg -y -loglevel error -framerate 30 -i "$IN" -c:v libvpx-vp9 -b:v 3500k -g 10 -row-mt 1 -deadline good -cpu-used 4 -pass 2 -passlogfile "$PASSLOG" -an "$OUT/orbite-scrub.webm"
ffmpeg -y -loglevel error -i renders/frames/f00000.png -q:v 3 "$OUT/orbite-poster.jpg"
ls -la "$OUT"/orbite-*
