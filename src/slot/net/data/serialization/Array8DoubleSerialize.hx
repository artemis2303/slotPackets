package slot.net.data.serialization;

import openfl.Vector;
import slot.net.StringDataSource;

class Array8DoubleSerialize extends BaseSerializer
{
	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		var outData:Vector<Int> = new Vector<Int>();
		
		for (i in 0...8)
		{
			outData[i] = (data.readDouble());
		}
		
		Reflect.setField(output, fieldToSet, outData);
		
		return outData;
	}
}