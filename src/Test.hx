package;
import openfl.Vector;
import slot.net.StringDataSource;

/**
 * ...
 * @author gNikro
 */
class Test
{

	public function new() 
	{
		
		/*var writeData:StringDataSource = new StringDataSource();
		writeData.writeSingle(0);
		writeData.writeSingle(5);
		writeData.writeArray([1, 7, 5, 3, 7, 2, 4, 0, 6, 7, 4, 8, 5, 6, 9, 4, 5, 2, 6, 7, 8, 4, 5, 1, 6, 7, 3, 4, 5, 7, 6, 4, 5, 6, 8, 4, 7, 5, 4, 6, 5]);
		
		trace(writeData.data);
		
		return;*/
		
		var data:StringDataSource = new StringDataSource();
					
		//data.data = "052291753724067485694526784516734576456847546522d26714350746375279456456745671364256347147256522f7358643751726049612734612534567456745712534871623c542706371435249261435671234567567456172435637152435760476273233734172483670526954156012345167845071627342586273143521617853724063756946821452146207143507146352794021973586437017826049524164582174257063761435249263567521a734152487346706526985145380001010101010104271010071a413880a101010101010170a0a0a1100101010101000000000000000001c11121314151a1f21421921e22822d23223c24625025a26427828c2a02b42c82fa312c319031f433e80b1010101010101010101010";
		data.data = "052193332022755666555114144430219333344424225055511016666721933322625550566674440411312193331104444043372255565666219333555114744474335066622000001010101010104271010071a4138805101010101010170505051100101010101000000000000000001a121416181a21421e22823223c25026427828c2a02b42c82f0311831403168319031f43258332033e806101010101010";
		
		trace('type', data.readSingle());
		
		var reelsCount:Int = data.readSingle();
		trace("reels count", reelsCount);
		
		for (i in 0...reelsCount)
		{
			var reel:Vector<Int> = data.readArray();
			trace(reel);
			//trace('reel' + (i + 1));
			//trace('elements length', reel.length);
			//trace("elements", reel);
			//trace("==========================");
		}
		trace('-----------------');
		var value:Int = data.readSingle();
		
		for (i in 0...value)
		{
			trace(data.readArray());
		}
		
		trace(data.readDouble());
		trace(data.readSingle());
		
		var j = (reelsCount < 5) ? 5 : reelsCount;
		for(i in 0...j)
		{
			trace(data.readInt());
		}
		
		trace(data.readInt());
		trace(data.readInt());//money count
		trace(data.readInt());
		trace(data.readDouble());
		trace(data.readInt());//mb min bet
		trace(data.readInt());//max bet
		trace(data.readDouble());//mb min bet
		trace(data.readInt());
		trace(data.readInt());
		trace(data.readInt());
		trace(data.readInt());
		trace(data.readInt());
		trace(data.readInt());
		trace(data.readInt());
		trace(data.readDouble());
		trace(data.readDouble());
		trace(data.readDouble());
		trace(data.readInt());
		trace(data.readDouble());
		
		trace('a of int');
		for (i in 0...5)
		{
			trace(data.readInt());
		}
		
		trace('a of double');
		for (i in 0...8)
		{
			trace(data.readDouble());
		}
		
		var size:Int = data.readDouble();
		trace("size", size);
		
		for (i in 0...size)
		{
			trace(data.readInt());
		}
		
		
		var size:Int = data.readDouble();
		trace("size", size);
		
		for (i in 0...size)
		{
			trace(data.readInt());
		}
		
		
	}
	
}