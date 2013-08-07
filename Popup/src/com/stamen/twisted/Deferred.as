/**
 * Inspired by:
 *  http://twistedmatrix.com/projects/core/documentation/howto/defer.html
 *  http://twistedmatrix.com/documents/current/api/twisted.internet.defer.Deferred.html
 *
 * Adapted from:
 *  http://svn.red-bean.com/bob/as2/org/undefined/trunk/Deferred.as
 */
package com.stamen.twisted
{
	public class Deferred
	{
	    public var chain:/*Array*/Array;
	    public var results:Array;
	    public var fired:Number;
	
	    public function Deferred()
	    {
	        chain = [];
	        fired = -1;
	        results = [null, null];
	    }
	
	    private function _continue(result:Object):void
	    {
	        resback(result);
	    }
	
	    private function resback(result:Object):void
	    {
	        fired = ((result is Error) ? 1 : 0);
	        results[fired] = result;
	        fire();
	    }
	
	   /**
	    * Run all success callbacks that have been added to this Deferred.
	    */
	    public function callback(result:Object):void
	    {
	        resback(result);
	    }
	
	   /**
	    * Run all error callbacks that have been added to this Deferred.
	    */
	    public function errback(result:Object):void
	    {
	        resback(result);
	    }
	    
	   /**
	    * Convenience method for adding a single callable as both a callback.
	    */
	    public function addBoth(func:Function):Deferred
	    {
	        return addCallbacks(func, func);
	    }
	
	   /**
	    * Convenience method for adding just a callback.
	    */
	    public function addCallback(func:Function):Deferred
	    {
	        return addCallbacks(func, null);
	    }
	
	   /**
	    * Convenience method for adding just an errback.
	    */
	    public function addErrback(func:Function):Deferred
	    {
	        return addCallbacks(null, func);
	    }
	
	   /**
	    * Add a pair of callbacks (success and error) to this Deferred.
	    */
	    public function addCallbacks(callback:Function, errback:Function):Deferred
	    {
	        chain.push([callback, errback]);
	
	        if(fired >= 0)
	            fire();
	
	        return this;
	    }
	
	    private function fire():void
	    {
	        var result:Object = results[fired];
	
	        while(chain.length) {
	            var pair:Array = chain[0];
	            chain.shift();
	
	            try {
	                result = pair[fired](result);
	            } 
	            catch(error:Error)
	            {
	                result = error;
	            }
	
	            fired = ((result is Error) ? 1 : 0);
	        }
	
	        results[fired] = result;
	    }
	}
}