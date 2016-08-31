package slot.net.data.serialization;

import slot.net.StringDataSource;

class DoubleSerializer extends BaseSerializer
{

	public function new(data:StringDataSource, isRequired:Bool = true) 
	{
		super(data, isRequired);
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		if (data.length <= data.position && !isRequired)
			return null;
			
		var double:Int = data.readDouble();
		
		Reflect.setField(output, fieldToSet, double);
		
		return double;
	}
}