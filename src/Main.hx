package;

import haxe.format.JsonParser;
import openfl.Assets;
import openfl.Vector;
import openfl.display.Sprite;
import slot.net.StringDataSource;
import slot.net.data.InitializePacket;
import slot.net.data.Spin;
import slot.net.data.deserialization.DataDeserializer;
import slot.net.data.serialization.DataSerializer;

class Main extends Sprite 
{
	
	public function new() 
	{
		super();
		
		
		var dataSource:StringDataSource = new StringDataSource();
		dataSource.data = "1000104271010101010101007051010101010101010101010061010101010101b322d1d11172114";
		//dataSource.data = "052193332022755666555114144430219333344424225055511016666721933322625550566674440411312193331104444043372255565666219333555114744474335066622000001010101010104271010071a4138805101010101010170505051100101010101000000000000000001a121416181a21421e22823223c25026427828c2a02b42c82f0311831403168319031f43258332033e806101010101010";
		
		var dataSerializer = new DataSerializer(dataSource);
		dataSerializer.setSerializeStructure(Assets.getText("packets/lastState.data"));
		
		var packet:Spin = new Spin();
		dataSerializer.serialize(packet);
		
		trace(dataSource.position, dataSource.length);
		trace(packet);
		
		var dataOutput:StringDataSource = new StringDataSource();
		var dataDeserializer:DataDeserializer = new DataDeserializer(dataOutput);
		dataDeserializer.setDeserializersStructure(Assets.getText("packets/lastState.data"));
		
		dataDeserializer.deserialize(packet);
		
		trace(dataSource.length, dataOutput.length);
		
		trace(dataSource.data.toLowerCase() == dataOutput.data.toLowerCase());
		trace(dataSource.data);
		trace(dataOutput.data);
		
		
		//new Test();
		
	}
	
	

}
//0521933320227556665551141444302193333444242250555110166667219333226255505666744404113121933311044440433722555656662193335551147444743350666220000
//052193332022755666555114144430219333344424225055511016666721933322625550566674440411312193331104444043372255565666219333555114744474335066622000001