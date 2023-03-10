#!/bin/sh
SCRIPT="$HOME/.local/share/notify-send.lua"
PID="$HOME/.abrpid"

#pick your audio quality (uncomment one to use it)

# 128kbps Opus
URL=https://radio.animebits.moe/stream/stream128.ogg
# 256kbps Opus
#URL=https://radio.animebits.moe/stream/stream256.ogg
# ~148kbps VBR AAC
#URL=https://radio.animebits.moe/stream/stream128.aac
# ~192kbps VBR MP3
#URL=https://radio.animebits.moe/stream/stream192.mp3
# Lossless FLAC
#URL=https://radio.animebits.moe/stream/stream.flac

[ -f "$PID" ] && { notify-send 'Already running'; exit 1; }
[ "$URL" = "" ] && notify-send "Please edit the script to choose the quality of audio you would like."
echo $$ > "$PID"
exec mpv --script="$SCRIPT" --no-terminal "$URL" 2>/dev/null
