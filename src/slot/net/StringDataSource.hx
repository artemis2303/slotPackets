package slot.net;

import openfl.Vector;

class StringDataSource
{
	@:isVar
	public var data(get, set):String = "";
	
	@:isVar
	public var position(get, set):Int = 0;
	
	@:isVar
	public var length(get, set):Int = 0;
	
	public function new() 
	{
		
	}
	
	function get_length():Int 
	{
		return length;
	}
	
	function set_length(value:Int):Int 
	{
		return length = value;
	}
	
	function get_position():Int 
	{
		return position;
	}
	
	function set_position(value:Int):Int 
	{
		return position = value;
	}
	
	function get_data():String 
	{
		return data;
	}
	
	function set_data(value:String):String 
	{
		length = value.length;
		return data = value;
	}
	
	public function readArray():Vector<Int>
	{
		var length:Int = readInt();
		var array:Vector<Int> = new Vector<Int>();
		
		for (i in 0...length)
		{
			array[i] = read(1);
		}
		
		return array;
	}
	
	public function readInt():Int
	{
		var length:Int = read(1);
		return read(length);
	}
	
	public function readDouble():Int
	{
		return read(2);
	}
	
	public function readSingle():Int
	{
		return read(1);
	}
	
	public function read(length:Int):Int
	{
		if (length == 0)
			return 0;
			
		var dataBuffer:String = "0x";
		for (i in 0...length)
		{
			dataBuffer += data.charAt(position++);
		}
		
		return Std.parseInt(dataBuffer);
	}
	
	public function writeArray(array:Vector<Int>):Void
	{
		var length:Int = array.length;
		
		writeInt(length);
		
		for (i in 0...length)
		{
			write(to16(array[i]));
		}
	}
	
	public function writeInt(value:Int):Void
	{
		var value16:String = to16(value);
		var length:Int = value16.length;
		
		write(to16(length));
		write(value16);
	}
	
	public function writeDouble(value:Int):Void
	{
		var value16:String = to16(value);
		
		if (value16.length == 1)
			value16 = "0" + value16;
		
		write(value16);
	}
	
	public function writeSingle(value:Int):Void
	{
		var value16:String = to16(value);
		write(value16);
	}
	
	public function write(value:String):Void
	{
		data += value;		
		position += value.length;
	}
	
	private function to16(value:Int):String
	{
		return StringTools.hex(value);
	}
}