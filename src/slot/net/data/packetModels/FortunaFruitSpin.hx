package slot.net.data.packetModels;


class FortunaFruitSpin extends BaseSpinFortunafruits
{	
	public var reelsData:ArrayData1 = new ArrayData1();
	
	public function new(reelsCount:Int = 5) 
	{
		super();
		
		reelsData.size = reelsCount;
	}
}