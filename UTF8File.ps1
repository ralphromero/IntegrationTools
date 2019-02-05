<#  
    .SYNOPSIS
    Changes all schemas and maps to UTF-8
    .DESCRIPTION
    Schemas and maps that use UTF-16 show up as binary data in GIT which makes them opaque.
    This script will recurse through a folder and convert all files to UTF-8 which won't impact usage within Biztalk
    but makes the text visible within GIT.
#>
param (
    [Parameter(Mandatory = $true)]
    [string]$path
)
function GetPath {
    param (
        [System.IO.FileInfo]$fileInfo
    )
    return ([System.IO.Path]::Combine($fileInfo.DirectoryName, $fileInfo.Name))
}

if (!(Test-Path $path)) {
    Write-Host 'Path is invalid'
    Exit
}
$schemaFileList = Get-ChildItem -Path $path -Filter '*.xsd' -Recurse

Write-Host "Fixing Schemas"
foreach ($i in $schemaFileList) {
    $iPath = GetPath($i)
    Write-Host $iPath
    (Get-Content $iPath) -replace 'UTF-16', 'UTF-8' | Set-Content -Encoding UTF8 $iPath
}

$mapFileList = Get-ChildItem -Path $path -Filter '*.btm' -Recurse
Write-Host "Fixing Maps"
foreach ($i in $mapFileList) {
    $iPath = GetPath($i)
    Write-Host $iPath
    (Get-Content $iPath) -replace 'UTF-16', 'UTF-8' | Set-Content -Encoding UTF8 $iPath
}
