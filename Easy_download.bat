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
mode 88, 30
echo %e%[30m" %e%[32m==============================================%e%[30m"
echo:
echo %e%[30m" %e%[31m---------------------------------%e%[30m"%e%[31m
SET /P URL="Enter video URL: "
echo %e%[30m" %e%[31m---------------------------------%e%[30m"
echo:
echo %e%[30m" %e%[32m==============================================%e%[30m"%e%[31m
timeout /T 2 >nul
goto :MainMenu
::--------------------------------------------------------------------
::--------------------------------------------------------------------
:MainMenu
mode 88, 30
title Quick Menu
cls
echo:
echo:
echo %e%[30m"          %e%[32m-----------%e%[30m"
echo %e%[30m"          %e%[33mCurrent URL: %e%[36m%URL% %e%[30m"
echo %e%[30m"          %e%[32m-----------%e%[30m"
echo %e%[30m"       %e%[32m_______________________________________________________________________%e%[30m"
echo:
echo %e%[30m"                                %e%[32mQUICK YT-DLP BY %e%[34mA2%e%[33mR1%e%[31m4N%e%[30m"
echo %e%[30m"          %e%[31m-----------------------------------------------------------------%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m1%e%[31m] %e%[32mQuick Music   %e%[31m|  %e%[32mDownload Music Fast (BestAudio)            %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m2%e%[31m] %e%[32mQuick Video   %e%[31m|  %e%[32mDownload Video Fast (BestVideo+BestAudio)  %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m3%e%[31m] %e%[32mLive stream   %e%[31m|  %e%[32mDownload Ongoing Live Stream               %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m4%e%[31m] %e%[33mN/A           %e%[31m|  %e%[33mN/A                                        %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m5%e%[31m] %e%[33mN/A           %e%[31m|  %e%[33mN/A                                        %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m6%e%[31m] %e%[32mNext Menu     %e%[31m|  %e%[32m                                           %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m-----------------------------------------------------------------%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m7%e%[31m] %e%[32mOwner Socials %e%[31m|  %e%[31m:)                                         %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m8%e%[31m] %e%[32mChange URL    %e%[31m|  %e%[31m                                           %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m-----------------------------------------------------------------%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m9%e%[31m] Exit%e%[30m"
echo %e%[30m"       %e%[32m_______________________________________________________________________%e%[30m"
echo:
echo %e%[30m"          %e%[32mEnter an option on the Keyboard %e%[31m[1,2,3,4,5,6,7,8,9]%e%[32m: %e%[30m"%e%[31m

choice /C 123456789 /n /m "Input:"

if %errorlevel%==1 goto :MusicPreset                 & cls & goto :MainMenu
if %errorlevel%==2 goto :VideosPreset                & cls & goto :MainMenu
if %errorlevel%==3 goto :OngoingLivestream           & cls & goto :MainMenu
if %errorlevel%==4 goto :?????????????               & cls & goto :MainMenu
if %errorlevel%==5 goto :?????????????               & cls & goto :MainMenu
if %errorlevel%==6 goto :Menu_2                      & cls & goto :MainMenu
if %errorlevel%==7 start https://linktr.ee/a2r14n    & cls & goto :MainMenu
if %errorlevel%==8 goto :Enter_url                   & cls & goto :MainMenu
if %errorlevel%==9 goto :Exit
PAUSE
::--------------------------------------------------------------------
::--------------------------------------------------------------------
:MusicPreset
title Music Download Menu
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
title Video Download Menu
cls
color 0A
echo:
echo:
echo: ==============================================
echo:
yt-dlp -f "bv+ba" -o "Downloads/Videos/%%(title)s.%%(id)s.%%(upload_date>%%Y-%%m-%%d)s.%%(ext)s" --add-metadata -S ext:mp4:m4a %URL%
color 0A
echo:
echo: ==============================================
echo:
echo: Done! & Pause >nul
goto :MainMenu
::--------------------------------------------------------------------
::--------------------------------------------------------------------
:OngoingLivestream
title Livestream Download Menu
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
::--------------------------------------------------------------------
:Enter_url_2
title Enter URL
color 0A
cls
mode 88, 30
echo %e%[30m" %e%[32m==============================================%e%[30m"
echo:
echo %e%[30m" %e%[31m---------------------------------%e%[30m"%e%[31m
SET /P URL="Enter video URL: "
echo %e%[30m" %e%[31m---------------------------------%e%[30m"
echo:
echo %e%[30m" %e%[32m==============================================%e%[30m"
timeout /T 2 >nul
goto :Menu_2
::--------------------------------------------------------------------
::--------------------------------------------------------------------
:Menu_2
mode 88, 30
title Quick Menu 2
cls
color 0A
echo:
echo:
echo %e%[30m"          %e%[32m-----------%e%[30m"
echo %e%[30m"          %e%[33mCurrent URL: %e%[36m%URL% %e%[30m"
echo %e%[30m"          %e%[32m-----------%e%[30m"
echo %e%[30m"       %e%[32m_______________________________________________________________________%e%[30m"
echo:
echo %e%[30m"                                %e%[32mQUICK YT-DLP BY %e%[34mA2%e%[33mR1%e%[31m4N%e%[30m"
echo %e%[30m"          %e%[31m-----------------------------------------------------------------%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m1%e%[31m] %e%[32mCustom Preset %e%[31m|  %e%[32mUse custom download preset                 %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m2%e%[31m] %e%[32mVideo + time  %e%[31m|  %e%[32mDownload Video with timestamp              %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m3%e%[31m] %e%[32mMembers only  %e%[31m|  %e%[32mDownload youtube videos on members only    %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m4%e%[31m] %e%[33mN/A           %e%[31m|  %e%[33mN/A                                        %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m5%e%[31m] %e%[33mN/A           %e%[31m|  %e%[33mN/A                                        %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m6%e%[31m] %e%[32mBack Menu     %e%[31m|  %e%[32m                                           %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m-----------------------------------------------------------------%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m7%e%[31m] %e%[32mUpdate        %e%[31m|  %e%[32mUpdate ytdlp                               %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m8%e%[31m] %e%[32mChange URL    %e%[31m|  %e%[32mChange Curent URL                          %e%[31m|%e%[30m"
echo %e%[30m"          %e%[31m-----------------------------------------------------------------%e%[30m"
echo %e%[30m"          %e%[31m[%e%[33m9%e%[31m] Exit%e%[30m"
echo %e%[30m"       %e%[32m_______________________________________________________________________%e%[30m"
echo:
echo %e%[30m"          %e%[32mEnter an option on the Keyboard %e%[31m[1,2,3,4,5,6,7,8,9]%e%[32m: %e%[30m"%e%[31m

choice /C 123456789 /n /m "Input:"

if %errorlevel%==1 goto :CustomPreset                & cls & goto :MainMenu
if %errorlevel%==2 goto :Timestamp                   & cls & goto :MainMenu
if %errorlevel%==3 goto :Downloadwithcookies         & cls & goto :MainMenu
if %errorlevel%==4 goto :?????????????               & cls & goto :MainMenu
if %errorlevel%==5 goto :?????????????               & cls & goto :MainMenu
if %errorlevel%==6 goto :MainMenu                    & cls & goto :MainMenu
if %errorlevel%==7 goto :Update                      & cls & goto :MainMenu
if %errorlevel%==8 goto :Enter_url_2                 & cls & goto :MainMenu
if %errorlevel%==9 goto :Exit
PAUSE
::--------------------------------------------------------------------
::--------------------------------------------------------------------
::--------------------------------------------------------------------
::--------------------------------------------------------------------
::--------------------------------------------------------------------
::--------------------------------------------------------------------
:CustomPreset
title Custom Download Menu
cls
color 0A
echo: ==============================================
echo: Convert this file to Audio?
echo:
echo: 1)Yes 2)No
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set "musicconvert=-x" & set "audioformat=--audio-format mp3"
if %errorlevel% == 2 set "musicconvert="   & set "audioformat="
::--------------------------------------------------------------------
echo:
echo: Add Upload date on title?
echo:
echo: 1)Yes 2)No
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set "upldate=.%%(upload_date>%%Y-%%m-%%d)s"
if %errorlevel% == 2 set "upldate="
::--------------------------------------------------------------------
echo:
echo: Add metadata?
echo:
echo: 1)Yes 2)No
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set "metadata=--add-metadata"
if %errorlevel% == 2 set "metadata=--no-add-metadata"
::--------------------------------------------------------------------
echo:
echo: Select Format?
echo:
echo: 1)Best Video Only 2)Best Audio Only 3)Best Video+Best Audio
echo: 4)Manual select
choice /c 1234 /n /m "Input:"

if %errorlevel% == 1 set "format=bv"    & goto :Livestream
if %errorlevel% == 2 set "format=ba"    & goto :Livestream
if %errorlevel% == 3 set "format=bv+ba" & goto :Livestream
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
SET /P video="Select video format(EX:137): "
SET /P audio="Select audio format(EX:140): "
set format=%video%+%audio%
goto :Livestream
::--------------------------------------------------------------------
:FormatV/A
color 0A
mode 120, 9999
yt-dlp -F %URL%
echo:
SET /P format="Select format(EX:137): "
goto :Livestream
::--------------------------------------------------------------------
:Livestream
color 0A
mode 83, 30
echo:
echo: Download Ongoing Livestream from start?
echo: DVR needs to be on (be able to go forward/backward)
echo: 1)Yes 2)No
echo:
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set "livestream=--live-from-start"
if %errorlevel% == 2 set "livestream=--no-live-from-start"
::--------------------------------------------------------------------
echo:
echo: Set thumbnail?
echo: 1)Yes 2)No
echo:
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 set "thumbnail=--embed-thumbnail"
if %errorlevel% == 2 set "thumbnail=--no-embed-thumbnail"
::--------------------------------------------------------------------
echo:
echo:Do you want to download only a part? (ex: 3:00-4:00 from a 5 minutes video/music)
echo: 1)Yes 2)No
echo:
choice /c 12 /n /m "Input:"

if %errorlevel% == 1 goto :c_timestamp
if %errorlevel% == 2 goto :c_download
::--------------------------------------------------------------------
:c_timestamp
echo: Select timestamp
echo: (EX:START: 2:00; END: 10:00) (start: can be empty) (end: can be filled with "inf")
echo:
set /P c_timestamp_s="Select start: "
set /P c_timestamp_e="Select end: "
set "c_timestamp=--download-sections "*%c_timestamp_s%-%c_timestamp_e%""
set "noembedchampers=--no-embed-chapters"
::--------------------------------------------------------------------
:c_download
echo:
echo:
echo: ==============================================
echo:
echo: Downloading...! & timeout /T 2 >nul
goto :Custom_Download
::--------------------------------------------------------------------
:Custom_Download
cls
color 0A
echo: ==============================================
echo:
yt-dlp %musicconvert% -o "Downloads/Custom/%%(title)s%upldate%.%%(ext)s" %metadata% -f "%format%" %livestream% %thumbnail% %audioformat% %c_timestamp% %noembedchampers% "%URL%"
color 0A
echo:
echo: ==============================================
echo:
set "musicconvert="
set "audioformat="
set "upldate="
set "metadata="
set "format="
set "video="
set "audio="
set "livestream="
set "thumbnail="
set "c_timestamp_s="
set "c_timestamp_e="
set "c_timestamp="
set "noembedchampers="
echo: Done! & Pause >nul
goto :Menu_2
::--------------------------------------------------------------------
::--------------------------------------------------------------------
::--------------------------------------------------------------------
::--------------------------------------------------------------------
::--------------------------------------------------------------------
::--------------------------------------------------------------------
:Timestamp
mode 95, 30
title Timestamp Download Menu
cls
color 0A
echo:
echo: Select timestamp
echo: (EX:START: 2:00; END: 10:00) (start: -can be empty) (end: can be filled with "inf")
echo:
set /P timestamp_s="Select start: "
set /P timestamp_e="Select end: "
set "timestamp=%timestamp_s%-%timestamp_e%"

yt-dlp -f "bv+ba" -o "Downloads/Timestamp/%%(title)s.%%(upload_date>%%Y-%%m-%%d)s.%%(ext)s" --no-embed-chapters --add-metadata --download-sections "*%timestamp%" -S ext:mp4:m4a "%URL%"
color 0A
echo:
echo: ==============================================
echo:
set "timestamp_s="
set "timestamp_e="
set "timestamp="
echo: Done! & Pause >nul
goto :Menu_2
::--------------------------------------------------------------------
::--------------------------------------------------------------------
:Downloadwithcookies
mode 95, 30
title Download with cookie Menu
cls
color 0A
echo:
echo: This mode will use browser cookies to download members only/subscription videos.
echo: Select Browser: (only listed are supported)
echo: 1)Chrome 2)Firefox 3)Opera 4)Edge 5)Brave 6)Chromium 7)Safari 8)Vivaldi
echo:
choice /c 12345678 /n /m "Input:"

if %errorlevel% == 1 set "browser=chrome"
if %errorlevel% == 2 set "browser=firefox"
if %errorlevel% == 3 set "browser=opera"
if %errorlevel% == 4 set "browser=edge"
if %errorlevel% == 5 set "browser=brave"
if %errorlevel% == 6 set "browser=chromium"
if %errorlevel% == 7 set "browser=safari"
if %errorlevel% == 8 set "browser=vivaldi"
echo:
echo: ==============================================
echo: 
yt-dlp -f "bv+ba" -o "Downloads/Cookies/%%(title)s.%%(upload_date>%%Y-%%m-%%d)s.%%(ext)s" --cookies-from-browser %browser% --add-metadata -S ext:mp4:m4a "%URL%"
color 0A
echo:
echo: ==============================================
echo:
set "browser="
echo: Done! & Pause >nul
goto :Menu_2
::--------------------------------------------------------------------
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
goto :Menu_2
::--------------------------------------------------------------------
::--------------------------------------------------------------------
:Exit
exit /b