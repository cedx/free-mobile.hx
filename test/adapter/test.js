"use strict";

const assert = require("assert/strict");
const {Client, ClientException} = require("../../lib/js/index.js");

/**
 * Tests the JavaScript adapter.
 * @return {Promise<void>} Completes when the program is terminated.
 */
async function main() {
	let client;

	// It should throw an exception if an error occurred.
	try {
		client = new Client("anonymous", "secret", "http://localhost:10000");
		await client.sendMessage("Hello World from JavaScript/CJS!");
		assert("Exception not thrown.");
	}

	catch (e) {
		assert(e instanceof ClientException);
	}

	// It should send an SMS if all goes well.
	client = new Client(process.env.FREEMOBILE_USERNAME, process.env.FREEMOBILE_PASSWORD);
	return client.sendMessage("Hello World from JavaScript/CJS!");
}

// Run the test.
main().catch(console.error);
