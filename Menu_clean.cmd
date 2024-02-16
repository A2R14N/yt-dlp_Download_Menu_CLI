@echo off
::Script made by ADRYAN
::https://linktr.ee/a2r14n
set "browser=" & set "segment=" & set "debug=" & set "debug_s=Disabled"

::=====Set URL
:url
cls & title Set URL
SET /P url="Enter URL: "

::=====Main Menu
:menu
if "%browser%"=="" (set "cookies_status=Disabled") else (set "cookies_status=%browser%")
cls & title ytdlp Menu
echo: Current URL: "%url%"
echo:
echo: 1.Video
echo: 2.Audio
echo: 3.Livesteam
echo: 4.Cookies from Browser: "%cookies_status%"
::echo: 5.
::echo: 6.
::echo: 7.
::echo: 8.
echo:
echo: 9.Change url
echo: 0.Exit
echo: D.Debug: "%debug_s%"
echo: F.List formats
echo: U.Update yt-dlp
echo:
echo: Enter a menu option in the Keyboard [1,2,3,4,9,0,F,U] 

choice /C:123490dfu /N
if %errorlevel%==9 goto :update
if %errorlevel%==8 goto :formats
if %errorlevel%==7 if "%debug%"=="" (set "debug= -vU" & set "debug_s=Enabled" & goto :menu) else (set "debug=" & set "debug_s=Disabled" & goto :menu)
if %errorlevel%==6 exit /b
if %errorlevel%==5 goto :url
if %errorlevel%==4 goto :cookies
if %errorlevel%==3 goto :livestream
if %errorlevel%==2 goto :audio
if %errorlevel%==1 goto :video
pause

::=====Video Menu
:video
if "%segment%"=="" (set "segment_status=Disabled") else (set "segment_status=%segment_s%-%segment_e%")
cls & title Video Menu
echo: 1.Video - Youtube, Reddit, Facebook, Instagram, others
echo: 2.Video - Tiktok for Discord with Watermark/h264 format
echo: 3.Video - Segment Fetch: "%segment_status%" or disable
echo: 9.Back
echo:
echo: Enter a menu option in the Keyboard [1,2,9]

choice /C:1239 /N
if %errorlevel%==4 set "segment=" & goto :menu
if %errorlevel%==3 if "%segment%"=="" (goto :videosegmentfetch) else (set "segment=" & goto :video)
if %errorlevel%==2 goto :videotiktok
if %errorlevel%==1 goto :videodownload
pause

::=====Video Download
:videodownload
cls & title Video Download
yt-dlp%debug% -f "bv+ba/b" -o "Downloads/Video/%%(title)s.%%(ext)s" --merge-output-format "mp4" --add-metadata "%url%" %cookies% %browser% %segment%
echo:
echo: Press any key to go back... & Pause >nul
goto :video

::=====Tiktok Download for Discord(encode h264) h265 don't have player on discord
:videotiktok 
cls & title Tiktok Video Download for Discord
yt-dlp%debug% -S "codec:h264" -f "bv+ba/b" -o "Downloads/Video/Tiktok/%%(title)s.%%(ext)s" --merge-output-format "mp4" --add-metadata "%url%" %cookies% %browser% %segment%
echo:
echo: Press any key to go back... & Pause >nul
goto :video

::=====Video Segment Fetch Download
:videosegmentfetch
cls & title Video Segment Fetch Download
echo: Select Time Range:
echo: (EX:START 2:00; END 10:00) (start: can be empty) (end: can be empty)
SET /P segment_s="Segment start: "
SET /P segment_e="Segment end: "
set "segment=-S proto:https --download-sections *%segment_s%-%segment_e%"
goto :video

::=====Audio Menu
:audio
cls & title Audio Menu
echo: 1.Audio - Youtube, Tiktok, Reddit, Facebook, others
echo: 9.Back
echo:
echo: Enter a menu option in the Keyboard [1,9]

choice /C:19 /N
if %errorlevel%==2 goto :menu
if %errorlevel%==1 goto :audiodownload
pause

::=====Audio Download
:audiodownload
cls & title Tiktok Video Download for Discord
yt-dlp%debug% -x -f "ba/b" -o "Downloads/Audio/%%(title)s.%%(ext)s" --recode-video "mp3" --add-metadata "%url%" %cookies% %browser%
echo:
echo: Press any key to go back... & Pause >nul
goto :audio

::=====Livestream Menu
:livestream
cls & title Livestream Menu
echo: 1.Livestream from start (Currently only supported for YouTube)
echo: 2.Livestream from the current time
echo: 9.Back
echo:
echo: Enter a menu option in the Keyboard [1,2,9]
choice /C:129 /N
if %errorlevel%==3 goto :menu
if %errorlevel%==2 goto :livestream_ct
if %errorlevel%==1 goto :livestream_s
pause

::=====Livestream Download from start
:livestream_s
cls & title Livestream Download from start
yt-dlp%debug% -f "bv+ba/b" -o "Downloads/Livestream/%%(title)s.%%(ext)s" --merge-output-format "mp4" --live-from-start --add-metadata "%url%" %cookies% %browser%
echo:
echo: Done!
echo: Press any key to go back... & Pause >nul
goto :livestream

::=====Livestream Download from the current time
:livestream_ct
cls & title Livestream Download from the current time
yt-dlp%debug% -f "bv+ba/b" -o "Downloads/Livestream/%%(title)s.%%(ext)s" --merge-output-format "mp4" --add-metadata "%url%" %cookies% %browser%
echo:
echo: Press any key to go back... & Pause >nul
goto :livestream

::=====Cookies from browser
:cookies
cls & title Cookies menu
echo: 1.Enable Cookies and select Browser
echo: 2.Disable Cookies
echo: 9.Back
echo:
echo: Enter a menu option in the Keyboard [1,2,9]
choice /C:129 /N
if %errorlevel%==3 goto :menu
if %errorlevel%==2 goto :disablecookies
if %errorlevel%==1 goto :enablecookies

::=====Enable Cookies
:enablecookies
cls & title Choose Browser
echo: Choose Browser:
echo: 1.Brave, 2.Chrome, 3.Chromium, 4.Edge, 5.Firefox, 6.Opera, 7.Safari, 8.Vivaldi
echo: On Chrome, browser needs to be closed
echo:
echo: Enter a menu option in the Keyboard [1,2,3,4,5,6,7,8]
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
goto :menu

::=====Disable Cookies
:disablecookies
set "cookies=--no-cookies-from-browser" & set "browser=" & goto :menu

::=====List formats 
:formats
cls & title List formats
echo:
yt-dlp%debug% -F %url%
echo:
echo: Press any key to go back... & Pause >nul
goto :menu

::=====Update yt-dlp
:update
cls & title Update yt-dlp
echo:
yt-dlp%debug% -U
echo:
echo: Press any key to go back... & Pause >nul
goto :menu

::=====Prevent script from exit
pause
