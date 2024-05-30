@echo off
setlocal enabledelayedexpansion

:: Запуск скрипта в новом окне, если не запущен в фоновом режиме

rem Далее какой-нибудь полезный код

:loop
:: Получение информации о батарее
for /f "tokens=2 delims==" %%i in ('wmic path Win32_Battery get EstimatedChargeRemaining /format:value') do (
    set charge=%%i
)

:: Удаление пробелов в начале и конце строки
set charge=%charge: =%

:: Проверка заряда батареи и воспроизведение аудио
if "%charge%"=="100" (
    :: Воспроизведение системного звука
    powershell -c "$PlayWav=New-Object System.Media.SoundPlayer; $PlayWav.SoundLocation='1.wav'; $PlayWav.playsync()"
) 

:: Ожидание 60 секунд перед следующей проверкой
timeout /t 60 /nobreak > nul

:: Переход в начало цикла
goto loop

endlocal
