#!/usr/bin/env bash
set -uo pipefail
# no `set -e` on the whole script — we handle ffmpeg failures ourselves and clean up

LOG=/tmp/dolphin-flac-audio.log
notify() {
    command -v notify-send >/dev/null 2>&1 && notify-send "$@"
}

for input in "$@"; do
    dir=$(dirname -- "$input")
    base=$(basename -- "$input")
    ext="${base##*.}"

    tmp=$(mktemp --suffix=".$ext" -p "$dir" ".dolphin-flac-XXXXXX") || {
        notify "Audio → FLAC — error" "Could not create a temp file for $input"
        continue
    }

    if ! ffmpeg -nostdin -y -i "$input" \
        -map 0 -c:v copy -c:a flac -c:s copy -c:d copy -c:t copy \
        "$tmp" >>"$LOG" 2>&1; then
        rm -f "$tmp"
        notify "Audio → FLAC — error" "$input left untouched (container may not support FLAC). Log: $LOG"
        continue
    fi

    if [[ ! -s "$tmp" ]]; then
        rm -f "$tmp"
        notify "Audio → FLAC — error" "Empty output, $input left untouched"
        continue
    fi

    mv -f -- "$tmp" "$input"   # atomic replace, same container/name
    notify "Audio → FLAC" "Replaced: $input"
done