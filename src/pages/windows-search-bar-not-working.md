---
layout : "base-layout.njk"
title: "Windows Search Bar Not Working ?"
tags: ["Tech"]
---

My windows search bar doesn't work , it keep searching but showing nothing

When your Windows search bar keeps searching but shows no results, this is typically caused by issues with the Windows Search service or corrupted search index. Here are the most effective solutions to fix this problem:

## Restart Windows Search Service

The first and often most effective solution is to restart the Windows Search service[1][2]:

1. Press **Ctrl + Shift + Esc** to open Task Manager
2. Go to the **Details** tab
3. Find **SearchHost.exe** (Windows 11) or **SearchUI.exe** (Windows 10)
4. Right-click it and select **End task**
5. Press **Windows + R**, type `services.msc` and press Enter
6. Scroll down to find **Windows Search**
7. Right-click it and select **Restart**
8. Set the startup type to **Automatic** if it isn't already

## Rebuild the Search Index

If restarting the service doesn't work, rebuild the search index[3][4]:

1. Press **Windows + R**, type `control panel` and press Enter
2. Search for and click **Indexing Options**
3. Click the **Advanced** button
4. Under the Troubleshooting section, click **Rebuild**
5. Click **OK** when warned about the long process time
6. Restart your computer after the rebuild completes

## Run the Search and Indexing Troubleshooter

Windows has a built-in troubleshooter specifically for search issues[2]:

1. Open Command Prompt and run:
   ```
   msdt.exe -ep WindowsHelp id SearchDiagnostic
   ```
2. Follow the troubleshooter prompts to automatically detect and fix search problems

## Check for Excluded Folders

Sometimes folders are excluded from search, causing no results[3]:

1. Press **Windows + I** to open Settings
2. Go to **Privacy & Security** > **Searching Windows**
3. Scroll to **Exclude folders from enhanced search**
4. Remove any folders you want to be searchable by clicking the three dots and selecting **Remove**

## Update Windows

Outdated Windows versions can cause search problems[1][5]:

1. Press **Windows + I** to open Settings
2. Go to **Update & Security** > **Windows Update**
3. Click **Check for updates** and install any available updates
4. Restart your computer after updates complete

## Use System File Checker

Corrupted system files can break Windows Search[6][5]:

1. Open Command Prompt as Administrator
2. Run these commands in order:
   ```
   sfc /scannow
   ```
   Wait for completion, then run:
   ```
   DISM /Online /Cleanup-Image /RestoreHealth
   ```
3. Restart your computer after both commands complete

Most users find success with restarting the Windows Search service or rebuilding the search index. If the problem persists after trying these solutions, the issue may require more advanced troubleshooting or a Windows reset.

