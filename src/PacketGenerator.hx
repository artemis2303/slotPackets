package;

#if macro
import haxe.Template;
import haxe.macro.Context;
#end

class PacketGenerator
{
	
	public function new() 
	{
		
	}
	
	static var types:Map<String, String>;
	macro public static function _generate()
	{
		types = new Map<String, String>();
		types.set("single", "Int");
		types.set("double", "Int");
		types.set("notRequiredDouble", "Int");
		types.set("int", "Int");
		types.set("string", "String");
		types.set("arrayData1", "ArrayData1");
		types.set("arrayData2", "ArrayData2");
		types.set("arrayData3", "ArrayData2");
		types.set("array8Double", "Array<Int>");
		types.set("array5Double", "Array<Int>");
		types.set("array4Double", "Array<Int>");
		types.set("array3Double", "Array<Int>");
		types.set("arrayDoubleInt", "Array<Int>");
		types.set("arrayIntSingle", "Array<Int>");
		types.set("notRequiredArrayIntSingle", "Array<Int>");
		
		var packetsList = sys.FileSystem.readDirectory("packets");
		
		for (packet in packetsList)
		{
			if(packet.indexOf(".data") != -1)
				generatePacketModel("packets/" + packet);
		}
		
		return macro $v{0};
	}
	
	static var pattern:EReg = new EReg("(.+?)[\t ]+(.+?)[; \t\r\n]+", "");
	static var pattern2:EReg = new EReg("[\t ]+=[\t ](.+?);", "");
	static var pattern3:EReg = new EReg("//(.*)", "");
	static function buildStructure(structure:String):Dynamic
	{
		var lines:Array<String> = structure.split("\n");
		var classProperties:Array<Dynamic> = new Array<Dynamic>();
		var data:Dynamic = {CLASS_PROPERTIES:classProperties, length:-1};
		var toString:String = "";
		var c:Int = 0;
		
		for (i in 0...lines.length)
		{
			if (lines[i].length == 0)
				continue;
				
			data.length++;
			
			var fieldName:String;
			var fieldType:String;
				
			var comment:String = null;
			var defaultValue:String = null;
			
			if (pattern.match(lines[i]))
			{
				fieldName = pattern.matched(1);
				fieldType = pattern.matched(2);
			}
			
			if (pattern2.match(lines[i]))
			{
				defaultValue = pattern2.matched(1);
			}
			
			if (pattern3.match(lines[i]))
			{
				comment = pattern3.matched(1);
			}
			
			
			var property:Dynamic = {name:fieldName, fieldType:fieldType, type:types.get(fieldType), comment:comment, defaultValue:defaultValue, c:c++};
			classProperties.push(property);
		}
		
		return data;
	}
	
	static function generatePacketModel(packet:String):Void
	{
		var name:String = StringTools.replace(packet, ".data", "");
		name = name.substring(name.lastIndexOf('/') + 1, name.length);
		
		var packetData:String = getFile(packet);
		var templateSource:String = getFile("template/PacketTemplate.mtt");
		var templateData:Dynamic = buildStructure(packetData);
		templateData.CLASS_NAME = name;
		
		var template:Template = new Template(templateSource);
		
		var classSource:String = template.execute(templateData);
		
		#if macro
		sys.FileSystem.createDirectory("src/slot/net/data/packetModels/");
		var f = sys.io.File.write("src/slot/net/data/packetModels/" + name + ".hx" , true);
			f.writeString(classSource);
			f.close();
		#end
	}
	
	static function getFile(p):String
	{
		var data:String;
		
		try 
		{
			#if macro
			data = sys.io.File.getContent(p);
			#end
		}
		catch (e:Dynamic) 
		{
			
		}
		
		return data;
	}


}