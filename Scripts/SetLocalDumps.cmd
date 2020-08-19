  @echo off
  @echo.

:start

  set /p LocalDumps="Enter a path for Local Dumps: "

  if "%LocalDumps%" == "" @goto start

  if not exist "%LocalDumps%\CrashDumps" mkdir "%LocalDumps%\CrashDumps"

  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps" /v DumpType /t REG_DWORD /d 2 /f
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps" /v DumpCount /t REG_DWORD /d 0x32 /f
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps" /v DumpFolder /t REG_EXPAND_SZ /d %LocalDumps%\CrashDumps /f