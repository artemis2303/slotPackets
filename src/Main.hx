package;

import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.text.TextFieldAutoSize;
import openfl.ui.Keyboard;
import slot.net.StringDataSource;
import slot.net.data.deserialization.DataDeserializer;
import slot.net.data.packetModels.Balance;
import slot.net.data.packetModels.BasePacketData;
import slot.net.data.packetModels.Initialize;
import slot.net.data.packetModels.Message;
import slot.net.data.packetModels.Packet8;
import slot.net.data.packetModels.Spin;
import slot.net.data.serialization.DataSerializer;

class Main extends Sprite 
{	
	static var dataInput:StringDataSource = new StringDataSource();
	static var dataOutput:StringDataSource = new StringDataSource();
	
	var dataSerializer = new DataSerializer(dataInput);
	var dataDeserializer:DataDeserializer = new DataDeserializer(dataOutput);	
	var packets:Map<String, Class<BasePacketData>>;
	var inputView:TextField;
	var outputView:TextField;
	
	public function new() 
	{
		super();
		
		trace("....");
		stage.scaleMode = "noScale";
		stage.align = "TL";
		
		packets = new Map<String, Class<BasePacketData>>();
		packets.set("0", Initialize);
		packets.set("1", Spin);
		packets.set("3", Balance);
		packets.set("6", Message);
		packets.set("7", Message);
		packets.set("8", Packet8);
		
		var versionView:TextField = new TextField();
		addChild(versionView);
		versionView.autoSize = TextFieldAutoSize.LEFT;
		versionView.text = "v." + Version.getVersion() + "";
		
		//var dataSource:StringDataSource = new StringDataSource();
		//dataSource.data = "3267";
		//dataSource.data = "103079fc4a914264810162162162151607051010101010101010101010061010101010101b322d1d11172114";
		//dataSource.data = "052193332022755666555114144430219333344424225055511016666721933322625550566674440411312193331104444043372255565666219333555114744474335066622000001010101010104271010071a4138805101010101010170505051100101010101000000000000000001a121416181a21421e22823223c25026427828c2a02b42c82f0311831403168319031f43258332033e806101010101010";
		
		var outputHeader:TextField = new TextField();
		outputHeader.text = "Output:";
		outputView = new TextField();
		outputView.border = true;
		addChild(outputHeader);
		addChild(outputView);
		
		var inputHeader:TextField = new TextField();
		inputHeader.text = "Input:";
		inputView = new TextField();
		inputView.type = TextFieldType.INPUT;
		inputView.border = true;
		addChild(inputHeader);
		addChild(inputView);
		
		var okButton:Sprite = new Sprite();
		var ok:TextField = new TextField();
		ok.text = "  OK  ";
		ok.selectable = false;
		
		ok.background = true;
		ok.backgroundColor = 0xCCCCCC;
		ok.autoSize = TextFieldAutoSize.LEFT;
		okButton.addChild(ok);
		addChild(okButton);
		
		inputHeader.autoSize = TextFieldAutoSize.LEFT;
		outputHeader.autoSize = TextFieldAutoSize.LEFT;
		
		inputView.width = stage.stageWidth - 10;
		inputView.height = 100;
		
		outputView.width = stage.stageWidth - okButton.width - 15;
		outputView.height = 300;
		
		inputHeader.x = inputHeader.y = 5;
		inputView.x = 5;
		inputView.y = inputHeader.height + inputHeader.y + 5;
		
		outputHeader.x = 5;
		outputHeader.y = inputView.y + inputView.height + 10;
		outputView.x = 5;
		outputView.y = outputHeader.y + outputHeader.height + 5;
		
		okButton.x = outputView.x + outputView.width + 5;
		okButton.y = outputView.y + outputView.height - okButton.height;
		
		versionView.x = stage.stageWidth - versionView.width - 5;
		
		inputView.text = "0521933320227556665551141444302193333444242250555110166667219333226255505666744404113121933311044440433722555656662193335551147444743350666220000";
		
		okButton.addEventListener(MouseEvent.MOUSE_DOWN, onProcess);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}
	
	private function onKeyDown(e:KeyboardEvent):Void 
	{
		if (e.keyCode == Keyboard.ENTER)
			onProcess();
	}
	
	private function onProcess(e:MouseEvent = null):Void 
	{
		trace("process");
		try
		{
			dataInput.data = inputView.text;
			
			if (!packets.exists(inputView.text.charAt(0)))
				throw "packet with code " + inputView.text.charAt(0) + " does not exist";
				
			var packet:Class<BasePacketData> = packets.get(inputView.text.charAt(0));
			var asString:String = (dataSerializer.serialize(Type.createInstance(packet, [])));
			outputView.text = "" + asString;
		}
		catch (e:Dynamic)
		{
			trace('error');
			outputView.text = e.toString();
		}
	}
	
	

}
//0521933320227556665551141444302193333444242250555110166667219333226255505666744404113121933311044440433722555656662193335551147444743350666220000
//052193332022755666555114144430219333344424225055511016666721933322625550566674440411312193331104444043372255565666219333555114744474335066622000001