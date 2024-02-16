# Important!
To use this script, you'll need the following: 
* [yt-dlp.exe](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe)
* [**ffmpeg** and **ffprobe**](https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.7z)

**Notes: If you download the latest release, you won't need to install anything else**<br>
**However, please be aware that yt-dlp and ffmpeg might be outdated, and updating them can improve performance.**

#### How To:
1. Download the latest release or the `Menu.cmd` from the repository.
2. Download [yt-dlp.exe](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe).
3. Download [**ffmpeg**](https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.7z).
4. Create a folder if u decided to to download the menu.cmd from the repo **OR** Extract the latest release.
5. Copy `yt-dlp.exe` to the folder you created **OR** replace it in the extracted folder of the release.
6. In `ffmpeg-release-essentials.7z`, go to the `bin` folder and copy the three files (`ffmpeg`, `ffplay`, `ffprobe`) to the folder you created **OR** replace them in the extracted folder of the release.
7. **Use the `Menu.cmd`.**

**Note: To function properly, the `ytdlp.exe` and `ffmpeg` files needs to be kept in the same directory as the `Menu.cmd` file.**

# ytdlp-batch script

This batch file is only intended to make it easier for users of the `ytdlp.exe` releases of [yt-dlp](https://github.com/yt-dlp/yt-dlp) to download high-quality videos from YouTube (or other websites) without the use of third-party services or software clients (since these frequently have video quality limitations).

The audio and video files for videos with video quality higher than 720p must be downloaded separately, then combined into one file (that's just how YouTube works for some reason). [FFmpeg](https://www.ffmpeg.org/) must be installed on your computer or the `ffmpeg.exe` file must be located in the same folder as `ytdlp.exe` in order for `yt-dlp` to combine video and audio files.


## Easy_download.bat

This script includes:

* **1.1** Video Download at Highest Quality for any website supported

* **1.2** Download TikTok videos for Discord with watermark or in h264 format.

* **1.3** Video Segment Fetch Download

* **2.1** Audio Download at Highest Quality

* **3.1** Livestream Download from start (Currently only supported for YouTube)**if the livestream has DVR ON**

* **3.2** LiveStream Download from the current time **if the live has DVR ON**

* **4.1** Retrieve cookies from your browser (enabling this will use them for any option mentioned above).

* **D.** Enable debug verbose (can be used in [yt-dlp discord](https://discord.gg/NbWxxtNt9x))

* **F.** List formats

* **U.** yt-dlp Updater

## Note

The files in this repository are currently basic. Nothing here is too serious; it's just meant to be enjoyable. Later, I might include more features. If you'd like, feel free to contribute!
