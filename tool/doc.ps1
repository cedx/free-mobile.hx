#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

$version = (Get-Content haxelib.json | ConvertFrom-Json).version
haxe build_doc.hxml
haxelib run dox `
	--define description "Send SMS messages to your Free Mobile device. A simple and free way to monitor your applications using a Free Mobile account." `
	--define source-path "https://git.belin.io/cedx/free-mobile.hx/src/branch/main/src" `
	--define themeColor 0xffc105 `
	--define version $version `
	--define website "https://belin.io" `
	--input-path var `
	--output-path docs/api `
	--title "FreeMobile.hx" `
	--toplevel-package free_mobile

Copy-Item docs/favicon.ico docs/api
