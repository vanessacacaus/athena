package {
	import flash.display.*;
	import flash.utils.*;
	import flash.text.*;


	/**
	 * Classe Utils
	 *
	 * @author Bruno Milare
	 * @date 29/03/2010
	 */
	public class Utils {

		public static var beginTags:Array=new Array(50);
		public static var endTags:Array=new Array(50);
		public static var typeTags:Array=new Array(50);
		public static var nTags=0;
		public static var charsWasted=0;


		public static function textoTirandoTags(texto:String):String {
			var begin=0;

			while ((texto.indexOf("[b]")!=-1) || (texto.indexOf("[i]")!=-1)) {
				if (texto.indexOf("[b]")!=-1) {
					texto=texto.replace("[b]","");
					texto=texto.replace("[/b]","");
				}

				if (texto.indexOf("[i]",begin)!=-1) {
					texto=texto.replace("[i]","");
					texto=texto.replace("[/i]","");
				}
			}

			return texto;
		}

		public static function dumpTags() {

			for (var i=0; i< Utils.nTags; i++) {
				trace(i + ".Tipo: " + Utils.typeTags[i]+ " Comeca em: " +Utils.beginTags[i] + " e termina em: " + Utils.endTags[i] );
			}

		}

		public static function searchTags(texto):void {

			Utils.nTags=0;
			Utils.charsWasted=0;

			var begin=0;
			var openTagSize=3;
			var closeTagSize=4;


			while ((texto.indexOf("[b]",begin)!=-1) || (texto.indexOf("[i]",begin)!=-1)) {
				if (texto.indexOf("[b]",begin)!=-1) {
					Utils.beginTags[Utils.nTags]=texto.indexOf("[b]",begin)-Utils.charsWasted;
					Utils.charsWasted+=openTagSize;
					Utils.endTags[Utils.nTags]=texto.indexOf("[/b]",Utils.beginTags[Utils.nTags])-Utils.charsWasted;
					Utils.charsWasted+=closeTagSize;
					Utils.typeTags[Utils.nTags]="bold";
					//trace("Achou " + (Utils.nTags + 1) +" tags" );

					begin=texto.indexOf("[b]",begin)+3;
					Utils.nTags++;
				}

				if (texto.indexOf("[i]",begin)!=-1) {
					Utils.beginTags[Utils.nTags]=texto.indexOf("[i]",begin)-Utils.charsWasted;
					Utils.charsWasted+=openTagSize;
					Utils.endTags[Utils.nTags]=texto.indexOf("[/i]",Utils.beginTags[Utils.nTags])-Utils.charsWasted;
					Utils.charsWasted+=closeTagSize;
					Utils.typeTags[Utils.nTags]="italic";
					trace("Achou " + (Utils.nTags + 1) +" tags" );

					begin=texto.indexOf("[i]",begin)+3;
					Utils.nTags++;
				}
			}
			//Utils.dumpTags();
		}

		public static function setTextFormat( campo:* ) {

			var txtFormatBold:TextFormat = new TextFormat();
			var txtFormatItalic:TextFormat = new TextFormat();

			txtFormatBold.bold=true;
			txtFormatItalic.italic=true;

			for (var i=0; i<Utils.nTags; i++) {
				if (Utils.typeTags[i]=="bold") {
					campo.setTextFormat(txtFormatBold, Utils.beginTags[i], Utils.endTags[i]);
				} else if (Utils.typeTags[i] == "italic") {
					campo.setTextFormat(txtFormatItalic, Utils.beginTags[i], Utils.endTags[i]);
				}
			}
		}
	}
}