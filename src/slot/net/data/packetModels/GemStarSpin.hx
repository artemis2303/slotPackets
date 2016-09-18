package slot.net.data.packetModels;

class GemStarSpin extends BaseSpinGemStar
{	
	public var reelsData:ArrayData1 = new ArrayData1();
	
	public function new(reelsCount:Int = 5) 
	{
		super();
		
		reelsData.size = reelsCount;
	}
}