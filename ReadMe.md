# Backup My Project

A PowerShell script to backup my projects. In this way I am archiving my entire project into a zip file named with the "project folder.zip".
Inside the zip file is created a folder named with the current date and inside are the project files from the backup time.

## 

## Authors

* [@remusrigo](https://github.com/RemusRigo)
* [@remusrigo](https://sourceforge.net/u/remusrigo/profile)

## 

## Installation

Just double click on the Install.bat file

Now, when you want to archive your project, just right-click on the project folder, select SendTo and BackupMyProject.bat.
The archive will be a .zip file named after your project folder.
Inside the archive will be a folder named with the current date and inside you will find your backup.

## 

## Appendix

* if you don't want to create a folder inside the zip file:
  *$folderStructure = ""*
* if you want to create a folder containing the date inside the zip:
  *$folderStructure = Get-Date -Format "yyyy-MM-dd"*
* if you want to create a folder containing the date and time inside the zip:
  *$folderStructure = Get-Date -Format "yyyy-MM-dd HH:mm:ss"*

## 

## Roadmap

* 2025-07-22: modify Install.ps1 to create .bat file in SendTo folder
* 2025-06-30: project redesigned
* 2025-05-22: project started
