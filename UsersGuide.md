# Backup My Project: User's Guide



## Requirements

* Windows 10/11 with **Windows PowerShell 5.1** (included in Windows)



## Install

1. Download the latest release from the [Releases page](https://github.com/RemusRigo/BackupMyProject-PowerShell/releases).
2. Copy the `BackupMyProject` folder to a permanent location, for example `D:\My Apps\BackupMyProject\`.
   The **Send to** shortcut points to this folder, so don't move it afterwards (or run `Install.bat` again).
3. Double-click `Install.bat`. It creates `BackupMyProject.bat` in your **Send to** folder and opens that folder.

> If Windows blocks the scripts, right-click each `.ps1` file → **Properties** → check **Unblock** → **OK**.



## Usage

Right-click your project folder (or a single file) → **Send to** → **BackupMyProject.bat**.

The backup is saved next to the project, named after it:

```
D:\My Projects\
├── MyApp\                     ← the project you backed up
└── MyApp.zip                  ← the archive
    ├── 2025-07-22 14-30\      ← first backup
    └── 2025-07-23 09-15\      ← next backup, added to the same zip
```

Every backup adds a new folder to the same zip, so the zip keeps the whole history of your project.



## Change the folder name inside the zip

Open `BackupMyProject.ps1` and change the `$folderStructure` line:

|You want|Set|
|-|-|
|date and time (default)|`$folderStructure = Get-Date -Format "yyyy-MM-dd HH-mm"`|
|date only|`$folderStructure = Get-Date -Format "yyyy-MM-dd"`|
|date and time with seconds|`$folderStructure = Get-Date -Format "yyyy-MM-dd HH-mm-ss"`|
|no folder (files at the root of the zip)|`$folderStructure = ""`|

> Use `-` (not `:`) between hours, minutes and seconds: `:` is not allowed in folder names.



## Uninstall

1. Press **Win+R**, type `shell:sendto`, and delete `BackupMyProject.bat`.
2. Delete the `BackupMyProject` folder.
