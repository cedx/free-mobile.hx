<?php
/**
 * Generated by Haxe 4.1.4
 */

namespace free_mobile;

use \php\Boot;
use \haxe\Exception;

/**
 * An exception caused by an error in a `Client` request.
 */
class ClientException extends Exception {
	/**
	 * Creates a new client exception.
	 * 
	 * @param string $message
	 * @param Exception $previous
	 * 
	 * @return void
	 */
	public function __construct ($message = "", $previous = null) {
		if ($message === null) {
			$message = "";
		}
		parent::__construct($message, $previous);
	}
}

Boot::registerClass(ClientException::class, 'free_mobile.ClientException');
