//! --class-path src --library tink_core
import free_mobile.Platform;

/** Publishes the package. **/
function main() {
	Tools.compress(["CHANGELOG.md", "LICENSE.md", "README.md", "haxelib.json", "src"], "var/haxelib.zip");
	Sys.command("haxelib submit var/haxelib.zip");
	for (action in ["tag", "push origin"]) Sys.command('git $action v${Platform.packageVersion}');
}
