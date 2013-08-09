/**
 * MapProvider for Open Street Map data.
 * 
 * @author migurski
 * $Id$
 */
package com.modestmaps.mapproviders
{ 
	import com.modestmaps.core.Coordinate;
	
	public class MapBox
		extends AbstractMapProvider
		implements IMapProvider
	{
	    public function MapBox(minZoom:int=MIN_ZOOM, maxZoom:int=MAX_ZOOM)
        {
            super(minZoom, maxZoom);
        }

	    public function toString() : String
	    {
	        return "MapBox";
	    }
	
	    public function getTileUrls(coord:Coordinate):Array
	    {
	        var sourceCoord:Coordinate = sourceCoordinate(coord);
	        if (sourceCoord.row < 0 || sourceCoord.row >= Math.pow(2, coord.zoom)) {
	        	return [];
	        }
			var text = "";
			var possible = "ABCD";
			
			for( var i=0; i < 1; i++ )
				text += possible.charAt(Math.floor(Math.random() * possible.length));
			var sourceCoord:Coordinate = sourceCoordinate(coord);
	        return [ 'http://' + text + '.tiles.mapbox.com/v3/bobbysud.map-rm7pg202/'+(sourceCoord.zoom)+'/'+(sourceCoord.column)+'/'+(sourceCoord.row)+'.png' ];
	    }
	    
	}
}

