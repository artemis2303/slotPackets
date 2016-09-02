package slot.net.data.deserialization;

import slot.net.StringDataSource;

class DoubleDeserialization extends BaseDeserializer
{
	public function new(data:StringDataSource, isRequired:Bool = true) 
	{
		super(data, isRequired);
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var double:Int = Reflect.getProperty(input, fieldToGet);
		
		if (double == 0 && !isRequired)
			return null;
		
		data.writeDouble(double);
		
		return double;
	}
}