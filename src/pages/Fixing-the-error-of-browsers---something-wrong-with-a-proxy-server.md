---
layout : "base-layout.njk"
title: "Fixing the error of browsers - something wrong with a proxy server"
tags: ["Tech"]
---

if your browser returning the error **No Internet** with message :
something wrong with a proxy server of the address is not correct.
Or if you used a VPN then the internet stopped working. So, this is the solution.
<br>
<br>

Step 1: Disable or uninstall the VPN
- If the VPN is still installed, open it and disconnect.  
- If you don’t plan to use it again, uninstall it:  
  Start → Settings → Apps → Apps & features → [VPN app] → Uninstall.

---

Step 2: Reset proxy settings
1. Press Windows key + R, type inetcpl.cpl, and hit Enter.  
2. Go to the Connections tab → LAN settings.  
3. Make sure “Use a proxy server for your LAN” is unchecked.  
4. Ensure “Automatically detect settings” is checked.  
👉 This restores the default proxy configuration.

---

Step 3: Reset DNS
1. Press Windows key + R, type cmd, and hit Enter.  
2. In the Command Prompt, run these commands one by one:
   
   ipconfig /release
   ipconfig /flushdns
   ipconfig /renew
   
   👉 This clears cached DNS and resets your IP configuration.

---

Step 4: Reset network settings (optional but thorough)
- Go to Start → Settings → Network & Internet → Status.  
- Scroll down and click Network reset.  
- This reinstalls all network adapters and resets everything to default.  
⚠️ You’ll need to reconnect to Wi-Fi afterward.

---

Step 5: Test
- Open your browser and try a simple site like https://www.google.com.  
- If it loads, you’re back to default settings.

---
Usually, fixing the proxy settings (Step 2) is enough after a VPN messes things up. The DNS flush (Step 3) is the next most common fix.  
<br>
<br>
<br>
<br>
<br>
