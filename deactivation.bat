# This Script to deactivate Windows , this will be used by the Task Scheduler 
@echo off
cscript C:\Windows\System32\slmgr.vbs /upk
cscript C:\Windows\System32\slmgr.vbs /cpky
cscript C:\Windows\System32\slmgr.vbs /ckms
cscript C:\Windows\System32\slmgr.vbs /rearm