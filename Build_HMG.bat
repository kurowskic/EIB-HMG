SET PATH=%~d0\hmg.3.4.4\harbour\bin;%~d0\hmg.3.4.4\mingw\bin;%PATH%

title eib_hmg

call del.bat

copy eib_ver3._ch eib_ver.ch
copy eib_hmg3._rc eib_hmg.rc

call %~d0\hmg.3.4.4\build.bat /n eib_hmg.hbp eib_hmg.hbc

IF NOT EXIST eib_hmg.exe goto :END
IF NOT EXIST %~d0\upx-win32\upx.exe goto :END

IF EXIST %~d0\upx-win32\upx.exe %~d0\upx-win32\upx.exe -9 -q eib_hmg.exe -o eib.exe

IF EXIST eib.exe DEL eib_hmg.exe

:END

title OK
