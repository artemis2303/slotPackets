package slot.net.data.packetModels;

import slot.net.data.*;

class Balance extends BasePacketData 
{	
	public var type:Int = 3;
	public var balance:Int;
	
	public function new ()
	{	
		super();	
		
		fields = ["type", "balance"];
		types = ["single", "int"];
	}
	
	override public function toString():String
	{
		return "[Balance\n type=" + type + "\n balance=" + balance + ")]";
	}
}