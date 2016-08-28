package slot.net.data;
import openfl.Vector;

class Message
{
	public var type:Int = 6;
	public var mesage:String;
	
	public function new() 
	{
		
	}
	
	public function toString():String 
	{
		return "[Spin type=" + type + " mesage=" + mesage + "]";
	}
}