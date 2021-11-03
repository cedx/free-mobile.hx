package free_mobile;

import tink.core.Error.ErrorCode;
using AssertionTools;

/** Tests the features of the `Client` class. **/
@:asserts class ClientTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `sendMessage()` method, when a failure occurs. **/
	@:timeout(15000)
	@:variant("http://localhost:10000", InternalError)
	@:variant("https://smsapi.free-mobile.fr", Forbidden)
	public function testFailure(input: String, output: ErrorCode) {
		final client = new Client("anonymous", "secret", input);
		asserts.rejects(client.sendMessage("Hello World!"), output).handle(asserts.handle);
		return asserts;
	}

	/** Tests the `sendMessage()` method, when a success occurs. **/
	@:timeout(15000)
	public function testSuccess() {
		final client = new Client(Sys.getEnv("FREEMOBILE_ACCOUNT"), Sys.getEnv("FREEMOBILE_API_KEY"));
		asserts.doesNotReject(client.sendMessage('Hello Cédric, from Haxe/${Version.getHaxeTarget()}!')).handle(asserts.handle);
		return asserts;
	}
}
