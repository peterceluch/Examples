package {
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import flashx.textLayout.container.ContainerController;
	import flashx.textLayout.elements.InlineGraphicElement;
	import flashx.textLayout.elements.ParagraphElement;
	import flashx.textLayout.elements.SpanElement;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.formats.Float;
	
	
	public class Floating extends Sprite {
		
		public function Floating(){
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var container:Sprite = new Sprite();
			this.stage.addChild(container);
			
			var inlineGraphicElement:InlineGraphicElement = new InlineGraphicElement();
			inlineGraphicElement.float = Float.LEFT;
			inlineGraphicElement.source = drawRect();
			inlineGraphicElement.paddingRight = 10;
			inlineGraphicElement.paddingBottom = 5;
			
			var span:SpanElement = new SpanElement();
			span.text = "Turkey boudin kielbasa pastrami. Tenderloin spare ribs tongue brisket leberkäse. Strip steak turkey shank, beef ribs flank capicola pastrami ham jerky hamburger ribeye. Chicken brisket spare ribs, ground round biltong chuck sirloin jerky bresaola sausage fatback turkey meatloaf drumstick turducken. Short loin pork chop ball tip, capicola tongue jowl pancetta biltong tenderloin turkey. Jowl tail ground round, beef ribs short ribs pork swine meatloaf jerky shank bresaola sirloin bacon. Turkey short ribs tongue ham swine, pancetta t-bone chuck sausage.";
			span.fontSize = 12;
			
			var p:ParagraphElement = new ParagraphElement();
			p.addChild(inlineGraphicElement);
			p.addChild(span);
			
			var textFlow:TextFlow = new TextFlow();
			textFlow.addChild(p);
			
			var controller:ContainerController = new ContainerController(container, 400, 300 );
			
			textFlow.flowComposer.addController(controller);
			textFlow.flowComposer.updateAllControllers(); 
		}
		
		private function drawRect():Bitmap {
			var bd:BitmapData = new BitmapData(100, 100);
			bd.perlinNoise(5, 5, 5, 5, true, true);
			return new Bitmap(bd);
		}
		
	}
	
}
