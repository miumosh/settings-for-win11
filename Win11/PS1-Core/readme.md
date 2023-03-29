# History save path
```ps1
Get-PSReadlineOption
# HistorySavePath: C:\Users\xxx\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
```

# Check history
```ps1
Get-Content (Get-PSReadlineOption).HistorySavePath
```
