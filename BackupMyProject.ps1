#---------------------------------------------------------------------------------------------------------------------------
# Backup My Project
#  © 2025 Remus Rigo
# v1.2.20250505

param (
    [Parameter(Mandatory=$true)]
    [string]$Location
)

Clear-Host

#---------------------------------------------------------------------------------------------------------------------------

function BackupFile($inputLocation, $zipFolderStructure)
{
   $isDirectory = Test-Path $inputLocation -PathType Container

   if ($isDirectory)
   {
      $zipPath = Split-Path -Path $inputLocation -Parent
      $zipFile = Split-Path -Path $inputLocation -Leaf
      $zipArchive = Join-Path $zipPath "$zipFile.zip"
   }
   else
   {
     $zipPath = Split-Path -Path $inputLocation -Parent
     $zipFile = [System.IO.Path]::GetFileNameWithoutExtension((Split-Path -Path $inputLocation -Leaf))
     $zipArchive = Join-Path $zipPath "$zipFile.zip"
   }

   # Path in %temp%
   $tempRoot = [System.IO.Path]::GetTempPath()
   $tempGuid = [System.Guid]::NewGuid().ToString()
   $tempDir = Join-Path $tempRoot $tempGuid
   New-Item -ItemType Directory -Path $tempDir | Out-Null

   # Forders inside ZIP file
   $structuredFolder = Join-Path $tempDir $zipFolderStructure
   New-Item -ItemType Directory -Path $structuredFolder | Out-Null

   # copy files or folder in %temp%
   if ($isDirectory)
   {
      Copy-Item -Path (Join-Path $inputLocation "*") -Destination $structuredFolder -Recurse
   }
   else
   {
      Copy-Item $inputLocation -Destination $structuredFolder
   }

   # Create or update the ZIP archive
   if (Test-Path $zipArchive) {
      Compress-Archive -Path (Join-Path $tempDir "*") -Update -DestinationPath $zipArchive
   }
   else
   {
      Compress-Archive -Path (Join-Path $tempDir "*") -DestinationPath $zipArchive
   }

   # Clean up %temp% folder
   Remove-Item $structuredFolder -Recurse -Force
}

#---------------------------------------------------------------------------------------------------------------------------

$folderStructure = Get-Date -Format "yyyy.MM.dd"

if (Test-Path $Location -PathType Container) # Location is path ------------------------------------------------------------
{
    BackupFile -inputLocation $Location -zipFolderStructure $folderStructure
}
elseif (Test-Path $Location -PathType Leaf) # Location is file -------------------------------------------------------------
{
   
   BackupFile -inputLocation $Location -zipFolderStructure $folderStructure
}
else
{
    Write-Output "Invalid path: $Path"
}



