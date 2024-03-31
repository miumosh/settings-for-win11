# Environment
- OS : Windows 11 pro



# Create local account
- Never link it to your Microsoft account.



# Windows Update
- Update functionality if necessary.



# Delete unnecessary applications
- Remove unwanted apps using "Revo Uninstaller Portable".



# Change keybind

- Change "CapsLock" to "Ctrl" using the ChgKey15 app.
- Change key bindings with AutoHotkey app.
    - ./AutoHotkey/AlwaysOnTop.ahk
    - ./AutoHotkey/keybind.ahk



# Installation
- WSL

  ```
  wsl --install
  ```


- VSCode

  Check ./VSCode/readme.md


- Git

  for Credential Manager for Windows

  ```powershell
  winget install Git.Git
  ```


- PowerShell Core

  ```powershell
  $PSversionTable
  # install PS Core from GUI
  # https://learn.microsoft.com/ja-jp/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#installing-the-msi-package
  
  # scoop
  Set-ExecutionPolicy RemoteSigned -scope CurrentUser
  iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
  scoop status
  
  # fzf
  scoop install fzf
  fzf --version
  Get-Command fzf*
  
  # PSFzf
  Install-Module -Name PSFzf
  Get-InstalledModule | ? Name -eq PSFzf
  
  # Path
  $new_dir = "C:\Users\miyakei\scoop\shims"
  $new_path = [Environment]::GetEnvironmentVariable("Path", "User")
  $new_path += ";$new_dir"
  [Environment]::SetEnvironmentVariable("Path", $new_path, "User")
  
  # Set profile like zshrc
  echo $PROFILE
  New-Item -Type File -Path $PROFILE -Force
  notepad $PROFILE
  # Check ./PS1-Core
  ```


- Chrome
  - Sync Account
  - [economical mode](https://otona-life.com/2023/01/11/152644/)
  - chrome://xx
    - [chrome://discards/](chrome://discards/)
    - [chrome://discards/database/](chrome://discards/database/)
    - [chrome://discards/graph/](chrome://discards/graph/)


- Lancher
  - Check ./Lancher


- Enpass
  - Sync Vault


- Android Studio ( yet )
  - “Lets View” is also recomended


- Tidy Tabs ( yet )
  - Explorer tab function


- Mouse without Borders  ( yet )
  - Mouse over to another PC


- Motion pro ( yet )
  - VPN Client for IBM
