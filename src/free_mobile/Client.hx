package free_mobile;

import tink.Url;
import tink.Web;
import tink.web.proxy.Remote;
using StringTools;
using haxe.io.Path;

/** Sends messages by SMS to a [Free Mobile](https://mobile.free.fr) account. **/
final class Client {

	/** The Free Mobile account. **/
	public final account: String;

	/** The Free Mobile API key. **/
	public final apiKey: String;

	/** The base URL of the remote API endpoint. **/
	public final baseUrl: Url;

	/** The remote API client. **/
	final remote: Remote<RemoteApi>;

	/** Creates a new client. **/
	public function new(account: String, apiKey: String, ?baseUrl: Url) {
		this.account = account;
		this.apiKey = apiKey;
		this.baseUrl = Path.addTrailingSlash(baseUrl != null ? baseUrl.toString() : "https://smsapi.free-mobile.fr");
		remote = Web.connect((this.baseUrl: RemoteApi));
	}

	/** Sends a SMS message to the underlying account. **/
	public function sendMessage(text: String) return remote.sendmsg({
		user: account,
		pass: apiKey,
		msg: text.trim().substring(0, 160)
	});
}
