package slot.net.data.deserialization;

import slot.net.StringDataSource;
import slot.net.data.ArrayData1;

class ArrayDeserializer2 extends BaseDeserializer
{
	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var inData:ArrayData2 = Reflect.getProperty(input, fieldToGet);
		var size:Int = inData.data.length;
		
		for (i in 0...size)
		{
			data.writeInt(inData.data[i]);
		}
		
		return inData;
	}
}