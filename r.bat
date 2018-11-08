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
	echo 初回起動につき, データファイル保存先 "%datafolderfull%" を作成します.
	mkdir %datafolderfull%
)

if "%waitmin%"=="" (
	set waitmin=0
)

if "%msg%"=="" (
	set msg=これは動作確認です。このように表示されます。
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

echo 【リマインド内容】 > %datafilefull%
echo %msg% >> %datafilefull%
echo.>> %datafilefull%
echo ======== >> %datafilefull%
echo.>> %datafilefull%
echo Set from: %todaydate_for_disp% %todaytime_for_disp%.  >> %datafilefull%
echo Wait sec: %waitmin% Minutes.  >> %datafilefull%

title %waitmin%分後にリマインド
timeout /T %waitsec% /nobreak
start "" /max notepad "%datafilefull%"

rem rereminding...
rem ==============

echo リリマインドを行います...
echo リリマインド間隔: %reremind_interval_sec%[秒]

set commandline=tasklist /fi "windowtitle eq %datafilename% - メモ帳" /nh
set tasklist_result=
set query=notepad.exe

rem [ロジック解説]
rem リマインドされたメモ帳ウィンドウの有無を, インターバル毎に, 調べる.
rem 存在する = まだリマインドに気付いてない, とみなして再リマインドする.
rem 
rem 無限ループの実現には For 構文は使っていない.
rem (理由) For 構文には goto や exit /b が動作しないという仕様があるため.

:label_loopstart

	timeout /t %reremind_interval_sec% /nobreak

	for /f "usebackq delims=" %%a in (`%commandline%`) do set tasklist_result=%%a
	echo !tasklist_result! | findstr %query% > nul
	if errorlevel 1 goto label_loopend

	start "" /max notepad "%datafilefull%"
	goto label_loopstart

:label_loopend

exit /b
