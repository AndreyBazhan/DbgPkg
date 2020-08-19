  @echo off

  if "%1" == "" @goto Help
  if "%2" == "" @goto Help

  if "%1" == "-e" (

      reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%2" /v TracingFlags /t REG_DWORD /d 1 /f

      @goto :eof
  )

  if "%1" == "-d" (

      reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%2" /v TracingFlags /f

      @goto :eof
  )

:Help

  @echo.
  @echo Usage: EtwHeapTracing [-e ^| -d] ^<ProcessName.exe^>
  @echo.
  @echo    -e    Enables heap tracing.
  @echo    -d    Disables heap tracing.
  @echo.
  @echo Example: EtwHeapTracing -e Notepad.exe
  @echo Example: EtwHeapTracing -d Notepad.exe
