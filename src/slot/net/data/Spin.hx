package slot.net.data;
import openfl.Vector;

class Spin
{
	public var type:Int;
	
	public var unknown0:Int; //double
	public var unknown1:Int; //single - код ошибки //код ошиюки 1 - not enought credit; 2 - minimum bet is; >= 3 какая то хуерга если 6 или 5 то стоп будет вызван. Так же блочит все кнопки
	
	public var unknown2:Int; //int непонятный цвет
	public var balance:Int; //int
	public var unknown4:Int; //int выигрыш
	
	public var reels:ArrayData2; //
	
	public var indexOfBetPerLine:Int; //double
	public var numLines:Int; //double
	
	public var unknown7:Int; //int
	public var unknown8:Int; //int
	public var unknown9:Int; //int
	public var unknown10:Int; //int
	public var unknown11:Int; //int
	public var unknown12:Int; //int
	
	public var unknown13:ArrayData2; //arrayData2
	public var unknown14:Array<Int>; //arrayDoubleInt выигрышные линии и сколько выиграно, скаттеры последняя линия
	public var unknown15:Array<Int> = new Array<Int>(); //array8Double история гембла можно слать в виде 0-3 буби, черви, крести, пики
	
	
	
	
	public var reelsData:ArrayData1 = new ArrayData1();
	
	public function new(reelsCount:Int = 5) 
	{
		reelsData.size = reelsCount;
	}
	
	
	public function toString():String 
	{
		return "[LastState type=" + type + " unknown0=" + unknown0 + " unknown1=" + unknown1 + " unknown2=" + unknown2 + 
					" balance=" + balance + " unknown4=" + unknown4 + " reels=" + reels + " indexOfBetPerLine=" + indexOfBetPerLine + 
					" unknown6=" + numLines + " unknown7=" + unknown7 + " unknown8=" + unknown8 + " unknown9=" + unknown9 + 
					" unknown10=" + unknown10 + " unknown11=" + unknown11 + " unknown12=" + unknown12 + 
					" unknown13=" + unknown13 + " unknown14=" + unknown14 + " unknown15=" + unknown15 + 
					" reelsData=" + reelsData + "]";
	}
}