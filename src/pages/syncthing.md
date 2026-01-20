---
layout : "base-layout.njk"
title: "Sync your devices for free with Syncthing (Syncing Obsidian included)"
tags: ["Tech", "Offline"]
--- 

In this article we will speak about synching devices, we will sync between Android 12 and Windows 11 using **Syncthing**.

## What is Syncthing ?
Syncthing is an open source project to sync files for free. it is great because syncing has been a paid future since ever, or exclusive to specialists.
Syncthing is **peer-to-peer** syncing app, it uses **LAN**(Local Area Network) feature in routers. So, your files are not leaving to an external server, and your devices should be connected on the same network. 

<br>
<br>

## Installing Syncthing :
This is their [main download page](https://syncthing.net/downloads/), you can check it to install your device edition. <br>
**For Windows**
you will find two editions: 
- [Base](https://syncthing.net/downloads/#base-syncthing) edition
- [syncTrayzor](https://github.com/GermanCoding/SyncTrayzor/releases/tag/v2.0.4) edition 

we advice you to download the syncTrayzor edition.
You need to check your processor architecture first, use [CPU-Z](https://www.cpuid.com/softwares/cpu-z.html) to do it, there are versions for Android and Windows.
When you open it navigate to `system` tab then look at `Kernel Architecture` property (field). Then search in the internet about:
- If the architecture belongs to **ARM** family or to **x86** family
- If the architecture is a 32-bit or 64-bit <br>

That all what you need to know which edition you need to download. we will make an article about CPUs architectures later.

**For Android**
The project has no official support for Android. Or more likely it has been stopped by Syncthing themselves. Anyway there is a third-party app called **Syncthing-Fork** it is working great without problems so far.
Download it from google play if you want but if you like us you can download it from [F-Droid store](https://f-droid.org/en/packages/com.github.catfriend1.syncthingfork/)

**For Linux-based Systems**
Really !!! you are using Linux and need a tutorial ??
This is the download page [here](https://syncthing.net/downloads/). That’s all what you need.

<br>
<br>

## The Setting Up :
After you install **SuncTrayzor** on the desktop and **Syncthing-Frok** on Android. 
Open **SuncTrayzor** and in the top strip you will find on the right three buttons, one of them called **Actions** press it then press **Show ID**.
This will show the id of your device

**Now** Jump to your Android device. Open the app. in the top strip on the right side there is a button, its icon showing laptop, plus sign and a mobile. click it,
At the first field enter your Laptop ID or press the QR-code icon next to it to scan the QR-code on your laptop. Usually if you are already connected on the same network you will see your device ID under the **Discovered devices** section which is directly under the ID input field. 
Now press the correct sign in the upper-right corner to save changes. 

you should see now your laptop in the devices tab on your phone. Also your phone will be visible under **Remote Devices** Label in your Desktop app.

**Next** go back to **SuncTrayzor** and look for `+ Add Folder` button.
Click it add the label, the **Folder_id** (make it easy we will use it later), and the folder path. then move to the **Sharing** tab in the upper strip, check your phone name to allow sharing with it. click save of course after you finish.
**Note: this is note enough to start sharing your folder. You need to add the folder id in the android app too** 

**Next** on your android device got o folders tab and press the icon on the top strip on the right (the folder icon) to add the folder.
- Add the folder label
- The folder’s ID (very important to match the folder if on your desktop app)
- add the directory of the folder that you want to be shared from and to it.
- Check you computer under the devices filed to allow sharing
- press the correct sign in the top right corner. 
That is all, now you should being able to see the two apps sharing the files between the folders.

<br>
<br>

## Targeting Obsidian app
To sync **Obsidian** all what  you need to know is your vault’s location in both devices and add it as the folder path on both Synchthing apps.
for example on my Android app the path is <br>
`/emulated/0/Documents/Obsidian/vault1/` <br>
and on my laptop <br>
`~/Documents/Obsidian/vault1/` <br>
Enjoy ;)
