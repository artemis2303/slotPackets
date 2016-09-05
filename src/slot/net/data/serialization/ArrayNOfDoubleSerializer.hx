package slot.net.data.serialization;

import openfl.Vector;
import slot.net.StringDataSource;

class ArrayNOfDoubleSerializer extends BaseSerializer
{
	var size:Int;
	
	public function new(data:StringDataSource, size:Int) 
	{
		super(data);
		this.size = size;
		
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		var outData:Array<Int> = new Array<Int>();
		
		for (i in 0...size)
		{
			outData[i] = (data.readDouble());
		}
		
		Reflect.setField(output, fieldToSet, outData);
		
		return outData;
	}
}