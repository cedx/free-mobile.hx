//! --class-path src --library tink_core
import free_mobile.Platform;
import sys.FileSystem;
import sys.io.File;
using Lambda;

/** Builds the documentation. **/
function main() {
	["CHANGELOG.md", "LICENSE.md"].iter(file -> File.copy(file, 'docs/${file.toLowerCase()}'));
	if (FileSystem.exists("docs/api")) Tools.removeDirectory("docs/api");

	Sys.command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	Sys.command("lix", ["run", "dox",
		"--define", "description", "Send SMS messages to your Free Mobile device, in Haxe.",
		"--define", "source-path", "https://github.com/cedx/free-mobile.hx/blob/main/src",
		"--define", "themeColor", "0xea8220",
		"--define", "version", Platform.packageVersion,
		"--define", "website", "https://github.com/cedx/free-mobile.hx",
		"--input-path", "var",
		"--output-path", "docs/api",
		"--title", "Free Mobile for Haxe",
		"--toplevel-package", "free_mobile"
	]);

	File.copy("docs/favicon.ico", "docs/api/favicon.ico");
}
