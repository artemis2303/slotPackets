package slot.net.data.deserialization;

import slot.net.StringDataSource;

class ArrayDoubleIntDeserialize extends BaseDeserializer
{
	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var inData:Array<Int> = Reflect.getProperty(input, fieldToGet);
		data.writeDouble(inData.length);
		
		for (i in 0...inData.length)
		{
			data.writeInt(inData[i]);
		}
		
		return inData;
	}
}