#!/usr/bin/env bash

# uso: ./gen_songlist.sh <directory_input> <file_output>
DIR="${1:-../src/songs/canti_giungla}"
OUT="${2:-$DIR/songs_list.tex}"

# rigenera il file
echo "% File generato automaticamente, NON modificarlo a mano" > "$OUT"

for f in "$DIR"/*.tex; do
    # escludiamo il songs_list stesso
    if [[ "$f" != *songs_list.tex ]]; then
        echo "\\stepcounter{chapterSong}\\input{$f}" >> "$OUT"
    fi
done

echo "Lista aggiornata in $OUT"
