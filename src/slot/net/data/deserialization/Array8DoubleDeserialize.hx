package slot.net.data.deserialization;

import openfl.Vector;
import slot.net.StringDataSource;

class Array8DoubleDeserialize extends BaseDeserializer
{
	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var outData:Vector<Int> = Reflect.getProperty(input, fieldToGet);
		
		for (i in 0...8)
		{
			data.writeDouble(outData[i]);
		}
		
		return input;
	}
}