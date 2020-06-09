import free_mobile.*;

/** A sample class. **/
class Example {

	/** Sends an SMS notification. **/
	static function main() {
		final client = new Client("your account identifier", "your API key");
		// For example: new Client("12345678", "a9BkVohJun4MAf")

		client.sendMessage("Hello World from Haxe!").then(
			_ -> Sys.println("The message was sent successfully."),
			error -> Sys.println('An error occurred: $error')
		);
	}
}
