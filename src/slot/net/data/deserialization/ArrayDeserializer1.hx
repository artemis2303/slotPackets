package slot.net.data.deserialization;

import slot.net.StringDataSource;
import slot.net.data.ArrayData1;

class ArrayDeserializer1 extends BaseDeserializer
{
	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var inData:ArrayData1 = Reflect.getProperty(input, fieldToGet);
		
		data.writeSingle(inData.size);
		
		for (i in 0...inData.size)
		{
			data.writeArray(inData.data[i]);
		}
		
		return inData;
	}
}