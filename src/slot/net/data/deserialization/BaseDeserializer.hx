package slot.net.data.deserialization;
import slot.net.StringDataSource;
import slot.net.data.packetModels.BasePacketData;

class BaseDeserializer
{
	var data:StringDataSource;
	var isRequired:Bool;
	
	public var fieldToGet:String;

	public function new(data:StringDataSource, isRequired:Bool = true) 
	{
		this.isRequired = isRequired;
		this.data = data;
	}
	
	public function deserialize(input:BasePacketData):Dynamic
	{
		return null;
	}
}