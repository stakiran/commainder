@echo off
setlocal
set datafolder=%userprofile%\.comminder

if not exist %datafolder% (
	echo �f�[�^�t�H���_ `%datafolder%` �����݂��܂���.
	pause
	exit /b
)
explorer %datafolder%
