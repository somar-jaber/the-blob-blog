---
layout : "base-layout.njk"
title: "Kill all processes that come from a folder"
tags: ["Tech"]
---

sometimes you want to move , copy or delete a file or a folder but an annoying message pops up telling you that there is something using this file or running inside the folder so you can’t continue your action.

And As usual we got you! : run this command in CMD or PwerShell in Admin mode :
```shell
Get-Process | Where-Object { $_.Path -like "C:\Path\To\Folder\*" } | Stop-Process -Force
```
Replace the `C:\Path\To\Folder` by the real folder path.

Nice hunt ;) 