@echo off
setlocal
set datafolder=%userprofile%\.comminder

if not exist %datafolder% (
	echo データフォルダ `%datafolder%` が存在しません.
	pause
	exit /b
)
explorer %datafolder%
