@echo off
setlocal

rem Commainder v0.2.0
rem ================

set waitmin=%1
set msg=%*

set datafoldername=.commainder
set datafolderfull=%userprofile%\%datafoldername%
set dataext=.txt

if not exist %datafolderfull% (
	echo ����N���ɂ�, �f�[�^�t�@�C���ۑ��� "%datafolderfull%" ���쐬���܂�.
	mkdir %datafolderfull%
)

if "%waitmin%"=="" (
	set waitmin=0
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

set /a waitsec=%waitmin%*60

echo �y���}�C���h���e�z > %datafilefull%
echo %msg% >> %datafilefull%
echo.>> %datafilefull%
echo ======== >> %datafilefull%
echo.>> %datafilefull%
echo Set from: %todaydate_for_disp% %todaytime_for_disp%.  >> %datafilefull%
echo Wait sec: %waitmin% Minutes.  >> %datafilefull%

title %waitmin%����Ƀ��}�C���h
timeout /T %waitsec% /nobreak
start "" /max notepad "%datafilefull%"
