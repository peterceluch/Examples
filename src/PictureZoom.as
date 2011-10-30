package  {
	
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Peter Celuch aka flashlabs.eu
	 */
	
	public class PictureZoom extends Sprite {
		
		//---------------------------------------------------------------------------
		//	CONSTANTS
		//---------------------------------------------------------------------------
		
		private static const MIN_SCALE:Number				= 1;
		private static const MAX_SCALE:Number				= 2;
		private static const TRANSITION_DURATION:Number		= 500;
		
		//---------------------------------------------------------------------------
		//	MEMBER VARIABLES
		//---------------------------------------------------------------------------
		
		private var mc:MovieClip;
		private var mcPosition:Point;
		
		//---------------------------------------------------------------------------
		//	CONSTRUCTOR
		//---------------------------------------------------------------------------
		
		public function PictureZoom() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			mc = createMovieClip();
			mc.x = stage.stageWidth / 2;
			mc.y = stage.stageHeight / 2;
			addChild(mc);
			
			mcPosition = new Point(mc.x, mc.y);
			
			mc.addEventListener(MouseEvent.MOUSE_DOWN, mc_mouseDownHandler);
		}
		
		protected function mc_mouseDownHandler(event:MouseEvent):void {
			stage.addEventListener(MouseEvent.MOUSE_UP, stage_mouseUpHandler);
			
			var offsetX:Number = mouseX - mcPosition.x;
			var offsetY:Number = mouseY - mcPosition.y;
			
			var content:MovieClip = mc.getChildAt(0) as MovieClip;
			content.x -= offsetX / mc.scaleX;
			content.y -= offsetY / mc.scaleY;
			
			mc.x = mcPosition.x + offsetX;
			mc.y = mcPosition.y + offsetY;
			
			TweenLite.to(mc, TRANSITION_DURATION / 1000, { scaleX: MAX_SCALE, scaleY: MAX_SCALE });
		}		
		
		protected function stage_mouseUpHandler(event:MouseEvent):void {
			stage.removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUpHandler);
			
			TweenLite.to(mc, TRANSITION_DURATION / 1000, { scaleX: MIN_SCALE, scaleY: MIN_SCALE });
		}
		
		private function createMovieClip():MovieClip {
			var size:Number = 300;
			
			var content:MovieClip = new MovieClip();
			content.graphics.beginFill(0x990000, 1);
			content.graphics.drawRect(-size / 2, -size / 2, size, size);
			
			var mc:MovieClip = new MovieClip();
			mc.addChild(content);
			
			return mc;
		}
		
	}
	
}
