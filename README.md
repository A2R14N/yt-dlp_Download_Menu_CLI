# Important
This script requires: <br />
* [yt-dlp.exe](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe) <br />
* [**ffmpeg** and **ffprobe**](https://www.ffmpeg.org)<br />
>If you download the latest release, you don't need to install anything else
# ytdlp-batch
This batch file is only intended to make it easier for users of the `ytdlp.exe` releases of https://github.com/yt-dlp/yt-dlp (Source: https://github.com/yt-dlp/yt-dlp) to download high-quality videos from YouTube (or other websites) without the use of third-party services or software clients (since these frequently have video quality limitations).

The audio and video files for videos with video quality higher than 720p must be downloaded separately, then combined into one file (that's just how YouTube works for some reason). FFmpeg (https://www.ffmpeg.org/) must be installed on your computer or the `ffmpeg.exe` file must be located in the same folder as `ytdlp.exe` in order for `ytdlp` to combine video and audio files.

**Keep in mind that for it to function, the `ytdlp.exe` file needs to be kept in the same directory as the `Easy_download.bat` file.**

## Easy_download.bat
This script includes: <br />
* Audio Download at max Quality <br />
* Video Download at max Quality <br />
* Ongoing Live Stream Download from start **if the live has DVR ON** <br />
* ytdlp Update <br />

## Note
The files in this repository are currently basic. Nothing in this is too serious; it's just meant to be enjoyable. Later, I might include more features. If you'd like, feel free to contribute!
