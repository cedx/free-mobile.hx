# FreeMobile.hx
![Haxe](https://badgen.net/badge/haxe/%3E%3D4.1.0/green) ![Haxelib](https://badgen.net/haxelib/v/free_mobile) ![Downloads](https://badgen.net/haxelib/d/free_mobile)  
![Node.js](https://badgen.net/npm/node/@cedx/free-mobile.hx) ![npm](https://badgen.net/npm/v/@cedx/free-mobile.hx) ![Types](https://badgen.net/npm/types/@cedx/free-mobile.hx) ![Downloads](https://badgen.net/npm/dt/@cedx/free-mobile.hx)  
![PHP](https://badgen.net/packagist/php/cedx/free-mobile.hx) ![Packagist](https://badgen.net/packagist/v/cedx/free-mobile.hx) ![Downloads](https://badgen.net/packagist/dt/cedx/free-mobile.hx)  
![License](https://badgen.net/badge/license/MIT/blue) ![Coverage](https://badgen.net/coveralls/c/github/cedx/free-mobile.hx) ![Build](https://badgen.net/github/checks/cedx/free-mobile.hx/main)


![Free Mobile](img/free_mobile.png)

## Send SMS messages to your Free Mobile account
Send notifications to your own mobile device via any internet-connected device.

For example, you can configure a control panel or a network-attached storage to your home so that they send an SMS to your [Free Mobile](https://mobile.free.fr) phone when an event occurs.

## Quick start

!!! warning
	SMS notifications require an API key. If you are not already registered,
	[sign up for a Free Mobile account](https://mobile.free.fr/subscribe).

### Get an API key
You first need to enable the **SMS notifications** in [your subscriber account](https://mobile.free.fr/moncompte).
This will give you an identification key allowing access to the [Free Mobile](https://mobile.free.fr) API.

![SMS notifications](img/sms_notifications.jpg)  

### Get the library
Install the latest version of **FreeMobile.hx** with your favorite package manager:

=== "Haxe"
		:::shell
		haxelib install free_mobile

=== "JavaScript"
		:::shell
		npm install @cedx/free-mobile.hx

=== "PHP"
		:::shell
		composer require cedx/free-mobile.hx

For detailed instructions, see the [installation guide](installation.md).
