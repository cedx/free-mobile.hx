import {Client, ClientException} from "@cedx/free-mobile.hx";

/**
 * Sends an SMS notification.
 * @return {Promise<void>} Completes when the program is terminated.
 */
async function main() {
	try {
		const client = new Client("your account identifier", "your API key");
		// For example: new Client("12345678", "a9BkVohJun4MAf")

		await client.sendMessage("Hello World from Node.js!");
		console.log("The message was sent successfully.");
	}

	catch (error) {
		console.log(`An error occurred: ${error}`);
		if (error instanceof ClientException) console.log(`From: ${error.uri.href}`);
	}
}
