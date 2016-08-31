package slot.net.data;

class ArrayData1
{
	public var size:Int = 0;
	public var data:Array<Array<Int>> = new Array<Array<Int>>();
	
	public function new() 
	{
		
	}
	
	public function toString():String 
	{
		return "[ArrayData1 size=" + size + " data=[" + data.join('],\n[') + "]]";
	}
}