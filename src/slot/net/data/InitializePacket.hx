package slot.net.data;

class InitializePacket
{
	public var type:Int;
	public var reelsData:ArrayData1;
	
	public var reelsData2:ArrayData1;
	
	public var unknown0:Int;
	public var unknown1:Int;
	public var unknown2:ArrayData2;
	
	public var unknown3:Int; //int
	
	public var balance:Int; //int
	
	public var unknown4:Int; //int
	public var unknown5:Int; //double
	
	public var minBet:Int; //int
	public var maxBet:Int; //int
	public var minBetMayBe:Int; //int
	
	public var unknown6:Int; //int
	public var unknown7:Int; //int
	public var unknown8:Int; //int
	public var unknown9:Int; //int
	public var unknown10:Int; //int
	public var unknown11:Int; //int
	public var unknown12:Int; //int
	public var unknown13:Int; //double
	public var unknown14:Int; //double
	public var unknown15:Int; //double
	public var unknown16:Int; //int
	public var unknown17:Int; //double
	
	public var unknown18:ArrayData2; //reelData3
	public var unknown19:Array<Int> = new Array<Int>(); //array8Double
	public var betPerLine:Array<Int>; //arrayDoubleInt
	public var unknown21:Array<Int>; //arrayDoubleInt
	
	//Дальше похоже может быть какая то хрень с валютой
	
	public function new() 
	{
		
	}
	
	public function fieldToString(field:String):String
	{
		return field + "=" + Reflect.getProperty(this, field);
	}
	
	public function toString():String 
	{
		return "[InitializePacket type=" + type + " reelsData=" + reelsData + " reelsData2=" + reelsData2 + " unknown0=" + unknown0 + 
					" unknown1=" + unknown1 + " unknown2=" + unknown2 + " unknown3=" + unknown3 + " balance=" + balance + 
					" unknown4=" + unknown4 + " unknown5=" + unknown5 + " minBet=" + minBet + " maxBet=" + maxBet + 
					" minBetMayBe=" + minBetMayBe + " unknown6=" + unknown6 + " unknown7=" + unknown7 + 
					" unknown8=" + unknown8 + " unknown9=" + unknown9 + " unknown10=" + unknown10 + " unknown11=" + unknown11 + 
					" unknown12=" + unknown12 + " unknown13=" + unknown13 + " unknown14=" + unknown14 + 
					" unknown15=" + unknown15 + " unknown16=" + unknown16 + " unknown17=" + unknown17 + 
					" unknown18=" + unknown18 + " unknown19=" + unknown19 + " unknown20=" + betPerLine + 
					" unknown21=" + unknown21 + "]";
	}
}