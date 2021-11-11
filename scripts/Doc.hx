import Sys.*;
import Tools.removeDirectory;
import haxe.Json;
import sys.FileSystem.*;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	if (exists("docs")) removeDirectory("docs");

	command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	command("lix", [
		"run", "dox",
		"--define", "description", "Send SMS messages to your Free Mobile device, in Haxe.",
		"--define", "source-path", "https://bitbucket.org/cedx/free-mobile.hx/src/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", Json.parse(getContent("haxelib.json")).version,
		"--define", "website", "https://bitbucket.org/cedx/free-mobile.hx",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "Free Mobile for Haxe",
		"--toplevel-package", "free_mobile"
	]);

	copy("www/favicon.ico", "docs/favicon.ico");
}
