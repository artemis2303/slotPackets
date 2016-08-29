package;
import haxe.macro.Context;
import haxe.macro.Expr.ExprOf;

/**
 * ...
 * @author gNikro
 */
class Version
{
	macro public static function getVersion():ExprOf<Int>
	{
		return toExpr(_getVersion());
	}

	#if macro
		static function toExpr(v:Dynamic) 
		{
			return Context.makeExpr(v, Context.currentPos());
        }
		
		static function _getVersion():Int
		{
			var p = "version.ver";
			
			var ver:String = "0";
			var verAsInt:Int = 0;
			
			try 
			{
				ver = sys.io.File.getContent(p);
				verAsInt = Std.parseInt(ver);
			}
			catch (e:Dynamic) 
			{
				var f = sys.io.File.write(p, true);
				f.writeString("0");
				f.close();
			}
			
			#if !debug
				verAsInt++;
				sys.io.File.saveContent(p, Std.string(verAsInt));
			#end
			
			return verAsInt;
            
		}
	#end
	
}