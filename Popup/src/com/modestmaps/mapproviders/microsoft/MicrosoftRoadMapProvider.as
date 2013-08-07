package com.modestmaps.mapproviders.microsoft
{
	import com.modestmaps.core.Coordinate;
	import com.modestmaps.mapproviders.IMapProvider;
	import com.modestmaps.mapproviders.microsoft.AbstractMicrosoftMapProvider;
	
	/**
	 * @author darren
	 * $Id: MicrosoftRoadMapProvider.as 353 2007-10-23 00:11:11Z migurski $
	 */
	
	public class MicrosoftRoadMapProvider 
		extends AbstractMicrosoftMapProvider
		implements IMapProvider
	{
	    public var hillShading:Boolean;
	    
	    public function MicrosoftRoadMapProvider(hillShading:Boolean=true)
	    {
	        this.hillShading = hillShading;
	    }
	    
		override public function toString():String
		{
			return "MICROSOFT_ROAD";
		}
		
		override public function getTileUrl(coord:Coordinate):String
		{		
	        return "http://r" + Math.floor(Math.random() * 4) + ".ortho.tiles.virtualearth.net/tiles/r" + getZoomString( coord ) + ".png?g=90" + (hillShading ? "&shading=hill" : "");
		}
	}
}
