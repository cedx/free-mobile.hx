#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

tool/clean.ps1
tool/version.ps1
tool/build.ps1

Get-ChildItem lib/php -Exclude adapter.php, free_mobile, tink | Remove-Item -Force -Recurse
Get-ChildItem lib/php/tink -Exclude querystring | Remove-Item -Force -Recurse
Get-ChildItem lib/php/tink/querystring -Exclude *0.php | Remove-Item -Force -Recurse
