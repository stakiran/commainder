@echo off
setlocal enabledelayedexpansion

rem Commainder v0.3.0
rem ================

set waitmin=%1
set msg=%*

set datafoldername=.commainder
set datafolderfull=%userprofile%\%datafoldername%
set dataext=.txt

set reremind_interval_sec=30

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

rem rereminding...
rem ==============

echo �����}�C���h���s���܂�...
echo �����}�C���h�Ԋu: %reremind_interval_sec%[�b]

set commandline=tasklist /fi "windowtitle eq %datafilename% - ������" /nh
set tasklist_result=
set query=notepad.exe

rem [���W�b�N���]
rem ���}�C���h���ꂽ�������E�B���h�E�̗L����, �C���^�[�o������, ���ׂ�.
rem ���݂��� = �܂����}�C���h�ɋC�t���ĂȂ�, �Ƃ݂Ȃ��čă��}�C���h����.
rem 
rem �������[�v�̎����ɂ� For �\���͎g���Ă��Ȃ�.
rem (���R) For �\���ɂ� goto �� exit /b �����삵�Ȃ��Ƃ����d�l�����邽��.

:label_loopstart

	timeout /t %reremind_interval_sec% /nobreak

	for /f "usebackq delims=" %%a in (`%commandline%`) do set tasklist_result=%%a
	echo !tasklist_result! | findstr %query% > nul
	if errorlevel 1 goto label_loopend

	start "" /max notepad "%datafilefull%"
	goto label_loopstart

:label_loopend

exit /b
