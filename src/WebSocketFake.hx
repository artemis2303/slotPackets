package;
import haxe.Constraints.Function;

class WebSocketFake
{
	var adress:String;
	var protocol:String;
	
	public var onConnet:Function = null;
	
	public function new(adress:String, protocol:String) 
	{
		this.protocol = protocol;
		this.adress = adress;
		
		connect();
	}
	
	private function connect():Void
	{
		onConnet();
	}
	
}