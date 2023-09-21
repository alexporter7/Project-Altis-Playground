@echo off
echo ====================
echo = Launching Astron =
echo ====================

title Project Altis Astron

cd dependencies\astron

:startAstron
astrond --loglevel info config/cluster-yaml.yml
PAUSE

goto startAstron