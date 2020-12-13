package free_mobile;

import haxe.Exception;

/** An exception caused by an error in a `Client` request. **/
@:expose class ClientException extends Exception {

	/** Creates a new client exception. **/
	public function new(message = "", ?previous: Exception) super(message, previous);
}
