package free_mobile;

import tink.QueryString;
import tink.Url;
import tink.http.Client as HttpClient;

using StringTools;
using haxe.io.Path;

/** Sends messages by SMS to a [Free Mobile](https://mobile.free.fr) account. **/
class Client {

	/** The Free Mobile account. **/
	public final account: String;

	/** The Free Mobile API key. **/
	public final apiKey: String;

	/** The base URL of the remote API endpoint. **/
	public final baseUrl: Url = "https://smsapi.free-mobile.fr/";

	/** Creates a new client. **/
	public function new(account: String, apiKey: String, ?baseUrl: Url) {
		this.account = account;
		this.apiKey = apiKey;
		if (baseUrl != null) this.baseUrl = Path.addTrailingSlash(baseUrl);
	}

	/** Sends a SMS message to the underlying account. **/
	public function sendMessage(text: String): Promise<Noise> {
		final queryString = QueryString.build({
			msg: text.trim().substring(0, 160),
			pass: apiKey,
			user: account
		});

		return HttpClient.fetch(baseUrl.resolve('sendmsg?$queryString')).noise();

		/* TODO
		.map(outcome -> {
			trace(outcome);
			switch outcome {
				case Success(_): Success(Noise);
				case Failure(error): error.code == InternalError && ~/content-length header is required/i.match(error.message)
						? Success(Noise)
						: Failure(error);
			}
		}) catch (e) {
			trace(e);
			new Error(e.message);
		}*/
	}
}
