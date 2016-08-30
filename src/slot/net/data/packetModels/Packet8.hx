package slot.net.data.packetModels;

import slot.net.data.*;

class Packet8 extends BasePacketData 
{	
	public var type:Int = 8;
	
	public function new ()
	{	
		super();	
		
		fields = ["type"];
		types = ["single"];
	}
	
	override public function toString():String
	{
		return "[Packet8\n type=" + type + ")]";
	}
}