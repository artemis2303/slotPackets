package slot.net.data.packetModels;

import slot.net.data.*;

class Initialize extends BasePacketData 
{	
	public var type:Int = 0;
	public var reelsData:ArrayData1;//сами по себе рилы
	public var reelsData2:ArrayData1;//какие то другие рилы но не такие длинные, может быть фриспины
	public var spinType:Int = 0;//может быть использовано для восстановления стейта если тут будет не 0
	public var unknown1:Int;
	public var unknown2:ArrayData2;//массив интов длинной зависимый от количество рилов if reelData.size < 5? 5:reelData.size
	public var unknown3:Int;
	public var balance:Int;
	public var totalWin:Int;//используется если востанавливается стейт
	public var unknown5:Int;
	public var minBet:Int;
	public var maxBet:Int;
	public var minBetMayBe:Int;
	public var unknown6:Int;
	public var unknown7:Int;
	public var unknown8:Int;
	public var unknown9:Int;
	public var unknown10:Int;
	public var unknown11:Int;
	public var unknown12:Int;
	public var unknown13:Int;
	public var unknown14:Int;
	public var unknown15:Int;
	public var unknown16:Int;
	public var unknown17:Int;
	public var unknown18:ArrayData2;//зависит от reelsData2 if reelData2.size < 5? 5:reelData2.size;
	public var gambleHistory:Array<Int>;//используется если востанавливается стейт
	public var betPerLine:Array<Int>;
	public var unknown21:Array<Int>;//возможно win per line Для восстановления стейта. Скорее всего
	
	public function new ()
	{	
		super();	
		
		fields = ["type", "reelsData", "reelsData2", "spinType", "unknown1", "unknown2", "unknown3", "balance", "totalWin", "unknown5", "minBet", "maxBet", "minBetMayBe", "unknown6", "unknown7", "unknown8", "unknown9", "unknown10", "unknown11", "unknown12", "unknown13", "unknown14", "unknown15", "unknown16", "unknown17", "unknown18", "gambleHistory", "betPerLine", "unknown21"];
		types = ["single", "arrayData1", "arrayData1", "double", "single", "arrayData2", "int", "int", "int", "double", "int", "int", "double", "int", "int", "int", "int", "int", "int", "int", "double", "double", "double", "int", "double", "arrayData3", "array8Double", "arrayDoubleInt", "arrayDoubleInt"];
	}
	
	override public function toString():String
	{
		return "[Initialize\n type=" + type + "\n reelsData=" + reelsData + "\n reelsData2=" + reelsData2 + "\n spinType=" + spinType + "\n unknown1=" + unknown1 + "\n unknown2=" + unknown2 + "\n unknown3=" + unknown3 + "\n balance=" + balance + "\n totalWin=" + totalWin + "\n unknown5=" + unknown5 + "\n minBet=" + minBet + "\n maxBet=" + maxBet + "\n minBetMayBe=" + minBetMayBe + "\n unknown6=" + unknown6 + "\n unknown7=" + unknown7 + "\n unknown8=" + unknown8 + "\n unknown9=" + unknown9 + "\n unknown10=" + unknown10 + "\n unknown11=" + unknown11 + "\n unknown12=" + unknown12 + "\n unknown13=" + unknown13 + "\n unknown14=" + unknown14 + "\n unknown15=" + unknown15 + "\n unknown16=" + unknown16 + "\n unknown17=" + unknown17 + "\n unknown18=" + unknown18 + "\n gambleHistory=" + gambleHistory + "\n betPerLine=" + betPerLine + "\n unknown21=" + unknown21 + ")]";
	}
}