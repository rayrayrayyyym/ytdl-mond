@echo off
::set variables
set dlDirectory=C:\Users\mondy\Desktop\Project_Chii\Videos

set fileNameFormat=""

::start ytdlp
echo Welcome to yt dlp
echo 
read -p "Paste url here: " URL
::https://www.youtube.com/watch?v=PwrVtDd84XU

FILESIZE_APPROX=$(yt-dlp $URL --print "%(filesize,filesize_approx)s")
::yt-dlp --live-from-start %URL% -P "%dlDirectory%" --merge-output-format mp4