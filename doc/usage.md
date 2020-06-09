---
path: src/branch/main
source: src/free_mobile/Client.hx
---

# Usage

## SMS notifications
**FreeMobile.hx** provides the `Client` class, which allow to send SMS messages to your mobile phone by using the `sendMessage()` method:

=== "Haxe"
		:::haxe
		import free_mobile.Client;

		class Main {
			static function main() {
				final client = new Client("your account identifier", "your API key");
				// For example: new Client("12345678", "a9BkVohJun4MAf")

				client.sendMessage("Hello World from Haxe!").then(
					_ -> Sys.println("The message was sent successfully."),
					error -> Sys.println('An error occurred: $error')
				);
			}
		}

=== "JavaScript"
		:::js
		import {Client} from "@cedx/free-mobile.hx";

		async function main() {
			try {
				const client = new Client("your account identifier", "your API key");
				// For example: new Client("12345678", "a9BkVohJun4MAf")

				await client.sendMessage("Hello World from Node.js!");
				console.log("The message was sent successfully.");
			}

			catch (error) {
				console.log(`An error occurred: ${error}`);
			}
		}

=== "PHP"
		:::php
		<?php
		use free_mobile\{Client};

		function main(): void {
			$client = new Client("your account identifier", "your API key");
			// For example: new Client("12345678", "a9BkVohJun4MAf")

			$client->sendMessage("Hello World from PHP!")->then(
				fn() => print("The message was sent successfully."),
				fn($error) => print("An error occurred: $error")
			);
		}

The `Client.sendMessage()` method rejects with a `ClientException` if any error occurred while sending the message.

!!! warning
	The text of the messages will be automatically truncated to **160** characters:  
	you can't send multipart messages using this library.
