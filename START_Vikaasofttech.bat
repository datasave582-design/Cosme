@echo off
setlocal
cd /d "%~dp0"
set PORT=8765
set SERVER_STARTED=0

rem --- Try to start a local server (needed for full app/offline features) ---
where py >nul 2>&1
if %errorlevel%==0 (
  start "Vikaasofttech Server" /min py -m http.server %PORT% --bind 127.0.0.1 --directory "%~dp0"
  set SERVER_STARTED=1
  goto :openapp
)
where python >nul 2>&1
if %errorlevel%==0 (
  start "Vikaasofttech Server" /min python -m http.server %PORT% --bind 127.0.0.1 --directory "%~dp0"
  set SERVER_STARTED=1
  goto :openapp
)
where node >nul 2>&1
if %errorlevel%==0 (
  start "Vikaasofttech Server" /min node -e "const h=require('http'),fs=require('fs'),path=require('path');const root=process.cwd();const types={'.html':'text/html','.js':'text/javascript','.json':'application/json','.webmanifest':'application/manifest+json'};h.createServer((q,r)=>{let f=path.join(root,decodeURIComponent(q.url.split('?')[0]));if(f.endsWith(path.sep))f+='index.html';fs.readFile(f,(e,d)=>{if(e){r.writeHead(404);r.end('Not found');return;}const ext=path.extname(f);r.writeHead(200,{'Content-Type':types[ext]||'application/octet-stream'});r.end(d);});}).listen(%PORT%,'127.0.0.1');" 
  set SERVER_STARTED=1
  goto :openapp
)

:openapp
timeout /t 1 /nobreak >nul

if %SERVER_STARTED%==1 (
  set APPURL=http://127.0.0.1:%PORT%/index.html
) else (
  echo No Python or Node.js found. Opening directly from disk.
  echo (Some features like offline caching may be limited without a local server.)
  echo Tip: For the best experience, use your browser's "Install App" option once - see README.txt.
  set APPURL=file:///%~dp0index.html
)

rem --- Open as an app window: no address bar, no tabs, looks like real software ---
where msedge >nul 2>&1
if %errorlevel%==0 (
  start "" msedge --app="%APPURL%" --window-size=1280,800
  exit /b 0
)
where chrome >nul 2>&1
if %errorlevel%==0 (
  start "" chrome --app="%APPURL%" --window-size=1280,800
  exit /b 0
)

echo Microsoft Edge or Google Chrome was not found in PATH.
echo Opening in your default browser instead - it may show the normal browser window.
start "" "%APPURL%"
endlocal
