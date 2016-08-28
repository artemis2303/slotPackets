package slot.net.data.serialization;

import slot.net.StringDataSource;
import slot.net.data.ArrayData1;

class ArraySerializer1 extends BaseSerializer
{
	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		var reelData:ArrayData1 = new ArrayData1();
		
		reelData.size = data.readSingle();
		
		for (i in 0...reelData.size)
		{
			reelData.data.push(data.readArray());
		}
		
		Reflect.setField(output, fieldToSet, reelData);
		
		return reelData;
	}
}