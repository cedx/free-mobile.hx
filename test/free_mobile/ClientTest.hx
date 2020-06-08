package free_mobile;

import utest.Assert;
import utest.Async;
import utest.Test;

using thenshim.PromiseTools;

/** Tests the features of the `Client` class. **/
class ClientTest extends Test {

	/** Tests the constructor. **/
	function testConstructor() {
		// It should throw an exception if the credentials are invalid.
		Assert.raises(() -> new Client("", ""));
	}

	/** Tests the `sendMessage()` method. **/
	function testSendMessage(async: Async) {
		// It should reject if a network error occurred.
		var client = new Client("anonymous", "secret", "http://localhost:10000");
		async.branch(branch -> client.sendMessage("Hello World!")
			.then(_ -> {
				Assert.fail("Exception not thrown");
				branch.done();
			})
			.catchError(e -> {
				Assert.isTrue(Std.isOfType(e, ClientException));
				branch.done();
			}));

		// It should trigger events.
		client = new Client(Sys.getEnv("FREEMOBILE_USERNAME"), Sys.getEnv("FREEMOBILE_PASSWORD"));
		async.branch(branch -> client.onRequest = function(event) {
			Assert.equals(client, event.client);
			Assert.equals("request", event.name);
			Assert.equals('${client.endPoint}/sendmsg', event.url);
			branch.done();
		});

		// It should send SMS messages if credentials are valid.
		async.branch(branch -> client.sendMessage("Bonjour Cédric, à partir de Haxe !")
			.then(_ -> {
				Assert.pass();
				branch.done();
			})
			.catchError(e -> {
				Assert.fail(Std.string(e));
				branch.done();
			}));
	}
}
