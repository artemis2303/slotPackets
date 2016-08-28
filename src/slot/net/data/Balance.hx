package slot.net.data;
import openfl.Vector;

class Balance
{
	public var type:Int = 3;
	public var balance:Int;
	
	public function new() 
	{
		
	}
	
	public function toString():String 
	{
		return "[Spin type=" + type + " balance=" + balance + "]";
	}
}