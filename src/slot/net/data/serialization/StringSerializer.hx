package slot.net.data.serialization;

import slot.net.StringDataSource;

class StringSerializer extends BaseSerializer
{

	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		var str:String = data.readString();
		
		Reflect.setField(output, fieldToSet, str);
		
		return str;
	}
}