#!/usr/bin/env bash

PLAYLIST_FILE="playlists"
DOWNLOAD_ROOT_PATH="."

while IFS="," read -r playlist_name url; do
    DOWNLOAD_PATH="${DOWNLOAD_ROOT_PATH}/${playlist_name}"
    if [[ ! -d $DOWNLOAD_PATH ]]; then
        mkdir -p ${DOWNLOAD_PATH}/logs
    fi
    yt-dlp $url \
        --yes-playlist \
        --restrict-filenames \
        --no-abort-on-error \
        -o $DOWNLOAD_PATH \
        --download-archive "${playlist_name}_archive" \
        -x \
        --audio-quality 0 |
        tee "${DOWNLOAD_PATH}/logs/progress-$(date +%Y-%m-%d_%H-%M-%S).log"
done <$PLAYLIST_FILE
