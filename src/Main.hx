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
	var resultView:TextField;
	
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
		outputView.wordWrap = true;
		outputView.multiline = true;
		resultView = new TextField();
		resultView.autoSize = TextFieldAutoSize.LEFT;
		addChild(outputHeader);
		addChild(outputView);
		addChild(resultView);
		
		var inputHeader:TextField = new TextField();
		inputHeader.text = "Input:";
		inputView = new TextField();
		inputView.type = TextFieldType.INPUT;
		inputView.wordWrap = true;
		inputView.multiline = true;
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
		inputView.y = inputHeader.height + inputHeader.y + 3;
		
		outputHeader.x = 5;
		outputHeader.y = inputView.y + inputView.height + 6;
		outputView.x = 5;
		outputView.y = outputHeader.y + outputHeader.height + 3;
		
		resultView.x = 5;
		resultView.y = outputView.y + outputView.height + 1;
		
		okButton.x = outputView.x + outputView.width + 5;
		okButton.y = outputView.y + outputView.height - okButton.height;
		
		versionView.x = stage.stageWidth - versionView.width - 5;
		
		inputView.text = "0531C5765389765389765389765389765389765389765389765389765389765389765389765389765389765389765389765389765389765389765389765389765389765389765489765489765489765489765489765489765489765489765489765489765489761489761489761489761489761489761489761489761489721489721489721489721489000077776666222211119999444455550888829174869254333318924768195238419728465913482917684531284976154238197462153849172654138924765382976532897652389762538972653892765382976532897652389278458976458976458976458976395897631111897231897239189723189888930000888899997777666633332222444408976455558976458976458976278897645555897694589764589764589796458976458976458976358976311118972318972318972318988893000088889999777766663333222244440278897222231897231897231899238889000088889999777766663333444408976455558976495897645897645897645897645897645897635897631111278666777799998888000039888998132798913279813279811113679853679854679854679854679854679854679854679855554679804444222233336531C57653897653897653897653897653897653897653897653897653897653897653897653897653897653897653897653897653897653897653897653897653897653897654897654897654897654897654897654897654897654897654897654897654897614897614897614897614897614897614897614897614897214897214897214897214890000777766662222111199994444555508888291748692543333189247681952384197284659134829176845312849761542381974621538491726541389247653829765328976523897625389726538927653829765328976523892784589764589764589764589763958976311118972318972391897231898889300008888999977776666333322224444089764555589764589764589762788976455558976945897645897645897964589764589764589763589763111189723189723189723189888930000888899997777666633332222444402788972222318972318972318992388890000888899997777666633334444089764555589764958976458976458976458976458976458976358976311112786667777999988880000398889981327989132798132798111136798536798546798546798546798546798546798546798555546798044442222333360001010101010101010071526428101010101010170505051100101010101000000000000000001D111213141516181A21421E22823223C25026427828C2A02B42C82F0311831403168319031F43258332033E806101010101010";
		trace(inputView.length);
		
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
			dataInput.position = 0;
			
			if (!packets.exists(inputView.text.charAt(0)))
				throw "packet with code " + inputView.text.charAt(0) + " does not exist";
				
			var packet:Class<BasePacketData> = packets.get(inputView.text.charAt(0));
			var dataModel:BasePacketData = dataSerializer.serialize(Type.createInstance(packet, []));
			var asString:String = dataModel.toString();
			outputView.text = asString;
			
			resultView.text = dataInput.length == dataInput.position? "data fully parsed":"cannot parse whole packet position=" + dataInput.position + " legnth=" + dataInput.length;
			
			dataOutput.data = "";
			dataOutput.position = 0;
			
			dataDeserializer.deserialize(dataModel);
			
			if (dataInput.data.toLowerCase() != dataOutput.data.toLowerCase())
			{
				resultView.text += " data deserialize check is not pass " + dataOutput.length + "/" + dataInput.length;
			}
			else
			{
				resultView.text += " data deserialize check is pass";
			}
		}
		catch (e:Dynamic)
		{
			trace('error');
			outputView.text = e.toString();
			resultView.text = "an error occured";
		}
	}
	
	

}
//0521933320227556665551141444302193333444242250555110166667219333226255505666744404113121933311044440433722555656662193335551147444743350666220000
//052193332022755666555114144430219333344424225055511016666721933322625550566674440411312193331104444043372255565666219333555114744474335066622000001