@echo off
echo ======================================
echo = Launch Project Altis Client (Dev1) =
echo ======================================

title Project Altis Client (Dev1)

SET TT_GAMESERVER=127.0.0.1
set TT_PLAYCOOKIE=dev1
set TT_USERNAME=dev1
set TT_PASSWORD=dev1

:startProjectAltis
dependencies\panda\python\python.exe -m toontown.toonbase.ClientStart
PAUSE
goto startProjectAltis