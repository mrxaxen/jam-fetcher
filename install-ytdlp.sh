#!/usr/bin/env bash

curl -L https://github.com/yt-dlp/yt-dlp/raw/master/public.key | gpg --import
gpg --verify SHA2-256SUMS.sig SHA2-256SUMS
gpg --verify SHA2-512SUMS.sig SHA2-512SUMS

wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
chmod 555 ./yt-dlp
mv ./yt-dlp /usr/bin/
