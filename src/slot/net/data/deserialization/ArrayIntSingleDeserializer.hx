package slot.net.data.deserialization;

import slot.net.StringDataSource;

class ArrayIntSingleDeserializer extends BaseDeserializer
{
	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var inData:Array<Int> = Reflect.getProperty(input, fieldToGet);
		if (inData == null)
			return inData;
			
		data.writeInt(inData.length);
		
		for (i in 0...inData.length)
		{
			data.writeSingle(inData[i]);
		}
		
		return inData;
	}
}