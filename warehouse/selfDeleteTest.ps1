$selfPath = $PSCommandPath

# Create a delayed cleanup batch file
$cleanupContent = @"
@echo off
timeout /t 2 /nobreak >nul
del /f /q "$selfPath" 2>nul
rmdir /s /q "C:\Scripts" 2>nul
del /f /q "%~f0" 2>nul
exit /b 0
"@

# Line	                        What It Does
# @echo off	                    Prevents commands from being shown on screen
# timeout /t 2 /nobreak >nul	    Waits 2 seconds (gives PowerShell time to exit)
# rmdir /s /q "C:\Scripts" 2>nul	Deletes the entire C:\Scripts folder and everything inside it
# del /f /q "%~f0" 2>nul	        Deletes the cleanup batch file itself
# exit /b 0	                    Exits with success code

$cleanupPath = Join-Path $env:TEMP "cleanup_$(Get-Random).bat"
[System.IO.File]::WriteAllText($cleanupPath, $cleanupContent)

# Run cleanup and exit
Start-Process -FilePath $cleanupPath -WindowStyle Hidden
exit
