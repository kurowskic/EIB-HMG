if "%MG_ROOT%"=="" set MG_ROOT=c:\minigui

title eib_hmg

call del.bat

copy eib_ver2._ch eib_ver.ch
copy eib_hmg2._rc eib_hmg.rc


call %MG_ROOT%\batch\compile.bat eib_hmg /ro


call %MG_ROOT%\batch\compile.bat eib_hmg               /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat ctklib                /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat About                 /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat ClearRecords          /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat csv2Memeory           /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat DataBaseInit          /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat DeleteQuote           /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat Download              /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat download_csv          /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat DownloadQuestion      /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat EndOfProgram          /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat GetDateFile           /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat SetNavigation         /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat ViewData              /nl %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MoveActiveWindow      /nl %1 %2 %3 %4 %5 %6 %7 %8 %9

call %MG_ROOT%\batch\compile.bat eib_hmg /lo /b ctklib /b About /b ClearRecords /b csv2Memeory /b DataBaseInit /b DeleteQuote /b Download /b download_csv /b DownloadQuestion /b EndOfProgram /b GetDateFile /b SetNavigation /b ViewData /b MoveActiveWindow /r eib_hmg /nx %1 %2 %3 %4 %5 %6 %7 %8 %9

call %MG_ROOT%\batch\compile.bat eib_hmg               /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat ctklib                /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat About                 /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat ClearRecords          /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat csv2Memeory           /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat DataBaseInit          /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat DeleteQuote           /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat Download              /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat download_csv          /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat DownloadQuestion      /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat EndOfProgram          /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat GetDateFile           /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat SetNavigation         /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat ViewData              /do %1 %2 %3 %4 %5 %6 %7 %8 %9
call %MG_ROOT%\batch\compile.bat MoveActiveWindow      /do %1 %2 %3 %4 %5 %6 %7 %8 %9

IF NOT EXIST eib_hmg.exe goto :END
IF NOT EXIST c:\upx-win32\upx.exe goto :END

IF EXIST c:\upx-win32\upx.exe c:\upx-win32\upx.exe -9 -q eib_hmg.exe -o eib.exe

IF EXIST eib.exe DEL eib_hmg.exe

:END

title OK
