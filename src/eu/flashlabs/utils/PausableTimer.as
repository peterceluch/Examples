package eu.flashlabs.utils  {
	
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Peter Celuch aka flashlabs.eu
	 */
	
	public class PausableTimer extends Timer {
		
		//---------------------------------------------------------------------------
		//	CONSTANTS
		//---------------------------------------------------------------------------
		
		//---------------------------------------------------------------------------
		//	MEMBER VARIABLES
		//---------------------------------------------------------------------------
		
		private var startTime:Number;
		private var timeLeft:Number;
		
		//---------------------------------------------------------------------------
		//	CONSTRUCTOR
		//---------------------------------------------------------------------------
		
		public function PausableTimer(delay:Number, repeatCount:Number = 0) {
			timeLeft = delay;
			
			super(delay, repeatCount);
		}
		
		//---------------------------------------------------------------------------
		//	PUBLIC INTERFACE
		//---------------------------------------------------------------------------
		
		override public function start():void {
			startTime = getTimer();

			super.start();
		}
		
		public function pause():void {
			var timeElapsed:Number = getTimer() - startTime;
			timeLeft -= timeElapsed;
			
			stop();
		}
		
		public function resume():void {
			delay = timeLeft;
			start();
		}
		
		//---------------------------------------------------------------------------
		//	EVENT HANDLERS
		//---------------------------------------------------------------------------
		
		//---------------------------------------------------------------------------
		//	GETTERS & SETTERS
		//---------------------------------------------------------------------------
		
		//---------------------------------------------------------------------------
		//	UTILS
		//---------------------------------------------------------------------------
		
	}
	
}
