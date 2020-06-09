package free_mobile;

import utest.Assert;
import utest.Async;
import utest.Test;

using thenshim.PromiseTools;

/** Tests the features of the `Client` class. **/
class ClientTest extends Test {

	/** Tests the `sendMessage()` method. **/
	@:timeout(5000)
	function testSendMessage(async: Async) {
		// It should reject if a network error occurred.
		var client = new Client("anonymous", "secret", "http://localhost:10000");
		async.branch(branch -> client.sendMessage("Hello World!")
			.then(_ -> Assert.fail("Exception not thrown"), e -> Assert.isTrue(Std.isOfType(e, ClientException)))
			.finally(() -> branch.done()));

		// It should emit events.
		client = new Client(Sys.getEnv("FREEMOBILE_USERNAME"), Sys.getEnv("FREEMOBILE_PASSWORD"));
		async.branch(branch -> client.onRequest = event -> {
			Assert.equals(client, event.client);
			Assert.equals("request", event.name);
			Assert.equals('${client.endPoint}/sendmsg', event.url);
			branch.done();
		});

		// It should resolve if the message is sent.
		async.branch(branch -> client.sendMessage('Bonjour Cédric, à partir de Haxe/${CompilerTarget.getName()} !')
			.then(_ -> Assert.pass(), e -> Assert.fail(Std.string(e)))
			.finally(() -> branch.done()));
	}
}
