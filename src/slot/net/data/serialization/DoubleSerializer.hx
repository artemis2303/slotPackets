package slot.net.data.serialization;

import slot.net.StringDataSource;

class DoubleSerializer extends BaseSerializer
{

	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		var double:Int = data.readDouble();
		
		Reflect.setField(output, fieldToSet, double);
		
		return double;
	}
}