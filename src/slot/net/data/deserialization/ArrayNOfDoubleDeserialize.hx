package slot.net.data.deserialization;

import slot.net.StringDataSource;

class ArrayNOfDoubleDeserialize extends BaseDeserializer
{
	var size:Int;
	public function new(data:StringDataSource, size:Int) 
	{
		super(data);
		this.size = size;
		
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var outData:Array<Int> = Reflect.getProperty(input, fieldToGet);
		
		for (i in 0...size)
		{
			data.writeDouble(outData[i]);
		}
		
		return input;
	}
}