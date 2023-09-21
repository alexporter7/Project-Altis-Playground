@echo off
echo ======================================
echo = Launch Project Altis Client (Dev2) =
echo ======================================

title Project Altis Client (Dev2)

SET TT_GAMESERVER=127.0.0.1
set TT_PLAYCOOKIE=dev2
set TT_USERNAME=dev2
set TT_PASSWORD=dev2

:startProjectAltis
dependencies\panda\python\python.exe -m toontown.toonbase.ClientStart
PAUSE
goto startProjectAltis