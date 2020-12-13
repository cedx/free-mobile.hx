#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

tool/clean.ps1
tool/version.ps1
tool/build.ps1

Get-ChildItem lib/php -Exclude adapter.php, free_mobile | Remove-Item -Force -Recurse
