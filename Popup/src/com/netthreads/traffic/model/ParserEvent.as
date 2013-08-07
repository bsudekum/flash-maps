/**
 * -----------------------------------------------------------------------
 * Parser for XML Traffic Events.
 * 
 * Takes XML object and parses out traffic event nodes to create list of 
 * EventVO Value Objects).
 * 
 * The reason we hold date/times as both objects and string is to make our
 * life easier when creating popups with this detail. You don't want to be
 * formatting this stuff on the fly every time you create a popup. 
 * -----------------------------------------------------------------------
 * Alistair Rutherford, www.netthreads.co.uk, Nov 2007.
 * -----------------------------------------------------------------------
 */
package com.netthreads.traffic.model
{
    import com.netthreads.traffic.util.DateHelper;
    import com.netthreads.traffic.vo.EventVO;
    
    import mx.collections.ArrayCollection;
	
	/**
	 * Defines parser which can extract data from traffic event xml.
	 * 
	 */
	public class ParserEvent implements IParser
	{
		/**
		 * Parse supplied XML and extract fields for EventVO objects.
		 * 
		 * @param XML data
		 * 
		 */
		public function parse(data:XML):ArrayCollection
		{
            var locations:XMLList = data..location;
            
			var items:ArrayCollection = new ArrayCollection();
			
		    for each (var value:* in locations) // e4x
            {
                var item:EventVO = new EventVO();
                
                item.summary = value.summary.line;
                item.road = value.summary.title;
                item.category = value.@category;
                item.severity = value.@severity;
                item.centreLatitude = parseFloat(value.point.@lat);
                item.centreLongitude = parseFloat(value.point.@lng);
                item.id = value.@id;
                
                var startDate:Date = ParserHelper.createDate(value.@start);
                item.start = startDate.getTime();
                var endDate:Date = ParserHelper.createDate(value.@end);
                item.end = endDate.getTime();
                
                item.startTime = DateHelper.formatDateTime(DateHelper.DATE_FORMAT, startDate);
                item.endTime = DateHelper.formatDateTime(DateHelper.DATE_FORMAT, endDate);
                
                items.addItem(item);
            }

			return items;			
		}
	}
}