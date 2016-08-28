package slot.net.data.deserialization;

import openfl.Vector;
import slot.net.StringDataSource;

class ArrayDoubleIntDeserialize extends BaseDeserializer
{
	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var inData:Vector<Int> = Reflect.getProperty(input, fieldToGet);
		data.writeDouble(inData.length);
		
		for (i in 0...inData.length)
		{
			data.writeInt(inData[i]);
		}
		
		return inData;
	}
}