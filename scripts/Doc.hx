//! --class-path src --library tink_core
import free_mobile.Version;
import sys.FileSystem;
import sys.io.File;

/** Builds the documentation. **/
function main() {
	if (FileSystem.exists("docs")) Tools.removeDirectory("docs");

	Sys.command("haxe --define doc-gen --no-output --xml var/api.xml build.hxml");
	Sys.command("lix", ["run", "dox",
		"--define", "description", "Send SMS messages to your Free Mobile device, in Haxe.",
		"--define", "source-path", "https://github.com/cedx/free-mobile.hx/blob/main/src",
		"--define", "themeColor", "0xffc105",
		"--define", "version", Version.packageVersion,
		"--define", "website", "https://github.com/cedx/free-mobile.hx",
		"--input-path", "var",
		"--output-path", "docs",
		"--title", "Free Mobile for Haxe",
		"--toplevel-package", "free_mobile"
	]);

	File.copy("www/favicon.ico", "docs/favicon.ico");
}
