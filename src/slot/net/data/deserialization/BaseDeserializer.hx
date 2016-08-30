package slot.net.data.deserialization;
import slot.net.StringDataSource;
import slot.net.data.packetModels.BasePacketData;

class BaseDeserializer
{
	var data:StringDataSource;
	
	public var fieldToGet:String;

	public function new(data:StringDataSource) 
	{
		this.data = data;
	}
	
	public function deserialize(input:BasePacketData):Dynamic
	{
		return null;
	}
}