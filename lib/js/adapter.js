"use strict";
const {Client, ClientException} = require("./bundle.js").free_mobile;

/** Sends messages by SMS to a [Free Mobile](https://mobile.free.fr) account. */
exports.Client = class _Client extends Client {

	/**
	 * Sends a SMS message to the underlying account.
	 * @param {string} text The message to send.
	 * @return {Promise<void>} Completes when the message has been sent.
	 */
	sendMessage(text) {
		return new Promise((resolve, reject) => super.sendMessage(text).handle(outcome => {
			if (outcome.toString().startsWith("Success")) resolve();
			else reject(new ClientException(outcome.failure.message));
		}));
	}
};
