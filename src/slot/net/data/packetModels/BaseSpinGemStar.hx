package slot.net.data.packetModels;

import slot.net.data.*;

class BaseSpinGemStar extends BasePacketData 
{	
	public var type:Int = 1;
	public var spinData:Int = 3;//double тип спина, 3 - обычный спин, 8 - сделали халф, 7 - сделал ставку и выиграл или проиграл, 4 - нажали коллект, 0 - ласт стейт, 5 - выиграли бонус спины, 6 крутим бонус спины, 12 конец бонус спинов
	public var errorCode:Int = 0;//код ошиюки 1 - not enought credit; 2 - minimum bet is; >= 3 какая то хуерга если 6 или 5 то стоп будет вызван. Так же блочит все кнопки
	public var userId:Int;
	public var balance:Int;
	public var totalWin:Int;
	public var reels:ArrayData2;
	public var indexOfBetPerLine:Int;
	public var numLines:Int;
	public var bonusSpinsTotal:Int;
	public var bonusSpinsLeft:Int;
	public var bonusSpinWin:Int;//сколько выиграл за текущий спин в бонусных спинах
	public var bonusGameMultiplayer:Int;
	public var unknown11:Int;//в бонус спинах оно было 1 хз чт значит может соклько раз выиграл бону спины?
	public var bonusSpinWinTotal:Int;//сколько выиграл в бонус спинах за несоклько раз, но не все сюда складывается, возможно именно сам выигрышь бонус спионв сюда не идет а идут только выигрыши именно за бонус спины
	public var bonusGameReels:ArrayData2;//выигрышные линии и сколько выиграно, скаттеры последняя линия
	public var winPerLine:Array<Int>;//в даймонд манки тут выигрышные линии
	public var gambleHistory:Array<Int>;//история гембла можно слать в виде 0-3 буби, черви, крести, пики
	public var u12:Int;
	public var u13:Int;
	public var u14:Array<Int>;
	
	public function new ()
	{	
		super();	
		
		fields = ["type", "spinData", "errorCode", "userId", "balance", "totalWin", "reels", "indexOfBetPerLine", "numLines", "bonusSpinsTotal", "bonusSpinsLeft", "bonusSpinWin", "bonusGameMultiplayer", "unknown11", "bonusSpinWinTotal", "bonusGameReels", "winPerLine", "gambleHistory", "u12", "u13", "u14"];
		types = ["single", "double", "single", "int", "int", "int", "arrayData2", "double", "double", "int", "int", "int", "int", "int", "int", "arrayData2", "arrayDoubleInt", "array8Double", "int", "double", "array5Double"];
	}
	
	override public function toString():String
	{
		return "[BaseSpinGemStar\n type=" + type + "\n spinData=" + spinData + "\n errorCode=" + errorCode + "\n userId=" + userId + "\n balance=" + balance + "\n totalWin=" + totalWin + "\n reels=" + reels + "\n indexOfBetPerLine=" + indexOfBetPerLine + "\n numLines=" + numLines + "\n bonusSpinsTotal=" + bonusSpinsTotal + "\n bonusSpinsLeft=" + bonusSpinsLeft + "\n bonusSpinWin=" + bonusSpinWin + "\n bonusGameMultiplayer=" + bonusGameMultiplayer + "\n unknown11=" + unknown11 + "\n bonusSpinWinTotal=" + bonusSpinWinTotal + "\n bonusGameReels=" + bonusGameReels + "\n winPerLine=" + winPerLine + "\n gambleHistory=" + gambleHistory + "\n u12=" + u12 + "\n u13=" + u13 + "\n u14=" + u14 + ")]";
	}
}