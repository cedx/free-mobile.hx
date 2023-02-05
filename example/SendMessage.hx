import free_mobile.Client;
using tink.CoreApi;

/** Sends an SMS notification. **/
function main() {
	final client = new Client("your account identifier", "your API key");
	client.sendMessage("Hello World from Haxe!").handle(outcome -> switch outcome {
		case Success(_): trace("The message was sent successfully.");
		case Failure(error): trace('An error occurred: ${error.message}');
	});
}
