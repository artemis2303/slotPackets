package slot.net.data;
import openfl.Vector;

class ArrayData2
{
	public var data:Array<Int> = new Array<Int>();
	
	public function new() 
	{
		
	}

	public function toString():String 
	{
		return "[ArrayData2 data=" + data.join(", ") + "]";
	}
}