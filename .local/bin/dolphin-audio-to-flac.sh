#!/usr/bin/env bash
set -uo pipefail

LOG=/tmp/dolphin-flac-audio.log
notify() {
    command -v notify-send >/dev/null 2>&1 && notify-send "$@"
}

for input in "$@"; do
    dir=$(dirname -- "$input")
    base=$(basename -- "$input")
    name="${base%.*}"
    final="${dir}/${name}.mkv"

    tmp=$(mktemp --suffix=.mkv -p "$dir" ".dolphin-flac-XXXXXX") || {
        notify "Audio → FLAC — error" "Could not create a temp file for $input"
        continue
    }

    if ! ffmpeg -nostdin -y -i "$input" \
        -map 0 -c:v copy -c:a flac -c:s copy -c:d copy -c:t copy \
        "$tmp" >>"$LOG" 2>&1; then
        rm -f "$tmp"
        notify "Audio → FLAC — error" "$input left untouched. Log: $LOG"
        continue
    fi

    if [[ ! -s "$tmp" ]]; then
        rm -f "$tmp"
        notify "Audio → FLAC — error" "Empty output, $input left untouched"
        continue
    fi

    if [[ "$final" != "$input" && -e "$final" ]]; then
        rm -f "$tmp"
        notify "Audio → FLAC — error" "$final already exists, $input left untouched"
        continue
    fi

    mv -f -- "$tmp" "$final"

    if [[ "$final" != "$input" && -e "$input" ]]; then
        rm -f -- "$input"
    fi

    notify "Audio → FLAC" "Replaced: $final"
done

# thx claude