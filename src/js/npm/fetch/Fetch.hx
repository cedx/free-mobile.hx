package js.npm.fetch;

#if nodejs
import haxe.extern.EitherType;
import js.html.Request;
import js.html.RequestInit;
import js.html.Response;
import js.lib.Promise;

/** Fetches resources from the network. **/
@:jsRequire("node-fetch")
extern class Fetch {

	/** Fetches the resource corresponding to the specified `request`. **/
	@:selfCall
	static function fetch(request: EitherType<String, Request>, ?options: RequestInit): Promise<Response>;
}
#end
