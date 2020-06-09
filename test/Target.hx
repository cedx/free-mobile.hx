import haxe.macro.Context;
import haxe.macro.Expr.ExprOf;

/** Provides information about the compiler target. **/
class Target {

	/** Gets the name of the current target. **/
	macro public static function getName(): ExprOf<String>
		return macro $v{Context.definedValue("target.name")};
}
