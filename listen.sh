#!/bin/sh
APIKEY=
FINISH="$HOME/.done"

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

[ "$URL" = "" ] && notify-send "Please edit the script to choose the quality of audio you would like."

# check if already running
#PREVPROC=$(ps -ef | grep "mpv --no-terminal -" | sed '/grep/d' | awk '{print $2}')
#[ $PREVPROC = "" ] || echo "You already have it running."

[ -f $FINISH ] && {
	notify-send "Already listening. If this is in error, remove the $FINISH file and try again."
	exit 1
} || touch $FINISH

[ "$APIKEY" = "" ] || APIKEY="?apikey=$APIKEY"
curl -s ""$URL""$APIKEY"" | mpv --no-terminal - & export MPVPID=$!
abr-notify 2> /dev/null & export PYPID=$!

notify-send "Run 'touch $FINISH' to turn off the radio."
echo "$FINISH" | entr -pz kill $MPVPID $PYPID
rm "$FINISH"