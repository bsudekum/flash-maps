/**
 * -----------------------------------------------------------------------
 * Parser Helper functions.
 * 
 * -----------------------------------------------------------------------
 * Alistair Rutherford, www.netthreads.co.uk, Nov 2007.
 * -----------------------------------------------------------------------
 */
package com.netthreads.traffic.model
{
	
	public class ParserHelper
	{
		/**
         * Create date from supplied string.
         * 
         * Implements a quick and dirty parser for WTC date format. For a more
         * robust version use the one from Flex corelib.swc. I have removed the corelib
         * version from this class because it doesn't get bundled with the source published
         * from the deployed application. 
		 * 
		 * @param String date string.
		 * 
		 */
        public static function createDate(s:String):Date
        {
            var newDate:Date = null;
            
            try
            {
            	// 2007-08-19T12:02:32+0
            	s = s.replace("-", "/");
            	s = s.replace("-", "/");
            	s = s.replace("T", " ");
            	s = s.replace("+0", " GMT+0 ");
            	
	            newDate = new Date(s);
            }
            catch (err:Error)
            {
               // Parse error.
               throw new Error("Couldn't parse date, "+s);
            }
            
            return newDate;
        }		

	}
}