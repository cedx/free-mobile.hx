<?php declare(strict_types=1);
use free_mobile\{Client};

/** Sends an SMS notification. */
function main(): void {
	$client = new Client("your account identifier", "your API key");
	// For example: new Client("12345678", "a9BkVohJun4MAf")

	$client->sendMessage("Hello World from PHP!")->then(
		fn() => print "The message was sent successfully.",
		fn($error) => print "An error occurred: $error"
	);
}
