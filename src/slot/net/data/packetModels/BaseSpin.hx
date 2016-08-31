package slot.net.data.packetModels;

import slot.net.data.*;

class BaseSpin extends BasePacketData 
{	
	public var type:Int = 1;
	public var spinData:Int = 3;//double тип спина, 3 - обычный спин, 8 - сделали халф, 7 - сделал ставку и выиграл или проиграл, 4 - нажали коллект, 0 - ласт стейт, 
	public var errorCode:Int = 0;//код ошиюки 1 - not enought credit; 2 - minimum bet is; >= 3 какая то хуерга если 6 или 5 то стоп будет вызван. Так же блочит все кнопки
	public var userId:Int;
	public var balance:Int;
	public var totalWin:Int;
	public var reels:ArrayData2;
	public var indexOfBetPerLine:Int;
	public var numLines:Int;
	public var unknown7:Int;
	public var unknown8:Int;
	public var unknown9:Int;
	public var unknown10:Int;
	public var unknown11:Int;
	public var unknown12:Int;
	public var winPerLine:ArrayData2;//выигрышные линии и сколько выиграно, скаттеры последняя линия
	public var unknown14:Array<Int>;
	public var gambleHistory:Array<Int>;//история гембла можно слать в виде 0-3 буби, черви, крести, пики
	public var unknown15:Int;//в айрис фенкс если это число 15 то чему то там присваивается -1 если нет то присваевается это число
	public var unknown16:Array<Int>;
	public var unknown17:Array<Int>;
	public var unknown18:Array<Int>;
	public var unknown19:Array<Int>;
	
	public function new ()
	{	
		super();	
		
		fields = ["type", "spinData", "errorCode", "userId", "balance", "totalWin", "reels", "indexOfBetPerLine", "numLines", "unknown7", "unknown8", "unknown9", "unknown10", "unknown11", "unknown12", "winPerLine", "unknown14", "gambleHistory", "unknown15", "unknown16", "unknown17", "unknown18", "unknown19"];
		types = ["single", "double", "single", "int", "int", "int", "arrayData2", "double", "double", "int", "int", "int", "int", "int", "int", "arrayData2", "arrayDoubleInt", "array8Double", "notRequiredDouble", "notRequiredArrayIntSingle", "notRequiredArrayIntSingle", "notRequiredArrayIntSingle", "notRequiredArrayIntSingle"];
	}
	
	override public function toString():String
	{
		return "[BaseSpin\n type=" + type + "\n spinData=" + spinData + "\n errorCode=" + errorCode + "\n userId=" + userId + "\n balance=" + balance + "\n totalWin=" + totalWin + "\n reels=" + reels + "\n indexOfBetPerLine=" + indexOfBetPerLine + "\n numLines=" + numLines + "\n unknown7=" + unknown7 + "\n unknown8=" + unknown8 + "\n unknown9=" + unknown9 + "\n unknown10=" + unknown10 + "\n unknown11=" + unknown11 + "\n unknown12=" + unknown12 + "\n winPerLine=" + winPerLine + "\n unknown14=" + unknown14 + "\n gambleHistory=" + gambleHistory + "\n unknown15=" + unknown15 + "\n unknown16=" + unknown16 + "\n unknown17=" + unknown17 + "\n unknown18=" + unknown18 + "\n unknown19=" + unknown19 + ")]";
	}
}