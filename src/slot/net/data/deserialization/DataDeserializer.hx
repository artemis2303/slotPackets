package slot.net.data.deserialization;

import slot.net.data.packetModels.BasePacketData;
import slot.net.data.deserialization.BaseDeserializer;

class DataDeserializer extends BaseDeserializer
{
	private var deserializersMap:Map<String, BaseDeserializer> = new Map<String, BaseDeserializer>();
	
	public function new(data:StringDataSource) 
	{
		super(data);
		
		deserializersMap.set("single", new SingleDeserializer(data));
		deserializersMap.set("double", new DoubleDeserialization(data));
		deserializersMap.set("notRequiredDouble", new DoubleDeserialization(data, false));
		deserializersMap.set("int", new IntDeserializer(data));
		deserializersMap.set("arrayData1", new ArrayDeserializer1(data));
		deserializersMap.set("arrayData2", new ArrayDeserializer2(data));
		deserializersMap.set("arrayData3", new ArrayDeserializer3(data));
		deserializersMap.set("array8Double", new Array8DoubleDeserialize(data));
		deserializersMap.set("arrayDoubleInt", new ArrayDoubleIntDeserialize(data));
		deserializersMap.set("arrayIntSingle", new ArrayIntSingleDeserializer(data));
		deserializersMap.set("notRequiredArrayIntSingle", new ArrayIntSingleDeserializer(data, false));
		deserializersMap.set("string", new StringDeserializer(data));
	}
	
	override public function deserialize(input:BasePacketData):Dynamic 
	{
		var length:Int = input.types.length;
		for (i in 0...length)
		{
			var type:String = input.types[i];
			var field:String = input.fields[i];
			
			var deserializer:BaseDeserializer = deserializersMap.get(type);
			deserializer.fieldToGet = field;
			
			deserializer.deserialize(input);
		}
		
		return input;
	}
}