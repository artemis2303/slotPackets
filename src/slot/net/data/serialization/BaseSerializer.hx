package slot.net.data.serialization;

import slot.net.StringDataSource;
import slot.net.data.packetModels.BasePacketData;

class BaseSerializer implements ISerializator
{
	var data:StringDataSource;
	var fieldToSet:String;

	public function new(data:StringDataSource) 
	{
		this.data = data;
	}
	
	public function serialize(output:BasePacketData):Dynamic 
	{
		throw "Serialize should be implemented";
		return null;
	}
	
}