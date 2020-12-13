package free_mobile;

import tink.QueryString;
import tink.http.Client as Http;

using StringTools;
using haxe.io.Path;

/** Sends messages by SMS to a [Free Mobile](https://mobile.free.fr) account. **/
@:expose class Client {

	/** The URL of the API end point. **/
	final endPoint: String;

	/** The identification key associated to the account. **/
	final password: String;

	/** The user name associated to the account. **/
	final username: String;

	/** Creates a new client. **/
	public function new(username: String, password: String, endPoint = "https://smsapi.free-mobile.fr") {
		this.endPoint = endPoint.removeTrailingSlashes();
		this.password = password;
		this.username = username;
	}

	/** Sends a SMS message to the underlying account. **/
	public function sendMessage(text: String): Promise<Noise> {
		final url = '$endPoint/sendmsg?' + QueryString.build({
			msg: text.trim().substring(0, 160),
			pass: password,
			user: username
		});

		return try Http.fetch(url).map(outcome -> switch outcome {
			case Success(_): Success(Noise);
			case Failure(error): error.code == InternalError && ~/content-length header is required/i.match(error.message)
				? Success(Noise)
				: Failure(error);
		}) catch (e) new Error(e.message);
	}
}
