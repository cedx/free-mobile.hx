package free_mobile;

/** Tests the features of the `Client` class. **/
@:asserts class ClientTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `sendMessage()` method, when a failure occurs. **/
	@:timeout(15000)
	public function testFailure() {
		final client = new Client("anonymous", "secret", "http://localhost:10000");
		client.sendMessage("Hello World!").handle(outcome -> switch outcome {
			case Success(_): asserts.fail("Promise not rejected.");
			case Failure(error): { asserts.assert(error.code == InternalError); asserts.done(); }
		});

		return asserts;
	}

	/** Tests the `sendMessage()` method, when a success occurs. **/
	@:timeout(15000)
	public function testSuccess() {
		final client = new Client(Sys.getEnv("FREEMOBILE_USERNAME"), Sys.getEnv("FREEMOBILE_PASSWORD"));
		client.sendMessage('Hello Cédric, from Haxe/${Version.getHaxeTarget().toUpperCase()} !').handle(outcome -> switch outcome {
			case Success(data): { asserts.assert(data == Noise); asserts.done(); }
			case Failure(error): asserts.fail(error.message);
		});

		return asserts;
	}
}
