package slot.net.data.serialization;

import openfl.Vector;
import slot.net.StringDataSource;

class ArrayDoubleIntSerialize extends BaseSerializer
{
	public function new(data:StringDataSource) 
	{
		super(data);
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		var size:Int = data.readDouble();
		var outData:Vector<Int> = new Vector<Int>();
		
		for (i in 0...size)
		{
			outData.push(data.readInt());
		}
		
		Reflect.setField(output, fieldToSet, outData);
		
		return outData;
	}
}