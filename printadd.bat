@echo off
if "%1"=="?" goto help
if "%1"=="/?" goto help
if "%1"=="" goto syntax
if "%2"=="" goto local

:main
rundll32 printui.dll,PrintUIEntry /ga /c\\%1 /n\\%2
sc \\%1 stop spooler

echo.
echo.
echo Please wait about 5 seconds before continuing
pause
sc \\%1 start spooler
goto end

:local
rundll32 printui.dll,PrintUIEntry /ga /n\\%1
sc stop spooler

echo.
echo.
echo Please wait about 5 seconds before continuing
pause
sc start spooler
goto end

:syntax
echo.
echo.
echo Command syntax is:
echo printadd (pcname) (printserver\printername)
echo.
echo Try again.
echo.
goto end

:help
echo.
echo.
echo Usage:
echo Copy the printadd.cmd to the root of your hard drive.
echo From a command line, type the following:   printadd isc365 isc210\isp110
echo If you get an error about SC not recognized, the printer will not be added until next logoff/login or the spooler is stopped and started.
goto end

:end
