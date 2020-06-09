package free_mobile;

import haxe.io.Path;
import thenshim.Promise;

using StringTools;

#if nodejs
import haxe.Exception;
import fetch.Fetch;
import js.html.URLSearchParams;
#else
import haxe.Http;
#end

/** Sends messages by SMS to a [Free Mobile](https://mobile.free.fr) account. **/
@:expose class Client {

	/** The URL of the API end point. **/
	public final endPoint: String;

	/** The identification key associated to the account. **/
	public final password: String;

	/** The user name associated to the account. **/
	public final username: String;

	/** Creates a new client. **/
	public function new(username: String, password: String, endPoint = "https://smsapi.free-mobile.fr") {
		this.endPoint = Path.removeTrailingSlashes(endPoint);
		this.password = password;
		this.username = username;
	}

	/** The handler of "request" events. **/
	public dynamic function onRequest(event: RequestEvent) {}

	/** The handler of "response" events. **/
	public dynamic function onResponse(event: RequestEvent) {}

	/** Sends a SMS message to the underlying account. **/
	public function sendMessage(text: String): Promise<Any> {
		final message = text.trim().substring(0, 160);
		final url = '$endPoint/sendmsg';

		#if nodejs
			final query = new URLSearchParams();
			query.append("msg", message);
			query.append("pass", password);
			query.append("user", username);

			onRequest(new RequestEvent("request", this, url));
			return Fetch.fetch('$url?$query').then(
				response -> {
					onResponse(new RequestEvent("response", this, url));
					response.ok ? null : throw new Exception("An error occurred while querying the end point.", url);
				},
				error -> throw new ClientException(Std.string(error), url)
			);
		#else
			final http = new Http(url);
			http.addParameter("msg", message);
			http.addParameter("pass", password);
			http.addParameter("user", username);

			return new Promise<Any>((resolve, reject) -> {
				onRequest(new RequestEvent("request", this, url));
				http.onBytes = bytes -> { onResponse(new RequestEvent("response", this, url)); resolve(null); };
				http.onError = error -> reject(new ClientException(error, http.url));
				http.request(false);
			});
		#end
	}
}
