package slot.net.data.serialization;

import slot.net.StringDataSource;
import slot.net.data.ArrayData1;

class ArraySerializer2 extends BaseSerializer
{
	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		var outData:ArrayData2 = new ArrayData2();
		
		var size:Int = Reflect.getProperty(output, "reelsData").size;
		
		for (i in 0...size)
		{
			outData.data.push(data.readInt());
		}
		
		Reflect.setField(output, fieldToSet, outData);
		
		return outData;
	}
}