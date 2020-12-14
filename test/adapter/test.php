<?php declare(strict_types=1);
use free_mobile\php\{Client, ClientException};

require_once __DIR__."/../../vendor/autoload.php";

/** Tests the PHP adapter. */
function main(): void {
	// It should throw an exception if an error occurred.
	try {
		$client = new Client("anonymous", "secret", "http://localhost:10000");
		$client->sendMessage("Hello World from PHP!");
		assert("Exception not thrown.");
	}

	catch (Throwable $e) {
		assert($e instanceof ClientException);
	}

	// It should send an SMS if all goes well.
	$client = new Client(getenv("FREEMOBILE_USERNAME"), getenv("FREEMOBILE_PASSWORD"));
	return $client->sendMessage("Hello World from PHP!");
}

// Run the test.
main();
