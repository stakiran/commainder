@echo off
setlocal
set datafolder=%userprofile%\.commainder

if not exist %datafolder% (
	echo �f�[�^�t�H���_ `%datafolder%` �����݂��܂���.
	pause
	exit /b
)
explorer %datafolder%
