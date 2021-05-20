@echo off
set correct=connected to 192.168.0.102:5555
:while
adb.exe connect 192.168.0.102 > text.txt
set content=
for /f "delims=" %%i in (text.txt) do set content=%content% %%i
if not "x!content:%correct%=!"=="x%content%" (
	echo %content%
	echo.
) else (
	echo devices is not connected trying again
	goto :while
)
PAUSE
