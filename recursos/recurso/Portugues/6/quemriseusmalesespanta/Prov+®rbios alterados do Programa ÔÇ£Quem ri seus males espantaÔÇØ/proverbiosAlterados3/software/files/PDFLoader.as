package src{
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.*;
	import flash.html.HTMLLoader;
	import flash.html.HTMLPDFCapability;
	import flash.net.URLRequest;

	public class PDFLoader extends Sprite
	{
		private var appStage:Stage;
		private var pdfLoader:HTMLLoader;
		private var assetResolverURL:String = "book.pdf";
		
		public function PDFLoader()
		{
			appStage = stage;
			appStage.scaleMode = StageScaleMode.NO_SCALE;
			appStage.align = StageAlign.TOP_LEFT;
			
			if (HTMLLoader.pdfCapability == HTMLPDFCapability.STATUS_OK){
				pdfLoader = new HTMLLoader();
				pdfLoader.x = appStage.x;
				pdfLoader.y = appStage.y;
				pdfLoader.width = appStage.width;
				pdfLoader.height = appStage.height;
				pdfLoader.addEventListener( Event.COMPLETE, onPDFComplete );
				pdfLoader.addEventListener(ProgressEvent.PROGRESS, onPDFProgress, false, 0, true);
				pdfLoader.load( new URLRequest( assetResolverURL ) );
				addChild( pdfLoader );
			}
			
		}

		private function getFlashVars():Object
		{
		     return Object( LoaderInfo( this.loaderInfo ).parameters );
		}
		
		private function onPDFProgress( e:Event ):void
		{
			
		}
		
		private function onPDFComplete( e:Event ):void
		{
			trace("PDF Carregado");
			
		}

	}
}