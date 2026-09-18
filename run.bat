@echo off
setlocal
cd /d "%~dp0"

where python >nul 2>&1
if errorlevel 1 (
  echo Python was not found. Install Python 3.10+ from https://www.python.org/downloads/
  echo Tick "Add python.exe to PATH" during setup.
  pause
  exit /b 1
)

python -c "import sys; raise SystemExit(0 if sys.version_info>=(3,10) else 1)"
if errorlevel 1 (
  echo Python 3.10 or newer is required.
  python --version
  pause
  exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
  echo Creating virtual environment...
  python -m venv .venv
  if errorlevel 1 (
    echo Failed to create .venv
    pause
    exit /b 1
  )
)

call ".venv\Scripts\activate.bat"
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
if errorlevel 1 (
  echo pip install failed.
  pause
  exit /b 1
)

echo Installing Playwright Chromium for live portal mode...
python -m playwright install chromium
if errorlevel 1 (
  echo Playwright browser install failed. Dashboard rehearsal will still work.
  echo Live portal mode needs: python -m playwright install chromium
)

echo.
echo Starting launcher...
python launcher.py
if errorlevel 1 pause
endlocal
