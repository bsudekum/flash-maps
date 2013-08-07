/**
 * -----------------------------------------------------------------------
 * Parser interface.
 * 
 * -----------------------------------------------------------------------
 * Alistair Rutherford, www.netthreads.co.uk, Nov 2007.
 * -----------------------------------------------------------------------
 */
package com.netthreads.traffic.model
{
	import mx.collections.ArrayCollection;
	
	public interface IParser
	{
    	/**
    	 * Parse supplied XML interface fn.
    	 * 
    	 * @param XML data
    	 * 
    	 */
		function parse(data:XML):ArrayCollection;
	}
}