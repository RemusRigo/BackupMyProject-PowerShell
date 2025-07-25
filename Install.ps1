#---------------------------------------------------------------------------------------------------------------------------
# Backup My Project
#  © 2025 Remus Rigo
# v1.1.20250722

$pathBAT=Join-Path -Path ([Environment]::GetFolderPath("SendTo")) -ChildPath BackupMyProject.bat
$pathPS=Join-Path -Path $PSScriptRoot -ChildPath BackupMyProject.ps1

"powershell.exe -ExecutionPolicy Bypass -File `"$($pathPS)`" -Location %1" | Set-Content -Path $pathBAT
