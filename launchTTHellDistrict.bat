@echo off
echo ==============================
echo = Launching TT Hell District =
echo ==============================

title Project Altis TT Hell District

set MAX_CHANNELS=999999
set STATESERVER=4002
set ASTRON_IP=127.0.0.1:7199
set EVENTLOGGER_IP=127.0.0.1:7197
set DISTRICT_NAME=TT Hell
set BASE_CHANNEL=402000000

:main
dependencies\panda\python\python.exe -m toontown.ai.ServiceStart --base-channel %BASE_CHANNEL% ^
               --max-channels %MAX_CHANNELS% --stateserver %STATESERVER% ^
               --astron-ip %ASTRON_IP% --eventlogger-ip %EVENTLOGGER_IP% ^
               --district-name "%DISTRICT_NAME%"
PAUSE
goto main