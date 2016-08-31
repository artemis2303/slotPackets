package slot.net.data.serialization;

import slot.net.StringDataSource;

class ArrayIntSingleSerializer extends BaseSerializer
{
	public function new(data:StringDataSource, isRequired:Bool = true) 
	{
		super(data, isRequired);
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		if (!isRequired && data.length <= data.position)
			return null;
			
		var size:Int = data.readInt();
		var outData:Array<Int> = new Array<Int>();
		
		for (i in 0...size)
		{
			outData.push(data.readSingle());
		}
		
		Reflect.setField(output, fieldToSet, outData);
		
		return outData;
	}
}