package slot.net.data.deserialization;

import slot.net.StringDataSource;

class IntDeserializer extends BaseDeserializer
{

	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var int:Int = Reflect.getProperty(input, fieldToGet);
		
		data.writeInt(int);
		
		return int;
	}
}