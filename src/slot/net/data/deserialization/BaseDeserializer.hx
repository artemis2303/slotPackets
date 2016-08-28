package slot.net.data.deserialization;
import slot.net.StringDataSource;


class BaseDeserializer
{
	var data:StringDataSource;
	
	public var fieldToGet:String;

	public function new(data:StringDataSource) 
	{
		this.data = data;
	}
	
	public function deserialize(input:Dynamic):Dynamic
	{
		return null;
	}
}