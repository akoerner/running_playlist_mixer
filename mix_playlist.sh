#!/usr/bin/env bash


PLAYLIST_NAME="Half_Marathon_Mix"
seconds=$(cat "${PLAYLIST_NAME}.txt" | tr -s '\t' '\t' | grep -v "Length" | grep "^[^#;]" | sed -r '/^\s*$/d' | awk '{s+=$3} END {print s}' FS='\t')
echo "${seconds}"

printf 'Playlist Length(hh:mm:ss): %02d:%02d:%02d\n' $((seconds/3600)) $((seconds%3600/60)) $((seconds%60))

rm -rf "${PLAYLIST_NAME}"
mkdir "${PLAYLIST_NAME}"

index=0
while IFS= read -r line; do
  [[ "$line" =~ ^#.*$ ]] && continue
  IFS=$'\t' read -r title artist length url <<< $line
  filename="$(printf "%02d" "${index}")_${title// /_}-${artist// /_}.mp3"
  if [[ "${title}" == "Title" ]]; then
    continue
  fi
  echo "${filename}"

  yt-dlp --extract-audio --audio-format mp3 --output "${PLAYLIST_NAME}/${filename}" "${url}"
  index=$((index+1))
done < "${PLAYLIST_NAME}.txt"
