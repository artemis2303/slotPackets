package slot.net.data.serialization;

import slot.net.StringDataSource;

class IntSerializer extends BaseSerializer
{

	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		var int:Int = data.readInt();
		
		Reflect.setField(output, fieldToSet, int);
		
		return int;
	}
}