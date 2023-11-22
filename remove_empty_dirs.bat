@echo off
if "%~1"=="" (
    echo Введіть ім'я диску як параметр!
    exit /b
)

echo ОБ'ЄМ ВІЛЬНОГО МІСЦЯ ДО ВИДАЛЕННЯ:
fsutil volume diskfree %1

echo ПОШУК ПОРОЖНІХ КАТАЛОГІВ...
for /f "delims=" %%d in ('dir /ad /s /b "%1" ^| sort /r') do (
    rd "%%d" 2>nul
)

echo ОБ'ЄМ ВІЛЬНОГО МІСЦЯ ПІСЛЯ ВИДАЛЕННЯ:
fsutil volume diskfree %1