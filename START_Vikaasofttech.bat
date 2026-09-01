@echo off
setlocal
cd /d "%~dp0"
set PORT=8765
where py >nul 2>&1
if %errorlevel%==0 (
  start "Vikaasofttech Server" /min py -m http.server %PORT% --bind 127.0.0.1 --directory "%~dp0"
) else (
  where python >nul 2>&1
  if %errorlevel%==0 (
    start "Vikaasofttech Server" /min python -m http.server %PORT% --bind 127.0.0.1 --directory "%~dp0"
  ) else (
    echo Python is required for the local PC launcher.
    echo You can still open index.html directly, but PWA/service-worker features need a server.
    pause
    exit /b 1
  )
)
timeout /t 1 /nobreak >nul
where msedge >nul 2>&1
if %errorlevel%==0 (
  start "" msedge --app="http://127.0.0.1:%PORT%/index.html"
  exit /b 0
)
where chrome >nul 2>&1
if %errorlevel%==0 (
  start "" chrome --app="http://127.0.0.1:%PORT%/index.html"
  exit /b 0
)
start "" "http://127.0.0.1:%PORT%/index.html"
endlocal
