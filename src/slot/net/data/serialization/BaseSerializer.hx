package slot.net.data.serialization;

import slot.net.StringDataSource;

class BaseSerializer implements ISerializator
{
	var data:StringDataSource;
	var fieldToSet:String;

	public function new(data:StringDataSource) 
	{
		this.data = data;
	}
	
	public function serialize(output:Dynamic):Dynamic 
	{
		throw "Serialize should be implemented";
		return null;
	}
	
}