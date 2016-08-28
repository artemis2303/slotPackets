package slot.net.data;
import openfl.Vector;

class ArrayData1
{
	public var size:Int = 0;
	public var data:Vector<Array<Int>> = new Vector<Array<Int>>();
	
	public function new() 
	{
		
	}
	
	public function toString():String 
	{
		return "[ReelData reelsCount=" + size + "]";
	}
}