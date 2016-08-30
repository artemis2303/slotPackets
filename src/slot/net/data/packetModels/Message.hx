package slot.net.data.packetModels;

import slot.net.data.*;

class Message extends BasePacketData 
{	
	public var type:Int = 6;
	public var message:String;
	
	public function new ()
	{	
		super();	
		
		fields = ["type", "message"];
		types = ["single", "string"];
	}
	
	override public function toString():String
	{
		return "[Message\n type=" + type + "\n message=" + message + ")]";
	}
}