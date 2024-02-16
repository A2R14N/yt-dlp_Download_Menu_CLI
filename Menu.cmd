@echo off
::Script made by ADRYAN
::https://linktr.ee/a2r14n
for /F %%i in ('echo prompt $E ^| cmd') do set "e=%%i"
set "browser=" & set "segment=" & set "debug=" & set "debug_s=Disabled"

::=====Set URL
:url
cls & title Set URL
SET /P url="Enter URL: "

::=====Main Menu
:menu
if "%browser%"=="" (set "cookies_status=Disabled") else (set "cookies_status=%browser%")
cls & title ytdlp Menu
echo %e%[30m" %e%[31mCurrent URL%e%[37m: "%url%" %e%[30m"
echo:
echo %e%[30m" %e%[31m1%e%[37m.Video %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m.Audio %e%[30m"
echo %e%[30m" %e%[31m3%e%[37m.Livesteam %e%[30m"
echo %e%[30m" %e%[31m4%e%[37m.Cookies from Browser "%e%[31m%cookies_status%%e%[37m" %e%[30m"
::echo %e%[30m" %e%[31m5%e%[37m. %e%[30m"
::echo %e%[30m" %e%[31m6%e%[37m. %e%[30m"
::echo %e%[30m" %e%[31m7%e%[37m. %e%[30m"
::echo %e%[30m" %e%[31m8%e%[37m. %e%[30m"
echo:
echo %e%[30m" %e%[31m9%e%[37m.Change url %e%[30m"
echo %e%[30m" %e%[31m0%e%[37m.Exit %e%[30m"
echo %e%[30m" %e%[31mD%e%[37m.Debug: "%e%[31m%debug_s%%e%[37m" %e%[30m"
echo %e%[30m" %e%[31mF%e%[37m.List formats %e%[30m"
echo %e%[30m" %e%[31mU%e%[37m.Update yt-%e%[31mdlp %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option in the Keyboard %e%[31m[1,2,3,4,9,0,F,U]%e%[30m" %e%[37m

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
echo %e%[30m" %e%[31m1%e%[37m.Video - %e%[31mYoutube%e%[37m, %e%[33mReddit%e%[37m, %e%[36mFacebook%e%[37m, %e%[35mInstagram%e%[37m, others %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m.Video - %e%[35mTiktok %e%[37mfor %e%[35mDiscord %e%[37mwith Watermark/%e%[32mh264 %e%[37mformat %e%[30m"
echo %e%[30m" %e%[31m3%e%[37m.Video - Segment Fetch: "%e%[31m%segment_status%%e%[37m" or %e%[31mdisable %e%[30m"
echo %e%[30m" %e%[31m9%e%[37m.Back
echo:
echo %e%[30m" %e%[37mEnter a menu option in the Keyboard %e%[31m[1,2,9] %e%[30m"%e%[37m

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
echo %e%[30m" %e%[37mSelect Time Range: %e%[30m"
echo %e%[30m" %e%[37m(%e%[33mEX:%e%[37mSTART %e%[32m2:00%e%[37m; END %e%[32m10:00%e%[37m) (start: can be empty) (end: can be empty) %e%[30m"%e%[37m
SET /P segment_s="Segment start: "
SET /P segment_e="Segment end: "
set "segment=-S proto:https --download-sections *%segment_s%-%segment_e%"
goto :video

::=====Audio Menu
:audio
cls & title Audio Menu
echo %e%[30m" %e%[31m1%e%[37m.Audio - %e%[31mYoutube%e%[37m, %e%[35mTiktok%e%[37m, %e%[33mReddit%e%[37m, %e%[36mFacebook%e%[37m, others %e%[30m"
echo %e%[30m" %e%[31m9%e%[37m.Back %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option in the Keyboard %e%[31m[1,9] %e%[30m"%e%[37m

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
echo %e%[30m" %e%[31m1%e%[37m.Livestream from start (Currently only supported for %e%[31mYouTube%e%[37m) %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m.Livestream from the current time %e%[30m"
echo %e%[30m" %e%[31m9%e%[37m.Back %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option in the Keyboard %e%[31m[1,2,9] %e%[30m"%e%[37m
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
echo %e%[30m" %e%[31m1%e%[37m.Enable Cookies and select Browser %e%[30m"
echo %e%[30m" %e%[31m2%e%[37m.Disable Cookies %e%[30m"
echo %e%[30m" %e%[31m9%e%[37m.Back %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option in the Keyboard %e%[31m[1,2,9] %e%[30m"%e%[37m
choice /C:129 /N
if %errorlevel%==3 goto :menu
if %errorlevel%==2 goto :disablecookies
if %errorlevel%==1 goto :enablecookies

::=====Enable Cookies
:enablecookies
cls & title Choose Browser
echo %e%[30m" %e%[37mChoose Browser: %e%[30m"
echo %e%[30m" %e%[31m1%e%[37m.Brave, %e%[31m2%e%[37m.Chrome, %e%[31m3%e%[37m.Chromium, %e%[31m4%e%[37m.Edge, %e%[31m5%e%[37m.Firefox, %e%[31m6%e%[37m.Opera, %e%[31m7%e%[37m.Safari, %e%[31m8%e%[37m.Vivaldi %e%[30m"
echo %e%[30m" %e%[31mOn Chrome, browser needs to be closed %e%[30m"
echo:
echo %e%[30m" %e%[37mEnter a menu option in the Keyboard %e%[31m[1,2,3,4,5,6,7,8] %e%[30m"%e%[37m
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
