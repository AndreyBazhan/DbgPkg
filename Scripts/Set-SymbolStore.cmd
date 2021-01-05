  @echo off
  @echo.

:start

  set /p SymStore="Enter a path for Symbol Store: "

  if "%SymStore%" == "" @goto start

  if not exist "%SymStore%\SymStore\Symbols"  mkdir "%SymStore%\SymStore\Symbols"
  if not exist "%SymStore%\SymStore\SymCache" mkdir "%SymStore%\SymStore\SymCache"

  setx _NT_SYMBOL_PATH   "srv*%SymStore%\SymStore\Symbols*https://msdl.microsoft.com/download/symbols" /m
  setx _NT_SYMCACHE_PATH "%SymStore%\SymStore\SymCache" /m
