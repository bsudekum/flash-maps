package com.modestmaps.mapproviders.microsoft
{
	import com.modestmaps.core.Coordinate;
	import com.modestmaps.mapproviders.IMapProvider;
	import com.modestmaps.mapproviders.microsoft.AbstractMicrosoftMapProvider;
	
	/**
	 * @author darren
	 * $Id: MicrosoftHybridMapProvider.as 352 2007-10-22 23:59:12Z tom $
	 */
	
	public class MicrosoftHybridMapProvider 
		extends AbstractMicrosoftMapProvider
		implements IMapProvider
	{
		override public function toString():String
		{
			return "MICROSOFT_HYBRID";
		}
		
		override public function getTileUrl(coord:Coordinate):String
		{		
	        return "http://h" + Math.floor(Math.random() * 4) + ".ortho.tiles.virtualearth.net/tiles/h" + getZoomString( coord ) + ".jpeg?g=90";
		}
	}
}