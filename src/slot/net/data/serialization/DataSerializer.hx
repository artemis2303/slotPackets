package slot.net.data.serialization;
import slot.net.data.packetModels.BasePacketData;


class DataSerializer extends BaseSerializer
{
	private var serializersMap:Map<String, BaseSerializer> = new Map<String, BaseSerializer>();
	
	public function new(data:StringDataSource) 
	{
		super(data);
		
		serializersMap.set("single", new SingleSerializer(data));
		serializersMap.set("double", new DoubleSerializer(data));
		serializersMap.set("int", new IntSerializer(data));
		serializersMap.set("arrayData1", new ArraySerializer1(data));
		serializersMap.set("arrayData2", new ArraySerializer2(data));
		serializersMap.set("arrayData3", new ArraySerializer3(data));
		serializersMap.set("array8Double", new Array8DoubleSerialize(data));
		serializersMap.set("arrayDoubleInt", new ArrayDoubleIntSerialize(data));
		serializersMap.set("string", new StringSerializer(data));
	}
	
	override public function serialize(output:BasePacketData):Dynamic 
	{
		var length:Int = output.types.length;
		for (i in 0...length)
		{
			var type:String = output.types[i];
			var field:String = output.fields[i];
			
			var serializer:BaseSerializer = serializersMap.get(type);
			serializer.fieldToSet = field;
			
			serializer.serialize(output);
		}
		
		return output;
	}
	
}