package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;	
	import flash.display.StageScaleMode;
	
	public class TimelineControl extends MovieClip {
		
		private static const BOUNCE_LABEL:String			= "bounce";
		
		private var bounceBtn:SimpleButton;
		
		public function TimelineControl() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			bounceBtn = getChildByName("btn_bounce") as SimpleButton;
			bounceBtn.addEventListener(MouseEvent.CLICK, button_clickHandler);
		}
		
		private function button_clickHandler(event:MouseEvent):void {
			gotoAndPlay(BOUNCE_LABEL);
		}
		
		private function bounceFinished():void {
			// you can call functions from timeline
			trace("BOUNCE FINISHED");
		}
		
	}
	
}
