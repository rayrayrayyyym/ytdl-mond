#!/bin/bash

#set variables
dlDirectory=Videos
fileNameFormat=

#start ytdlp
echo Welcome to yt dlp
echo 

#read url input
read -p "Paste url here: " URL

#check filesize of video or playlist
TMP=$(./yt-dlp_linux $URL --print "%(filesize,filesize_approx)s" | paste -sd+ - )
TMP=$((TMP))
FILESIZE_APPROX=$(numfmt --to iec-i --format "%8.4f" $TMP)
echo "Filesize :$TMP"
echo "Approximated Download Size: $FILESIZE_APPROX"

read -p "Proceed to Download?[y/n]: " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Downloading to $dlDirectory"
    ./yt-dlp_linux --live-from-start $URL -P "$dlDirectory" --merge-output-format mp4 -o "%(upload_date>%Y)s/%(upload_date>%Y-%m-%d)s %(title)s.%(ext)s"
fi

#sample vid
#https://www.youtube.com/watch?v=PwrVtDd84XU
#sample playlist
#https://www.youtube.com/playlist?list=PLD8YD0BwyQb6Vx-tNTCrmZecUdS8zvbCQ
