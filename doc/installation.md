# Installation

## Requirements
Before installing **FreeMobile.hx**, you need to make sure you have either
[Haxe](https://haxe.org), [Node.js](https://nodejs.org) or [PHP](https://www.php.net) up and running.
		
You can verify if you're already good to go with the following commands:

=== "Haxe"
		:::shell
		haxe --version
		# 4.1.1

		haxelib version
		# 4.0.2

=== "JavaScript"
		:::shell
		node --version
		# v14.4.0

		npm --version
		# 6.14.5

=== "PHP"
		:::shell
		php --version
		# PHP 7.4.6 (cli) (built: May 12 2020 11:38:52) ( NTS Visual C++ 2017 x64 )

		composer --version
		# Composer version 1.10.7 2020-06-03 10:03:56

!!! info
	If you plan to play with the package sources, you will also need
	[PowerShell](https://docs.microsoft.com/en-us/powershell) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material).

## Installing with a package manager

=== "Haxe"
	From a command prompt, run:

		:::shell
		haxelib install free_mobile

	Now in your [Haxe](https://haxe.org) code, you can use:

		:::haxe
		import free_mobile.*;

=== "JavaScript"
	From a command prompt, run:

		:::shell
		npm install @cedx/free-mobile.hx

	Now in your [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) code, you can use:

		:::js
		// CommonJS module.
		const free_mobile = require("@cedx/free-mobile.hx");

		// ECMAScript module.
		import * as free_mobile from "@cedx/free-mobile.hx";

=== "PHP"
	From a command prompt, run:

		:::shell
		composer require cedx/free-mobile.hx

	Now in your [PHP](https://www.php.net) code, you can use:

		:::php
		<?php
		use free_mobile\{Client, ClientException};