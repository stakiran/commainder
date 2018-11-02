@echo off
setlocal

rem Comminder v0.1.0
rem ================

set n=%1
set msg=%*

set datafoldername=.comminder
set datafolderfull=%userprofile%\%datafoldername%
set dataext=.txt

if not exist %datafolderfull% (
	echo ����N���ɂ�, �f�[�^�t�@�C���ۑ��� "%datafolderfull%" ���쐬���܂�.
	mkdir %datafolderfull%
)

if "%n%"=="" (
	set n=0
)

if "%msg%"=="" (
	set msg=����͓���m�F�ł��B���̂悤�ɕ\������܂��B
)

set todaydate=%date%
set todaydate_for_disp=%todaydate%
set todaydate=%todaydate:/=%
set todaydate=%todaydate:~0,8%
set todaytime=%time%
set todaytime_for_disp=%todaytime%
set todaytime=%todaytime: =0%
set todaytime=%todaytime::=%
set todaytime=%todaytime:.=%
set todaytime=%todaytime:~0,8%
set todaydatetime=%todaydate%_%todaytime%

set databasename=%todaydatetime%
set datafilename=%databasename%%dataext%
set datafilefull=%datafolderfull%\%datafilename%

echo �y���}�C���h���e�z > %datafilefull%
echo %msg% >> %datafilefull%
echo.>> %datafilefull%
echo ======== >> %datafilefull%
echo.>> %datafilefull%
echo Set from: %todaydate_for_disp% %todaytime_for_disp%.  >> %datafilefull%
echo Wait sec: %n% Secs.  >> %datafilefull%

title %n%�b��Ƀ��}�C���h
timeout /T %n% /nobreak
start "" /max notepad "%datafilefull%"
