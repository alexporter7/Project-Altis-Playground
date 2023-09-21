@echo off
echo =====================
echo = Launching UberDog =
echo =====================

title Project Altis UberDog

set /P PYTHON_PATH=<PYTHON_PATH

set MAX_CHANNELS=999999
set STATESERVER=4002
set ASTRON_IP=127.0.0.1:7199
set EVENTLOGGER_IP=127.0.0.1:7197
set BASE_CHANNEL=1000000

:startUberDog
dependencies\panda\python\python.exe -m toontown.uberdog.ServiceStart --base-channel %BASE_CHANNEL% ^
               --max-channels %MAX_CHANNELS% --stateserver %STATESERVER% ^
               --astron-ip %ASTRON_IP% --eventlogger-ip %EVENTLOGGER_IP%
PAUSE
goto startUberDog