package slot.net.data.packetModels;

class WildStarsSpin extends BaseSpinWildStars
{	
	public var reelsData:ArrayData1 = new ArrayData1();
	
	public function new(reelsCount:Int = 5) 
	{
		super();
		
		reelsData.size = reelsCount;
	}
}