package slot.net.data.deserialization;

import slot.net.StringDataSource;

class StringDeserializer extends BaseDeserializer
{

	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var str:String = Reflect.getProperty(input, fieldToGet);
		
		data.writeString(str);
		
		return str;
	}
}