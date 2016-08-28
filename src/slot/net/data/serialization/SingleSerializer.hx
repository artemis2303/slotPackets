package slot.net.data.serialization;

import slot.net.StringDataSource;

class SingleSerializer extends BaseSerializer
{

	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		var single:Int = data.readSingle();
		
		Reflect.setField(output, fieldToSet, single);
		
		return single;
	}
}