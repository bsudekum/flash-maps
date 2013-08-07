/**
 * -----------------------------------------------------------------------
 * Traffic Event marker. 
 * 
 * This embeds an icon image into a flash Sprite object. Note the adjustment 
 * of the bitmap to place it on the appropriate point for the map lat/lng.
 * 
 * TODO: Popups
 * TODO: Make this more generalised.
 * 
 * -----------------------------------------------------------------------
 * Alistair Rutherford, www.netthreads.co.uk, Nov 2007.
 * -----------------------------------------------------------------------
 */
package com.netthreads.traffic.controller
{
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.filters.DropShadowFilter
    import flash.geom.Point;
    import flash.events.MouseEvent;
    import flash.events.Event;
    
    import mx.controls.Text;
    import mx.containers.TitleWindow;
    import mx.controls.ToolTip;
    import mx.managers.ToolTipManager;
    import mx.states.AddChild;
    import mx.managers.PopUpManager;

    import com.netthreads.traffic.vo.EventVO;
    import mx.core.IFlexDisplayObject;
    import mx.controls.Image;
    import flash.display.BitmapData;

    public class EventMarker extends Sprite
    {
		[Embed(source="../../../../assets/image/marker.png")]
		private var MarkerImage: Class;
		
    	public var markerData:EventVO = null;

		private var infoToolTip:ToolTip = null;
    	
    	/**
    	 * EventMarker constructor.
    	 * 
    	 * @param EventVO Traffic Event data object.
    	 * 
    	 */
        public function EventMarker(trafficEvent:EventVO, icon:Class=null):void
        {
        	this.markerData = trafficEvent;

			var bMap:Bitmap = null;
			
			if (icon!=null)
			{        
				var image:Class = Class(icon);
				bMap = new image();
				this.addChild(bMap);
			}
			else
			{
	        	// Add image
				bMap = new MarkerImage();
				this.addChild(bMap);
			}

			// Adjust bitmap position to pin foot of image onto lat/lng.
			// You will never know the hassle I went through to figure this out.
			bMap.y = this.y-bMap.height;
			bMap.x = this.y-bMap.width/2;
			
			// Add a nice shadow effect
			var shadow:DropShadowFilter = new DropShadowFilter();
			this.filters = [shadow];
			
			// Switch on ButtnMode to get hand cursor
			buttonMode = true;

			// add event listener for click
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
        }


    	/**
    	 * Marker on mouse over handler.
    	 * 
    	 * @param Event event object.
    	 * 
    	 */
		private function onMouseOver(ev:Event):void
		{
			if (!infoToolTip)
			{
				infoToolTip = new ToolTip();
				infoToolTip.text = markerData.summary;
				PopUpManager.addPopUp(infoToolTip, this, false);
			}

		    // Get the location of the target in global coordinates.
		    var p : Point = new Point(0, 0);
		    p = this.localToGlobal(p);
		
		    // Set the position of the popup to these coordinates.
			infoToolTip.x = p.x;
			infoToolTip.y = p.y;			
			infoToolTip.visible = true;
		}	

    	/**
    	 * Marker on mouse out handler.
    	 * 
    	 * @param Event event object.
    	 * 
    	 */
		private function onMouseOut(ev:Event):void
		{
			if (infoToolTip)
			{
				infoToolTip.visible = false;
			}
			
			trace(ev);
		}	
		
    }
}