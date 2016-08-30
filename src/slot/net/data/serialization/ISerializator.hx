package slot.net.data.serialization;
import slot.net.data.packetModels.BasePacketData;

interface ISerializator 
{
	function serialize(output:BasePacketData):Dynamic;
}