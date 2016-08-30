package slot.net.data.packetModels;

class BasePacketData
{
	public var types:Array<String> = [];
	public var fields:Array<String> = [];
	
	public function new() 
	{
		
	}	
	
	public function toString():String 
	{
		return "[BasePacketData]";
	}
}