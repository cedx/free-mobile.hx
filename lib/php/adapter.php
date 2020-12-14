<?php declare(strict_types=1);
namespace free_mobile\php;

/** Sends messages by SMS to a [Free Mobile](https://mobile.free.fr) account. */
class Client {

	/** The native client. */
	private \free_mobile\Client $client;

	/** Creates a new client. */
	function __construct(string $username, string $password, ?string $endPoint = null) {
		$this->client = new \free_mobile\Client($username, $password, $endPoint);
	}

	/**
	 * Sends a SMS message to the underlying account.
	 * @throws ClientException Whether an error occurred.
	 */
	function sendMessage(string $text): void {
		$exception = null;
		$this->client->sendMessage($text)->handle(function($outcome) use (&$exception) {
			if ($outcome->tag == "Failure") $exception = new ClientException($outcome->params[0]->message);
		});

		if ($exception) throw $exception;
	}
}

/** An exception caused by an error in a `Client` request. */
class ClientException extends \free_mobile\ClientException {}
