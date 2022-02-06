package free_mobile;

/** Defines the interface of the remote API. **/
interface RemoteApi {

	/** Sends a SMS message to the specified Free Mobile account. **/
	@:get function sendmsg(query: {user: String, pass: String, msg: String}): Noise;
}
