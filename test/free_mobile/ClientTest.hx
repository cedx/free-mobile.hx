package free_mobile;

import tink.core.Error.ErrorCode;

/** Tests the features of the `Client` class. **/
@:asserts final class ClientTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `sendMessage()` method, when a failure occurs. **/
	@:timeout(15_000)
	@:variant("http://localhost:10000", InternalError)
	@:variant("https://smsapi.free-mobile.fr", Forbidden)
	public function failure(input: String, output: ErrorCode) {
		final client = new Client("anonymous", "secret", input);
		asserts.rejects(output, client.sendMessage("Hello World!")).handle(asserts.handle);
		return asserts;
	}

	/** Tests the `sendMessage()` method, when a success occurs. **/
	@:timeout(15_000)
	public function success() {
		final client = new Client(Sys.getEnv("FREEMOBILE_ACCOUNT"), Sys.getEnv("FREEMOBILE_API_KEY"));
		asserts.doesNotReject(client.sendMessage('Hello Cédric, from Haxe/${Platform.haxeTarget}!')).handle(asserts.handle);
		return asserts;
	}
}
