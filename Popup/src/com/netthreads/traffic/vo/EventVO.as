/**
 * -----------------------------------------------------------------------
 * Traffic Event Value Object.
 * 
 * -----------------------------------------------------------------------
 * Alistair Rutherford, www.netthreads.co.uk, Nov 2007.
 * -----------------------------------------------------------------------
 */
package com.netthreads.traffic.vo
{

	public class EventVO extends Located
	{
	    private static var TEXT_EVENT_TYPE:String = "event";
	    
		/**
         * Handy for trace statements.
		 * 
		 */
		public function toString() : String
		{
		    var s : String = "EventVO[id=";
		    s += "category=";
		    s += category;
		    s += "road=";
		    s += road;
		    s += ", summary=";
		    s += summary;
		    s += ", severity=";
		    s += severity;
		    s += ", start=";
		    s += start;
		    s += ", end=";
		    s += end;
		    s += ", centreLatitude=";
		    s += centreLatitude;
		    s += ", centreLongitude=";
		    s += centreLongitude;
		    s += " ]";
		    return s;
		}
	
		[Bindable]
		public var type : String = TEXT_EVENT_TYPE;
		
		[Bindable]
		public var category : String;
		
		[Bindable]
		public var summary : String;

		[Bindable]
		public var road : String;

		[Bindable]
		public var severity : String;
        
		[Bindable]
		public var start:Number;		// Milliseconds	
		
		[Bindable]
		public var end:Number;			// Milliseconds	

		[Bindable]
		public var startTime:String;	// Text
		
		[Bindable]
		public var endTime:String;		// Text
		
		[Bindable]
		public var id:String;			// Milliseconds	
	}

}