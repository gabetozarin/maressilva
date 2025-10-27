@echo off
echo Starting accountability reminders...
echo You'll get a popup every 15 minutes.
echo.
echo To stop: close this window
echo.
powershell -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0accountability-reminder.ps1"
