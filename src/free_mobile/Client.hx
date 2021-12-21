package free_mobile;

import tink.QueryString;
import tink.Url;
import tink.http.Client as HttpClient;
import tink.http.Response.IncomingResponse;

using StringTools;
using haxe.io.Path;
using tink.CoreApi;

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
	public function sendMessage(text: String) {
		final queryString = QueryString.build({
			msg: text.trim().substring(0, 160),
			pass: apiKey,
			user: account
		});

		return HttpClient
			.fetch(baseUrl.resolve('sendmsg?$queryString'))
			.next(IncomingResponse.readAll)
			.noise();
	}
}
