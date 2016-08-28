package slot.net.data.deserialization;

import slot.net.StringDataSource;

class DoubleDeserialization extends BaseDeserializer
{

	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var double:Int = Reflect.getProperty(input, fieldToGet);
		
		data.writeDouble(double);
		
		return double;
	}
}