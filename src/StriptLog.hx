package;
import openfl.Assets;
import openfl.desktop.Clipboard;
import openfl.desktop.ClipboardFormats;

/**
 * ...
 * @author gNikro
 */
class StriptLog
{

	public function new() 
	{
		var out:Array<String> = new Array<String>();
		var pathToLog:String = "log";
		
		var log:String = Assets.getText("logs/" + pathToLog + ".log");
		
		var reg:EReg = new EReg("ProcessSocketServerCallCommand.hx:[0-9]+: (.*) ,SPIN DATA:", "m");
		
		var i:Int = 0;
		while (reg.match(log))
		{
			out.push("<spin>" + reg.matched(1) + "</spin>");
			log = reg.matchedRight();
		}
		trace(out.length);
		Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, out.join("\n"), false);
	}
	
}