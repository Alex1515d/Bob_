@echo off
title Bob Installer

echo Hello, I'm Bob.
echo I never do anything without your permission.
echo I carry a suitcase full of computer games.
echo.
echo Would you like to install me?
echo   [1] Yes
echo   [0] No
echo.

set /p choice=Your choice (1/0): 

if "%choice%"=="1" goto install
goto exit

:install
set /p target=Where should I be installed? (e.g. C:\Bob): 

if "%target%"=="" (
    echo No path specified.
    pause
    goto exit
)

echo Unpacking my suitcase...
powershell -command "Expand-Archive -Path 'chemodan.zip' -DestinationPath '%target%' -Force"

echo Adding travel entry...
echo Bob was launched on device: %COMPUTERNAME% >> "%target%\travel_log.txt"
echo Date: %date% %time% >> "%target%\travel_log.txt"
echo. >> "%target%\travel_log.txt"

echo Creating uninstaller...
(
echo @echo off
echo title Uninstall Bob
echo echo This will remove Bob from your device.
echo set /p ok=Are you sure? (y/n^): 
echo if /i "%%ok%%"=="y" goto remove
echo echo Cancelled.
echo goto end
echo :remove
echo echo Removing...
echo rmdir /s /q "%target%"
echo echo Done.
echo pause
echo :end
) > "%target%\uninstall.bat"

echo Installation complete.
pause
goto exit

:exit
echo Goodbye.