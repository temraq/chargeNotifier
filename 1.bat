@echo off
setlocal enabledelayedexpansion


:loop

for /f "tokens=2 delims==" %%i in ('wmic path Win32_Battery get EstimatedChargeRemaining /format:value') do (
    if not "%%i"=="" set charge=%%i
)

for /f "tokens=2 delims==" %%i in ('wmic path Win32_Battery get BatteryStatus /format:value') do (
    if not "%%i"=="" set status=%%i
)


set charge=%charge: =%
set status=%status: =%


if "%charge%"=="100" if "%status%"=="2" (

    powershell -c "$PlayWav=New-Object System.Media.SoundPlayer; $PlayWav.SoundLocation='1.wav'; $PlayWav.playsync()"
) 

timeout /t 60 /nobreak > nul


goto loop

endlocal
