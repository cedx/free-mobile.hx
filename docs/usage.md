# Usage

## SMS notifications
**Free Mobile for Haxe** provides the `Client` class, which allow to send SMS messages to your mobile phone by using the `sendMessage()` method:

```haxe
import free_mobile.Client;
using tink.CoreApi;

function main() {
	final client = new Client("your account identifier", "your API key");
	// For example: new Client("12345678", "a9BkVohJun4MAf")

	client.sendMessage("Hello World from Haxe!").handle(outcome -> switch outcome {
		case Success(_): trace("The message was sent successfully.");
		case Failure(error): trace('An error occurred: ${error.message}');
	});
}
```

The `Client.sendMessage()` method returns a `Promise` that resolves when the message has been sent.

The promise rejects with a `Forbidden` error when the submitted credentials are invalid.
It also rejects with an `InternalError` if any error occurred while sending the message.

!> The text of the messages will be automatically truncated to **160** characters: you can't send multipart messages using this library.
