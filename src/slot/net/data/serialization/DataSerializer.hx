package slot.net.data.serialization;
import haxe.ds.HashMap;
import openfl.Vector;


class DataSerializer extends BaseSerializer
{
	private var serializers:Vector<ISerializator> = new Vector<ISerializator>();
	private var serializersMap:Map<String, Class<BaseSerializer>> = new Map<String, Class<BaseSerializer>>();
	
	public function new(data:StringDataSource) 
	{
		super(data);
		
		serializersMap.set("single", SingleSerializer);
		serializersMap.set("double", DoubleSerializer);
		serializersMap.set("int", IntSerializer);
		serializersMap.set("arrayData1", ArraySerializer1);
		serializersMap.set("arrayData2", ArraySerializer2);
		serializersMap.set("arrayData3", ArraySerializer3);
		serializersMap.set("array8Double", Array8DoubleSerialize);
		serializersMap.set("arrayDoubleInt", ArrayDoubleIntSerialize);
	}
	
	var pattern:EReg = new EReg("(.{1,}?)[\t ]{1,}(.{1,})", "gi");
	public function setSerializeStructure(structure:String):Void
	{
		var lines:Array<String> = structure.split("\n");
		
		for (i in 0...lines.length)
		{
			if (lines[i].length == 0)
				continue;
				
			pattern.match(lines[i]);
			
			var fieldName:String = pattern.matched(1);
			var fieldType:String = pattern.matched(2);
			
			var serializer:BaseSerializer = Type.createInstance(serializersMap.get(fieldType), [data]);
			serializer.fieldToSet = fieldName;
			
			serializers.push(serializer);
		}
	}
	
	override public function serialize(output:Dynamic):Dynamic 
	{
		for (serializer in serializers)
		{
			serializer.serialize(output);
		}
		
		return output;
	}
	
}