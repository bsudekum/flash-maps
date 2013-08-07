/**
 * -----------------------------------------------------------------------
 * Date formatting helper functions.
 * 
 * -----------------------------------------------------------------------
 * Alistair Rutherford, www.netthreads.co.uk, Nov 2007.
 * -----------------------------------------------------------------------
 */
package com.netthreads.traffic.util
{
    import mx.formatters.DateFormatter;
    
    public class DateHelper
    {
        public static var DATE_FORMAT:String = "MMM DD, YYYY JJ:NN";

        private static var formatter:DateFormatter = new DateFormatter();
        
		/**
         * Formats passed Date object into string with format of our choice
		 * 
		 * @param String format.
		 * @param Date date object.
		 * 
		 */
        public static function formatDateTime(formatString:String, dateTime:Date):String
        {
            formatter.formatString = formatString;
            return formatter.format(dateTime);
        }
    }
}