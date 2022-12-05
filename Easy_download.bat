@echo OFF

:Enter_url
title Enter URL
mode 88, 99999
color 0A
cls
echo: ==============================================
echo:
echo: Some URL can brick this script :)
echo: ---------------------------------
SET /P URL="Enter video URL: "
echo: ---------------------------------
echo:
echo: ==============================================
::if URL=="1" (goto :No_url) ELSE (goto :MainMenu)


:MainMenu
title Quick Menu
cls
echo:
echo:          -----------
echo:          Current URL: %URL%
echo:          -----------
echo:      ^ _____________________________________________________________
echo:
echo:                          QUICK YT-DLP BY A2R14N
echo:          ^-------------------------------------------------------
echo:          [1] Quick Music   ^|  Download Music Fast with Preset  ^|
echo:          [2] Quick Video   ^|  Download Video Fast with Preset  ^|
echo:          [3] Live stream   ^|  Download Ongoing Live Stream     ^|
echo:          [4] Custom Preset ^|  Use custom download preset       ^|
echo:          [5] COMING SOON   ^|  N/A                              ^|
echo:          [6] Update        ^|  Update ytdlp                     ^|
echo:          ^-------------------------------------------------------
echo:          [7] Owner Socials ^|  :)                               ^|
echo:          [8] Change URL    ^|                                   ^|
echo:          ^-------------------------------------------------------
echo:          [9] Exit
echo:      ^ _____________________________________________________________
echo:
echo:          Enter an option on the Keyboard [1,2,3,4,5,6,7,8,9] :

choice /C 123456789 /N

if %errorlevel%==1 setlocal & call :MusicPreset                 endlocal & cls & goto :MainMenu
if %errorlevel%==2 setlocal & call :VideosPreset                endlocal & cls & goto :MainMenu
if %errorlevel%==3 setlocal & call :OngoingLivestream           endlocal & cls & goto :MainMenu
if %errorlevel%==4 setlocal & call :CustomPreset                endlocal & cls & goto :MainMenu
if %errorlevel%==5 setlocal & call :?????????????               endlocal & cls & goto :MainMenu
if %errorlevel%==6 setlocal & call :Update                      endlocal & cls & goto :MainMenu
if %errorlevel%==7 start https://linktr.ee/a2r14n                        & cls & goto :MainMenu
if %errorlevel%==8 setlocal & call :Enter_url                   endlocal & cls & goto :MainMenu
if %errorlevel%==9 goto :Exit                                            & cls
PAUSE


:MusicPreset
cls
color 0A
echo:
echo:
echo: ==============================================
echo:
yt-dlp -x -o "Downloads/Music/%%(title)s.%%(ext)s" --add-metadata -f ba --audio-format mp3 %URL%
color 0A
echo:
echo: ==============================================
echo:
echo: Done! & Pause >nul
goto :MainMenu


:VideosPreset
cls
color 0A
echo:
echo:
echo: ==============================================
echo:
yt-dlp -f "bv+ba" -o "Downloads/Videos/%%(title)s.%%(upload_date>%%Y-%%m-%%d)s.%%(ext)s" --add-metadata -S ext:mp4:m4a %URL%
color 0A
echo:
echo: ==============================================
echo:
echo: Done! & Pause >nul
goto :MainMenu


:OngoingLivestream
cls
color 0A
echo: ==============================================
echo:
yt-dlp -f "bv+ba" -o "Downloads/Livestream/%%(title)s.%%(upload_date>%%Y-%%m-%%d)s.%%(ext)s" --add-metadata -S ext:mp4:m4a --live-from-start %URL%
color 0A
echo:
echo: ==============================================
echo:
echo: Done! & Pause >nul
goto :MainMenu

:CustomPreset
cls
color 0A
echo: ==============================================
echo: Convert this file to Audio?
echo:
echo: 1)Yes 2)No
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set musicconvert=-x
if %errorlevel% == 2 set musicconvert=""
::--------------------------------------------------------------------
echo:
echo: Add Upload date on title?
echo:
echo: 1)Yes 2)No
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set upldate=""
if %errorlevel% == 2 set upldate=""
::--------------------------------------------------------------------
echo: 
echo: Add metadata?
echo:
echo: 1)Yes 2)No
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set metadata=--add-metadata
if %errorlevel% == 2 set metadata=--no-add-metadata
::--------------------------------------------------------------------
echo:
echo: Select Format?
echo:
echo: 1)Best Video Only 2)Best Audio Only 3)Best Video+Best Audio
choice /c 123 /n /m "Input:"

if %errorlevel% == 1 set format=bv
if %errorlevel% == 2 set format=ba
if %errorlevel% == 3 set format=bv+ba
::--------------------------------------------------------------------
echo:
echo: Download Ongoing Livestream?
echo: 1)Yes 2)No
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set livestream=--live-from-start
if %errorlevel% == 2 set livestream=--no-live-from-start
::--------------------------------------------------------------------
echo:
echo: Set thumbnail?
echo: 1)Yes 2)No
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set thumbnail=--embed-thumbnail
if %errorlevel% == 2 set thumbnail=--no-embed-thumbnail
::--------------------------------------------------------------------
echo:
echo:
echo: ==============================================
echo:
echo: Downloading...! & timeout /T 2 >nul
goto :Download_Custom

:Download_Custom
cls
color 0A
echo: ==============================================
echo:
yt-dlp %musicconvert% -o "Downloads/%%(title)s.%%(upload_date>%%Y-%%m-%%d)s.%%(ext)s" %metadata% -f "%format%" %livestream% %thumbnail% %URL%
color 0A
echo:
echo: ==============================================
echo:
echo: Done! & Pause >nul
goto :MainMenu


:Update
cls
echo: ==============================================
echo:
yt-dlp -U
echo:
echo: ==============================================
echo:
echo: Done! & Pause >nul
goto :MainMenu


:Exit
exit /b


::yt-dlp -P "D:/Video" -f "bv+ba" -o "%(title)s.%(upload_date>%Y-%m-%d)s.%(ext)s" --add-metadata -S ext:mp4:m4a --live-from-start
::yt-dlp -P "D:/Video" -f "bv+ba" -o "%(title)s.%(ext)s" --add-metadata -S ext:mp4:m4a --download-sections "*00:00-1:00"


:No_url
cls
echo:======================================================================================================================
echo:
echo: You didn't enter any URL.
echo: Try again.
echo:
echo:======================================================================================================================
TIMEOUT 2 >nul
goto :Enter_url