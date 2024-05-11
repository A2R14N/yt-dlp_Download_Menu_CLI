@echo off
::Script made by ADRYAN
::https://linktr.ee/a2r14n
for /F %%i in ('echo prompt $E ^| cmd') do set "e=%%i"
if exist config.cfg (for /f "tokens=1,* delims==" %%a in (config.cfg) do set "%%a=%%b") else (goto :defconfig)
::>>>>URL
::=====Set URL
:url
cls & title Set URL
SET /P url="Enter URL: "
::<<<<URL




::>>>>MENU
::=====Main Menu
:menu
cls & title ytdlp Menu
echo %e%[30m" %e%[33mANNOUNCE%e%[37m: If you download videos/livestreams to make edits in Premiere Pro, %e%[30m"
echo %e%[30m"           %e%[37mcheck "Settings" "Editor Mode" (this mode will skip some unsupported formats) %e%[30m"
echo:
echo %e%[30m" %e%[31mCurrent URL%e%[37m: "%url%" %e%[30m"
echo:
echo %e%[30m" %e%[31m1%e%[37m.Video %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m.Audio %e%[30m"
echo %e%[30m" %e%[31m3%e%[37m.Music %e%[30m"
echo %e%[30m" %e%[31m4%e%[37m.Livesteam %e%[30m"
echo %e%[30m" %e%[31m5%e%[37m.Settings %e%[30m"
echo %e%[30m" %e%[31m6%e%[37m.Change url %e%[30m"
echo %e%[30m" %e%[31m0%e%[37m.Exit %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option %e%[37m[%e%[31m1%e%[37m,%e%[31m2%e%[37m,%e%[31m3%e%[37m,%e%[31m4%e%[37m,%e%[31m5%e%[37m,%e%[31m6%e%[37m,%e%[31m0%e%[37m]: %e%[30m"%e%[37m

choice /C:1234560 /N
if %errorlevel%==7 exit /b
if %errorlevel%==6 goto :url
if %errorlevel%==5 goto :settings
if %errorlevel%==4 goto :livestream
if %errorlevel%==3 goto :music
if %errorlevel%==2 goto :audio
if %errorlevel%==1 goto :video
pause
::<<<<MENU




::>>>>VIDEO
::=====Video Menu
:video
if "%segment%"=="" (set "segment_status=Disabled") else (set "segment_status=%segment_s%-%segment_e%")
cls & title Video Menu
echo %e%[30m" %e%[31m1%e%[37m.Video %e%[37m- %e%[31mYoutube%e%[37m, %e%[33mReddit, %e%[36mFacebook%e%[37m, %e%[35mInstagram%e%[37m, others %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m.Video %e%[37m- %e%[35mTiktok %e%[37mfor %e%[35mDiscord %e%[37mwith Watermark/%e%[32mh264 %e%[37mformat %e%[30m"
echo %e%[30m" %e%[31m3%e%[37m.Video %e%[37m- Segment Fetch: "%e%[31m%segment_status%%e%[37m" (Press 3 to disable) %e%[30m"
echo %e%[30m" %e%[31m9%e%[37m.Back %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option %e%[37m[%e%[31m1%e%[37m,%e%[31m2%e%[37m,%e%[31m3%e%[37m,%e%[31m9%e%[37m]: %e%[30m"%e%[37m

choice /C:1239 /N
if %errorlevel%==4 goto :menu
if %errorlevel%==3 if "%segment%"=="" (goto :videosegmentfetch) else (set "segment=" & set "segment_s=" & set "segment_e=" & call :saveconfig & goto :video)
if %errorlevel%==2 goto :videotiktok
if %errorlevel%==1 goto :videodownload
pause

::=====Video Download
:videodownload
cls & title Video Download
yt-dlp%debug% -f "bv+ba/b" -o "Downloads/Video/%%(title)s.%%(ext)s" --merge-output-format "%voutputformat%" --add-metadata "%url%" %cookies% %browser% %segment% %editing%
echo:
echo: Press any key to go back... & Pause >nul
goto :video

::=====Tiktok Download for Discord(encode h264) h265 don't have player on discord
:videotiktok 
cls & title Tiktok Video Download for Discord
yt-dlp%debug% -S "codec:h264" -f "bv+ba/b" -o "Downloads/Video/Tiktok/%%(title)s.%%(ext)s" --merge-output-format "%voutputformat%" --add-metadata "%url%" %cookies% %browser% %segment% %editing%
echo:
echo: Press any key to go back... & Pause >nul
goto :video

::=====Video Segment Fetch Set
:videosegmentfetch
cls & title Video Segment Fetch Set
echo: Select Time Range:
echo: (EX:START 2:00; END 10:00) (start: can be empty) (end: can be empty)
SET /P segment_s="Segment start: "
SET /P segment_e="Segment end: "
set "segment=-S proto:https --download-sections *%segment_s%-%segment_e%"
call :saveconfig
goto :video
::<<<<<VIDEO




::>>>>>AUDIO
::=====Audio Menu
:audio
if "%segment%"=="" (set "segment_status=Disabled") else (set "segment_status=%segment_s%-%segment_e%")
cls & title Audio Menu
echo %e%[30m" %e%[31m1%e%[37m.Audio %e%[37m- %e%[31mYoutube%e%[37m, %e%[35mTiktok%e%[37m, %e%[33mReddit%e%[37m, %e%[36mFacebook%e%[37m, others %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m.Audio %e%[37m- %e%[37mSegment Fetch: "%e%[31m%segment_status%%e%[37m" (%e%[31mPress 2 to disable%e%[37m) %e%[30m"
echo %e%[30m" %e%[31m9%e%[37m.Back %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option [%e%[31m1%e%[37m,%e%[31m2%e%[37m,%e%[31m9%e%[37m]: %e%[30m"%e%[37m

choice /C:129 /N
if %errorlevel%==3 goto :menu
if %errorlevel%==2 if "%segment%"=="" (goto :audiosegmentfetch) else (set "segment=" & set "segment_s=" & set "segment_e=" & call :saveconfig & goto :audio)
if %errorlevel%==1 goto :audiodownload
pause

::=====Audio Download
:audiodownload
cls & title Audio Download
yt-dlp%debug% -x -f "ba/b" -o "Downloads/Audio/%%(title)s.%%(ext)s" --recode-video "%aoutputformat%" --add-metadata "%url%" %cookies% %browser% %segment% %editing%
echo:
echo: Press any key to go back... & Pause >nul
goto :audio

::=====Audio Segment Fetch Download
:audiosegmentfetch
cls & title Audio Segment Fetch Set
echo: Select Time Range:
echo: (EX:START 2:00; END 10:00) (start: can be empty) (end: can be empty)
SET /P segment_s="Segment start: "
SET /P segment_e="Segment end: "
set "segment=-S proto:https --download-sections *%segment_s%-%segment_e%"
call :saveconfig
goto :audio
::<<<<<AUDIO




::>>>>>MUSIC
::=====Music Menu
:music
cls & title Music Menu
echo %e%[30m" %e%[33mThis can be also used with playlists %e%[30m"
echo %e%[30m" %e%[31m1%e%[37m.Music %e%[37m- %e%[31mYoutube%e%[37m, %e%[31mYoutube Music %e%[30m"
echo %e%[30m" %e%[31m9%e%[37m.Back %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option %e%[37m[%e%[31m1%e%[37m,%e%[31m9%e%[37m]: %e%[30m"%e%[37m

choice /C:19 /N
if %errorlevel%==2 goto :menu
if %errorlevel%==1 goto :musicdownload
pause

::=====Music Download
:musicdownload
cls & title Music Download
yt-dlp%debug% -x -f "ba/b" -o "Downloads/Music/%%(playlist|)s/%%(playlist_index)s.%%(title)s.%%(ext)s" --recode-video "%moutputformat%" --add-metadata "%url%" %cookies% %browser% %segment% %editing%
echo:
echo: Press any key to go back... & Pause >nul
goto :music
::<<<<<Music




::>>>>>LIVESTREAM
::=====Livestream Menu
:livestream
cls & title Livestream Menu
echo %e%[30m" %e%[31m1%e%[37m.Livestream from start %e%[37m(Currently only supported for %e%[31mYouTube%e%[37m) %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m.Livestream from the current time %e%[30m"
echo %e%[30m" %e%[31m3%e%[37m.Livestream from twitch %e%[30m"
echo %e%[30m" %e%[31m9%e%[37m.Back %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option %e%[37m[%e%[31m1%e%[37m,%e%[31m2%e%[37m,%e%[31m3%e%[37m,%e%[31m9%e%[37m]: %e%[30m"%e%[37m

choice /C:1239 /N
if %errorlevel%==4 goto :menu
if %errorlevel%==3 goto :livestreamtwitch
if %errorlevel%==2 goto :livestreamct
if %errorlevel%==1 goto :livestreams
pause

::=====Livestream Download from start
:livestreams
cls & title Livestream Download from start
yt-dlp%debug% -f "bv+ba/b" -o "Downloads/Livestream/Beginning/%%(title)s.%%(ext)s" --merge-output-format "%voutputformat%" --live-from-start --add-metadata "%url%" %cookies% %browser% %editing%
echo:
echo: Done!
echo: Press any key to go back... & Pause >nul
goto :livestream

::=====Livestream Download from the current time
:livestreamct
cls & title Livestream Download from the current time
yt-dlp%debug% -f "bv+ba/b" -o "Downloads/Livestream/CurrentTime/%%(title)s.%%(ext)s" --merge-output-format "%voutputformat%" --add-metadata "%url%" %cookies% %browser% %editing%
echo:
echo: Press any key to go back... & Pause >nul
goto :livestream

::=====Livestream Download from Twitch
:livestreamtwitch
cls & title Livestream Download from Twitch
yt-dlp%debug% -f "bv+ba/b" -o "Downloads/Livestream/Twitch/%%(title)s.%%(ext)s" --fixup never --merge-output-format "%voutputformat%" --add-metadata "%url%" %cookies% %browser% %editing%
echo:
echo: Press any key to go back... & Pause >nul
goto :livestream
::<<<<<LIVESTREAM




::>>>>>SETTINGS
::=====Settings menu
:settings
if "%browser%"=="" (set "cookies_s=Disabled") else (set "cookies_s=%browser%")
if "%debug%"=="" (set "debug_s=Disabled") else (set "debug_s=Enabled")
if "%editing%"=="" (set "editing_s=Disabled") else (set "editing_s=Enabled")
cls & title Settings menu
echo %e%[30m" %e%[31m1%e%[37m. Change Output Format %e%[37m(%e%[33mVideo%e%[37m): "%e%[31m%voutputformat%%e%[37m" %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m. Change Output Format %e%[37m(%e%[33mAudio%e%[37m): "%e%[31m%aoutputformat%%e%[37m" %e%[30m"
echo %e%[30m" %e%[31m3%e%[37m. Change Output Format %e%[37m(%e%[33mMusic%e%[37m): "%e%[31m%moutputformat%%e%[37m" %e%[30m"
echo %e%[30m" %e%[31m4%e%[37m. Mode for video editors%e%[37m: %e%[37m"%e%[31m%editing_s%%e%[37m" %e%[30m"
echo %e%[30m" %e%[31m5%e%[37m. Cookies from Browser%e%[37m: %e%[37m"%e%[31m%cookies_s%%e%[37m" %e%[30m"
echo %e%[30m" %e%[31m6%e%[37m. Debug%e%[37m: %e%[37m"%e%[31m%debug_s%%e%[37m" %e%[30m"
echo %e%[30m" %e%[31m7%e%[37m. List Formats %e%[30m"
echo %e%[30m" %e%[31m8%e%[37m. Update yt-dlp %e%[30m"
echo %e%[30m" %e%[31m9%e%[37m. Back to Main Menu %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option %e%[37m[%e%[31m1%e%[37m,%e%[31m2%e%[37m,%e%[31m3%e%[37m,%e%[31m4%e%[37m,%e%[31m5%e%[37m,%e%[31m6%e%[37m,%e%[31m7%e%[37m,%e%[31m8%e%[37m,%e%[31m9%e%[37m]: %e%[30m"%e%[37m

choice /C:123456789 /N
if %errorlevel%==9 goto :menu
if %errorlevel%==8 goto :update
if %errorlevel%==7 goto :formats
if %errorlevel%==6 if "%debug%"=="" (set "debug= -vU" & call :saveconfig & goto :settings) else (set "debug=" & call :saveconfig & goto :settings)
if %errorlevel%==5 goto :cookies
if %errorlevel%==4 if "%editing%"=="" (set "editing= -S vcodec:h264,res,acodec:m4a" & call :saveconfig & goto :settings) else (set "editing=" & call :saveconfig & goto :settings)
if %errorlevel%==3 goto :mformat
if %errorlevel%==2 goto :aformat
if %errorlevel%==1 goto :vformat
pause

::=====Change video output format
:vformat
cls & title Change Video Output Format
echo %e%[30m" %e%[37mChoose video output format: %e%[30m"
echo %e%[30m" %e%[31m1%e%[37m.avi %e%[31m4%e%[37m.mov %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m.flv %e%[31m5%e%[37m.mp4 (%e%[33mdefoult%e%[37m) %e%[30m"
echo %e%[30m" %e%[31m3%e%[37m.mkv %e%[31m6%e%[37m.webm %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option %e%[37m[%e%[31m1%e%[37m,%e%[31m2%e%[37m,%e%[31m3%e%[37m,%e%[31m4%e%[37m,%e%[31m5%e%[37m,%e%[31m6%e%[37m]: %e%[30m" %e%[37m

choice /C:123456 /N
if %errorlevel%==6 set "voutputformat=webm" 
if %errorlevel%==5 set "voutputformat=mp4"
if %errorlevel%==4 set "voutputformat=mov"
if %errorlevel%==3 set "voutputformat=mkv"
if %errorlevel%==2 set "voutputformat=flv"
if %errorlevel%==1 set "voutputformat=avi"
call :saveconfig & goto :settings

::=====Change audio output format
:aformat
cls & title Change Audio Output Format
echo %e%[30m" %e%[37mChoose audio output format: %e%[30m"
echo %e%[30m" %e%[31m1%e%[37m.aac  %e%[31m7%e%[37m.mp3 (%e%[33mdefoult%e%[37m) %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m.aiff %e%[31m8%e%[37m.ogg %e%[30m"
echo %e%[30m" %e%[31m3%e%[37m.alac %e%[31m9%e%[37m.opus %e%[30m"
echo %e%[30m" %e%[31m4%e%[37m.flac %e%[31m0%e%[37m.vorbis %e%[30m"
echo %e%[30m" %e%[31m5%e%[37m.m4a  %e%[31mw%e%[37m.wav %e%[30m"
echo %e%[30m" %e%[31m6%e%[37m.mka %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option [%e%[31m1%e%[37m,%e%[31m2%e%[37m,%e%[31m4%e%[37m,%e%[31m5%e%[37m,%e%[31m6%e%[37m,%e%[31m7%e%[37m,%e%[31m8%e%[37m,%e%[31m9%e%[37m,%e%[31m0%e%[37m,%e%[31mW%e%[37m]: %e%[30m" %e%[37m

choice /C:1234567890w /N
if %errorlevel%==11 set "aoutputformat=wav"
if %errorlevel%==10 set "aoutputformat=vorbis"
if %errorlevel%==9 set "aoutputformat=opus"
if %errorlevel%==8 set "aoutputformat=ogg"
if %errorlevel%==7 set "aoutputformat=mp3"
if %errorlevel%==6 set "aoutputformat=mka"
if %errorlevel%==5 set "aoutputformat=m4a"
if %errorlevel%==4 set "aoutputformat=flac"
if %errorlevel%==3 set "aoutputformat=alac"
if %errorlevel%==2 set "aoutputformat=aiff"
if %errorlevel%==1 set "aoutputformat=aac"
call :saveconfig & goto :settings

::=====Change Music output format
:mformat
cls & title Change Music Output Format
echo %e%[30m" %e%[37mChoose music output format: %e%[30m"
echo %e%[30m" %e%[31m1%e%[37m.aac  %e%[31m7%e%[37m.mp3 (%e%[33mdefoult%e%[37m) %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m.aiff %e%[31m8%e%[37m.ogg %e%[30m"
echo %e%[30m" %e%[31m3%e%[37m.alac %e%[31m9%e%[37m.opus %e%[30m"
echo %e%[30m" %e%[31m4%e%[37m.flac %e%[31m0%e%[37m.vorbis %e%[30m"
echo %e%[30m" %e%[31m5%e%[37m.m4a  %e%[31mw%e%[37m.wav %e%[30m"
echo %e%[30m" %e%[31m6%e%[37m.mka %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option [%e%[31m1%e%[37m,%e%[31m2%e%[37m,%e%[31m4%e%[37m,%e%[31m5%e%[37m,%e%[31m6%e%[37m,%e%[31m7%e%[37m,%e%[31m8%e%[37m,%e%[31m9%e%[37m,%e%[31m0%e%[37m,%e%[31mW%e%[37m]: %e%[30m" %e%[37m

choice /C:1234567890w /N
if %errorlevel%==11 set "moutputformat=wav"
if %errorlevel%==10 set "moutputformat=vorbis"
if %errorlevel%==9 set "moutputformat=opus"
if %errorlevel%==8 set "moutputformat=ogg"
if %errorlevel%==7 set "moutputformat=mp3"
if %errorlevel%==6 set "moutputformat=mka"
if %errorlevel%==5 set "moutputformat=m4a"
if %errorlevel%==4 set "moutputformat=flac"
if %errorlevel%==3 set "moutputformat=alac"
if %errorlevel%==2 set "moutputformat=aiff"
if %errorlevel%==1 set "moutputformat=aac"
call :saveconfig & goto :settings

::=====Cookies from browser
:cookies
cls & title Cookies menu
echo %e%[30m" e%[31m1e%[37m.Enable Cookies and select Browser %e%[30m"
echo %e%[30m" e%[31m2e%[37m.Disable Cookies %e%[30m"
echo %e%[30m" e%[31m9e%[37m.Back %e%[30m"
echo:
echo %e%[30m" Enter a menu option [1,2,9]: %e%[30m" %e%[37m
choice /C:129 /N
if %errorlevel%==3 goto :settings
if %errorlevel%==2 set "cookies=" & set "browser=" & call :saveconfig & goto :settings
if %errorlevel%==1 goto :enablecookies

::=====Enable Cookies
:enablecookies
cls & title Choose Browser
echo %e%[30m" %e%[37mChoose Browser: %e%[30m"
echo %e%[30m" %e%[31m1%e%[37m.Brave, %e%[31m2%e%[37m.Chrome, %e%[31m3%e%[37m.Chromium, %e%[31m4%e%[37m.Edge, %e%[31m5%e%[37m.Firefox, %e%[31m6%e%[37m.Opera, %e%[31m7%e%[37m.Safari, %e%[31m8%e%[37m.Vivaldi %e%[30m"
echo %e%[30m" %e%[37m(%e%[33mNote%e%[37m: On Chrome, the browser needs to be closed) %e%[30m"
echo:
echo %e%[30m" Enter a menu option [1,2,3,4,5,6,7,8]: %e%[30m" %e%[37m
set "cookies=--cookies-from-browser"

choice /C:12345678 /N
if %errorlevel%==8 set "browser=vivaldi" 
if %errorlevel%==7 set "browser=safari"
if %errorlevel%==6 set "browser=opera"
if %errorlevel%==5 set "browser=firefox"
if %errorlevel%==4 set "browser=edge"
if %errorlevel%==3 set "browser=chromium"
if %errorlevel%==2 set "browser=chrome"
if %errorlevel%==1 set "browser=brave"
call :saveconfig & goto :cookies

::=====List formats 
:formats
cls & title List formats
echo:
yt-dlp%debug% -F %url%
echo:
echo: Press any key to go back... & Pause >nul
goto :settings

::=====Update yt-dlp
:update
cls & title Update yt-dlp
echo: Current version:
yt-dlp --version
echo:
echo %e%[30m"%e%[31m1%e%[37m.Update to %e%[32mStable%e%[30m"
echo %e%[30m"%e%[31m2%e%[37m.Update to %e%[33mNightly%e%[30m"
echo %e%[30m"%e%[31m3%e%[37m.Update to %e%[36mMaster%e%[30m"
echo %e%[30m"%e%[31m9%e%[37m.Back %e%[30m" %e%[37m
choice /C:1239 /N
if %errorlevel%==4 goto :settings
if %errorlevel%==3 set "update=master@latest" & goto :update_
if %errorlevel%==2 set "update=nightly@latest" & goto :update_
if %errorlevel%==1 set "update=stable@latest" & goto :update_
goto :settings

:update_
cls & title Update yt-dlp
yt-dlp%debug% --update-to %Update%
echo: 
echo: Update should be done, Check above results
echo: Press any key...
pause >nul
goto :settings
::<<<<<SETTINGS




::>>>>>Config
::=====Defines variables if config.cfg does not exists.
:defconfig
set "debug="
set "browser="
set "cookies="
set "voutputformat=mp4"
set "aoutputformat=mp3"
set "moutputformat=mp3"
set "editing="
set "segment_s="
set "segment_e="
set "segment="
echo debug=%debug%> config.cfg
echo browser=%browser%>> config.cfg
echo cookies=%cookies%>> config.cfg
echo voutputformat=%voutputformat%>> config.cfg
echo aoutputformat=%aoutputformat%>> config.cfg
echo moutputformat=%moutputformat%>> config.cfg
echo editing=%editing%>> config.cfg
echo segment_s=%segment_s%>> config.cfg
echo segment_e=%segment_e%>> config.cfg
echo segment=%segment%>> config.cfg
echo config>> config.cfg
goto :URL

::=====Save Config
:saveconfig
echo debug=%debug%> config.cfg
echo browser=%browser%>> config.cfg
echo cookies=%cookies%>> config.cfg
echo voutputformat=%voutputformat%>> config.cfg
echo aoutputformat=%aoutputformat%>> config.cfg
echo moutputformat=%moutputformat%>> config.cfg
echo editing=%editing%>> config.cfg
setlocal enabledelayedexpansion
echo segment_s=!segment_s!>> config.cfg
echo segment_e=!segment_e!>> config.cfg
endlocal
echo segment=%segment%>> config.cfg
echo config>> config.cfg
goto :eof
::<<<<<Config




::=====Prevent script from exit
pause

::=====
