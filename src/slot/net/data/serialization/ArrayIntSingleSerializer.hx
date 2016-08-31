package slot.net.data.serialization;

import slot.net.StringDataSource;

class ArrayIntSingleSerializer extends BaseSerializer
{
	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		if (data.length < data.position)
			return null;
			
		var size:Int = data.readInt();
		var outData:Array<Int> = new Array<Int>();
		trace("Size", size);
		for (i in 0...size)
		{
			outData.push(data.readSingle());
		}
		
		Reflect.setField(output, fieldToSet, outData);
		
		return outData;
	}
}