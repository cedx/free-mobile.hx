package free_mobile;

/** Represents the event parameter used for request events. */
class RequestEvent {

	/** The client which initiated the request. **/
	public final client: Client;

	/** The event name. **/
	public final name: String;

	/** Creates a new request event. **/
	public function new(name: String, client: Client) {
		this.client = client;
		this.name = name;
	}
}
