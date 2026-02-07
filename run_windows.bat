@echo off
echo ================================
echo Flutter Todo App - Quick Start
echo ================================
echo.

echo [1/3] Installing dependencies...
call flutter pub get
if %errorlevel% neq 0 (
    echo ERROR: Failed to get dependencies
    pauseecho 
    exit /b 1
)
echo.
echo 
echo [2/3] Enabling web support...
call flutter config --enable-web
echo.

echo [3/3] Checking available devices...
call flutter devices
echo.

echo ================================
echo Setup complete! 
echo ================================
echo.
echo To run the app, choose one:
echo.
echo   Web (Chrome):      flutter run -d chrome
echo   Windows Desktop:   flutter run -d windows
echo   Android Emulator:  flutter run
echo.
echo Press any key to run on Chrome...
pause > nul

echo.
echo Starting app on Chrome...
call flutter run -d chrome
