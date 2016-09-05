package slot.net.data.packetModels;


class HotStarsSpin extends BaseSpinHotStars
{	
	public var reelsData:ArrayData1 = new ArrayData1();
	
	public function new(reelsCount:Int = 5) 
	{
		super();
		
		reelsData.size = reelsCount;
	}
}