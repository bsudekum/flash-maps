/**
 * -----------------------------------------------------------------------
 * Traffic Event markers. 
 * 
 * This embeds an icon image into class which we can then add to a dictionary for
 * lookup.
 * 
 * -----------------------------------------------------------------------
 * Alistair Rutherford, www.netthreads.co.uk, Jan 2008.
 * -----------------------------------------------------------------------
 */
package com.netthreads.traffic.assets
{
	public class TrafficAssets
	{	
		[Embed(source="../../../../assets/image/marker.png")]
		public var marker:Class;
		
		[Embed(source="../../../../assets/image/markerSlight.png")]
		public var markerSlight:Class;
		
		[Embed(source="../../../../assets/image/markerMedium.png")]
		public var markerMedium:Class;
		
		[Embed(source="../../../../assets/image/markerSevere.png")]
		public var markerSevere:Class;
	}

}
