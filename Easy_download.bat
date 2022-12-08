@echo OFF
::--------------------------------------------------------------------
::--------------------------------------------------------------------
:colored_echo
for /F %%i in ('echo prompt $E ^| cmd') do set "e=%%i"
::--------------------------------------------------------------------
::--------------------------------------------------------------------
:Enter_url
title Enter URL
color 0A
cls
mode 80, 30
echo %e%[30m" %e%[32m==============================================%e%[30m"
echo:
echo %e%[30m" Some URL can brick this script :)%e%[30m"
echo %e%[30m" %e%[31m---------------------------------%e%[30m"%e%[31m
SET /P URL="Enter video URL: "
echo %e%[30m" %e%[31m---------------------------------%e%[30m"
echo:
<<<<<<< HEAD
echo %e%[30m" %e%[32m==============================================%e%[30m"
::--------------------------------------------------------------------
::--------------------------------------------------------------------
=======
echo: ==============================================


>>>>>>> 49a0106d580e71bfb94be5a8ce287b4ca75c8f7e
:MainMenu
title Quick Menu
cls
echo:
echo %e%[30m"          %e%[32m-----------%e%[30m"
echo %e%[30m"          %e%[33mCurrent URL: %e%[36m%URL% %e%[30m"
echo %e%[30m"          %e%[32m-----------%e%[30m"
echo %e%[30m"       %e%[32m_________________________________________________________________%e%[30m"
echo:
echo %e%[30m"                          %e%[32mQUICK YT-DLP BY %e%[34mA2%e%[33mR1%e%[31m4N%e%[30m"
echo %e%[30m"          %e%[31m-----------------------------------------------------------%e%[30m"
echo %e%[30m"          %e%[31m[1] %e%[32mQuick Music   %e%[31m|  %e%[32mDownload Music Fast (BAudio)         %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[2] %e%[32mQuick Video   %e%[31m|  %e%[32mDownload Video Fast (BVideo+BAudio)  %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[3] %e%[32mLive stream   %e%[31m|  %e%[32mDownload Ongoing Live Stream         %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[4] %e%[32mCustom Preset %e%[31m|  %e%[32mUse custom download preset           %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[5] %e%[33mN/A           %e%[31m|  %e%[33mN/A                                  %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[6] %e%[32mUpdate        %e%[31m|  %e%[32mUpdate ytdlp                         %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m-----------------------------------------------------------%e%[30m"
echo %e%[30m"          %e%[31m[7] %e%[32mOwner Socials %e%[31m|  %e%[31m:)                                   %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[8] %e%[32mChange URL    %e%[31m|                                       %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m-----------------------------------------------------------%e%[30m"
echo %e%[30m"          %e%[31m[9] Exit%e%[30m"
echo %e%[30m"       %e%[32m_________________________________________________________________%e%[30m"
echo:
echo %e%[30m"          Enter an option on the Keyboard [1,2,3,4,5,6,7,8,9]: %e%[30m"%e%[31m

choice /C 123456789 /n /m "Input:"

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
::--------------------------------------------------------------------
::--------------------------------------------------------------------
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
::--------------------------------------------------------------------
::--------------------------------------------------------------------
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
::--------------------------------------------------------------------
::--------------------------------------------------------------------
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
::--------------------------------------------------------------------
:CustomPreset
cls
color 0A
echo: ==============================================
echo: Convert this file to Audio?
echo:
echo: 1)Yes 2)No
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set musicconvert=-x
if %errorlevel% == 2 set musicconvert=
::--------------------------------------------------------------------
echo:
echo: Add Upload date on title?
echo:
echo: 1)Yes 2)No
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set upldate=.%%(upload_date>%%Y-%%m-%%d)s
if %errorlevel% == 2 set upldate=
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
echo: 4)Manual select
choice /c 1234 /n /m "Input:"

if %errorlevel% == 1 set format=bv    & goto :Livestream
if %errorlevel% == 2 set format=ba    & goto :Livestream
if %errorlevel% == 3 set format=bv+ba & goto :Livestream
if %errorlevel% == 4 goto :ManualFormat 
::--------------------------------------------------------------------
:ManualFormat
color 0A
echo:
echo: 1) Video + Audio
echo: 2) Single format (Video only / Audio only)
echo:
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 goto :FormatV+A
if %errorlevel% == 2 goto :FormatV/A

::--------------------------------------------------------------------
:FormatV+A
color 0A
mode 120, 9999
yt-dlp -F %URL%
echo:
SET /P video="↑Select video format(EX:137): "
SET /P audio="↑Select audio format(EX:140): "
set format=%video%+%audio%
goto :Livestream
::--------------------------------------------------------------------
:FormatV/A
color 0A
mode 120, 9999
yt-dlp -F %URL%
echo:
SET /P format="↑Select format(EX:137): "
goto :Livestream
::--------------------------------------------------------------------
:Livestream
color 0A
mode 80, 30
echo:
echo: Download Ongoing Livestream from start?
echo: DVR needs to be on (be able to go forward/backward)
echo:
echo: 1)Yes 2)No
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set thumbnail=--live-from-start
if %errorlevel% == 2 set thumbnail=--no-live-from-start
::--------------------------------------------------------------------
echo:
echo: Set thumbnail?
echo: 1)Yes 2)No
echo:
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
::--------------------------------------------------------------------
:Download_Custom
cls
color 0A
echo: ==============================================
echo:
yt-dlp %musicconvert% -o "Downloads/Custom/%%(title)s%%%upldate%.%%(ext)s" %metadata% -f "%format%" %livestream% %thumbnail% %URL%
color 0A
echo:
echo: ==============================================
echo:
echo: Done! & Pause >nul
goto :MainMenu
::--------------------------------------------------------------------
:Update
cls
color 0A
echo: ==============================================
echo:
yt-dlp -U
echo:
echo: ==============================================
echo:
echo: Done! & Pause >nul
goto :MainMenu


:Exit
<<<<<<< HEAD
exit /b
=======
exit /b




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
>>>>>>> 49a0106d580e71bfb94be5a8ce287b4ca75c8f7e
