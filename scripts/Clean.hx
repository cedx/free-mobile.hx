import sys.FileSystem;

/** Runs the script. **/
function main() {
	if (FileSystem.exists("test/index.php")) FileSystem.deleteFile("test/index.php");
	for (directory in ["lib", "res"]) if (FileSystem.exists(directory)) Tools.removeDirectory(directory);
	Tools.cleanDirectory("var");
}
