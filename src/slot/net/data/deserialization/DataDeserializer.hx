package slot.net.data.deserialization;

import openfl.Vector;
import slot.net.data.deserialization.BaseDeserializer;

class DataDeserializer extends BaseDeserializer
{
	private var deserializers:Vector<BaseDeserializer> = new Vector<BaseDeserializer>();
	private var deserializersMap:Map<String, Class<BaseDeserializer>> = new Map<String, Class<BaseDeserializer>>();
	
	public function new(data:StringDataSource) 
	{
		super(data);
		
		deserializersMap.set("single", SingleDeserializer);
		deserializersMap.set("double", DoubleDeserialization);
		deserializersMap.set("int", IntDeserializer);
		deserializersMap.set("arrayData1", ArrayDeserializer1);
		deserializersMap.set("arrayData2", ArrayDeserializer2);
		deserializersMap.set("arrayData3", ArrayDeserializer3);
		deserializersMap.set("array8Double", Array8DoubleDeserialize);
		deserializersMap.set("arrayDoubleInt", ArrayDoubleIntDeserialize);
	}
	
	var pattern:EReg = new EReg("(.{1,}?)[\t ]{1,}(.{1,})", "gi");
	public function setDeserializersStructure(structure:String):Void
	{
		var lines:Array<String> = structure.split("\n");
		
		for (i in 0...lines.length)
		{
			if (lines[i].length == 0)
				continue;
				
			pattern.match(lines[i]);
			
			var fieldName:String = pattern.matched(1);
			var fieldType:String = pattern.matched(2);
			
			var deserializer:BaseDeserializer = Type.createInstance(deserializersMap.get(fieldType), [data]);
			deserializer.fieldToGet = fieldName;
			
			deserializers.push(deserializer);
		}
	}
	
	override public function deserialize(input:Dynamic):Dynamic 
	{
		for (deserializer in deserializers)
		{
			deserializer.deserialize(input);
			//trace(deserializer.fieldToGet);
			//trace(data.length);
			//trace(data.data);
		}
		
		return input;
	}
}