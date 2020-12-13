package free_mobile;

import haxe.Exception;

/** An exception caused by an error in a `Client` request. **/
@:expose class ClientException extends Exception {

	/** The URL of the HTTP request that failed. **/
	public final url: String;

	/** Creates a new client exception. **/
	public function new(message = "", url = "", ?previous: Exception) {
		super(message, previous);
		this.url = url;
	}
}
