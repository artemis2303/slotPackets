package slot.net.data.deserialization;

import slot.net.StringDataSource;

class SingleDeserializer extends BaseDeserializer
{

	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		var single:Int = Reflect.getProperty(input, fieldToGet);
		
		data.writeSingle(single);
		
		return single;
	}
}