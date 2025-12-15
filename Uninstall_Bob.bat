@echo off
title Uninstall Bob

echo This will remove Bob and his suitcase from this device.
echo.
set /p ok=Are you sure? (y/n): 

if /i "%ok%"=="y" goto remove
echo.
echo Uninstall cancelled.
goto end

:remove
echo.
echo Removing Bob...
rem Delete all files and folders in Bob's directory (the folder where this script is located)
rmdir /s /q "%~dp0"
echo.
echo Bob has been removed.
pause

:end