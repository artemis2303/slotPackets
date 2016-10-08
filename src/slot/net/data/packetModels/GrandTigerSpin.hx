package slot.net.data.packetModels;

class GrandTigerSpin extends BaseSpinGrandTiger
{	
	public var reelsData:ArrayData1 = new ArrayData1();
	
	public function new(reelsCount:Int = 5) 
	{
		super();
		
		reelsData.size = reelsCount;
	}
}