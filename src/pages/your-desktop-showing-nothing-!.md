---
layout : "base-layout.njk"
title: "Your Desktop showing nothing !"
tags: ["Tech"]
--- 

Your computer ran into a problem and maybe after the restart it logged in but after the login-screen there is nothing, just a screen with a one color (black, blue , etc.). There are no icons and no thing else.  Don’t worry we got you.

## explorer.exe
Your problem that the desktop app (process) is stopped. 
To fix this we need to deal with a **shell Process** called `explorer.exe` , 
which is responsible for :
- **Desktop environment**
- **File Explorer windows**
- **Taskbar** (not the task manager)
- **Start menu**
- **System tray**

This is exactly why, 
when `explorer.exe`  crashes, you lose:
- Desktop icons
- Taskbar
- Start menu
- File Explorer windows
All of these are part of the same shell process.


## How to launch explorer.exe 
When you reach the desktop, press `Ctrl + Shift + esc` to open the **Task Manager** (a separate system process). Then in Task Manager look to the upper right corner to find the `Run new task` button , that is on Windows 11.
On Windows 10 click on `File` tab in the upper strip (top left corner) then press `Run new taks`. 

( `!` Note : if your system is locked to a language other than English jump to <a href="#language">How to force changing the language of the system ?</a>

After you clicked it. Enter in the dialog box `cmd` , then press Enter.
When the Command Prompt opens enter in it :
`taskkill /f /im explorer.exe`  &nbsp;&nbsp;&nbsp;&nbsp;*cmd is case-insensitive*
We want to make sure that the process is really not running , and if it is we want to take it down to restart it.
Then enter again in cmd the command :
`start explorer.exe` 
Congratulations ! 
Your Desktop has been returned. 



<h2 id="language" >How to force changing the language of the system ?</h2>
**First method :**
You can try going back to the lock screen (login screen) by pressing 
`alt + ctrl + delete` 
then press Sign Out. there you should see at the bottom an icon for the language.

**Second method :** 
Using **powershell** 
Task Manager → File → Run new task
- Type : `powershell`
- Then in powershell write : 
```cmd
Set-WinUserLanguageList en-US -Force
```
This forces English as the only keyboard language.

**Third method :**
By using the **Control Panel module for “Region and Language” settings** which known as `intl.cpl` .
First go to task manager and then create a new task, write there 
`control intl.cpl` 
Then
- Press Enter
- This opens the Region & Language settings window
- Switch the keyboard to English from there
Even if the desktop is broken, this control panel window usually still works.

The End.
