@echo off
REM =============================================================================
REM  FLUTTER WEB APP - OPTIMIZED RUN SCRIPT
REM  ==============================================================================
REM  This script runs the Flutter HR Dashboard app on Chrome
REM  =============================================================================

echo.
echo ╔═══════════════════════════════════════════════════════════════════════════╗
echo ║                   FLUTTER HR DASHBOARD - WEB SERVER                        ║
echo ║                      Premium Sky-Blue Theme (Canva)                        ║
echo ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

REM Step 1: Clean everything
echo [1/4] Cleaning build cache...
call flutter clean >nul 2>&1

REM Step 2: Get dependencies
echo [2/4] Getting dependencies...
call flutter pub get >nul 2>&1

REM Step 3: Run on Chrome
echo [3/4] Building and launching Flutter Web...
echo.
echo ⏳ Building... This may take 60-120 seconds on first build
echo.
call flutter run -d chrome --web-port=3000

echo.
echo [4/4] Done! If issues persist, check:
echo   - Internet connectivity (for Google CDN/fonts)
echo   - Firewall settings
echo   - Chrome browser (ensure it's installed)
echo.
pause
