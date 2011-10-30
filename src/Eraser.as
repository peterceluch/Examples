package  {
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class Eraser extends Sprite {
		
		private var bitmap:Bitmap;
		
		public function Eraser() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			var background:Bitmap = createBackground();
			addChild(background);
			
			bitmap = createBitmap();
			addChild(bitmap);
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
		}
		
		protected function mouseMoveHandler(event:MouseEvent):void {
			var bd:BitmapData = bitmap.bitmapData;
			var x:Number = bitmap.mouseX;
			var y:Number = bitmap.mouseY;
			
			var brushSize:Number = 20;
			
			bd.fillRect(new Rectangle(x - brushSize / 2, y - brushSize / 2, brushSize, brushSize), 0x00000000);
		}
		
		public function createBackground():Bitmap {
			var bd:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight);
			bd.perlinNoise(5, 5, 5, 5, true, true);
			return new Bitmap(bd);
		}
		
		public function createBitmap():Bitmap {
			var bd:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0xeeFF0000);
			return new Bitmap(bd);
		}
		
	}
	
}
