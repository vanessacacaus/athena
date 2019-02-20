package caca {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;	
	
	import caca.Frase;
	import caca.Dica;
	import caca.eventos.EventoFrases;


	/* 
	 * Classe que serve de conteiner para as frases
	 */

	public class Frases extends MovieClip {
		var quantidade:int;
		var frases:Array;
		var foco:Frase;
		
		public function Frases() {
			quantidade = 0;
			frases = new Array();
		}
		
		public function limpar() {
			quantidade = 0;
			foco = null;
			while(frases.length > 0) {
				removeChild(frases.pop());
			}
		}
		
		public function incluirFrase(frase:String, dica:String, feedback:String):Frase {
			var _frase:Frase = new Frase(frase, dica, feedback);
			
			_frase.y = (_frase.height + 4) * quantidade++;
			_frase.x = 10;
			
			addChild(_frase);
			frases.push(_frase);
			return _frase;
		}		
		
		
		public function checarHit(obj:MovieClip) {
			var circulou:Boolean = false;
			for each(var frase in frases) { 
				if(obj.hitTestObject(frase) && !circulou) {
					frase.gotoAndStop("_circular");
					circulou = true;
				}
				else {
					frase.gotoAndStop("_up");
				}
			} 
		}
		
		
		function _gerenciarTeclado(e:KeyboardEvent):void {
			
			switch (e.keyCode) {
				case Keyboard.RIGHT:
				case Keyboard.LEFT:
					Dica.exibirFeedback(this.getFrase(frases.indexOf(foco)).getFeedback(), this.getFrase(frases.indexOf(foco)));
					break;
				case Keyboard.ENTER:
					var evt:EventoFrases = new EventoFrases(EventoFrases.SELECAO_FRASE, {selecao: this.foco});
					dispatchEvent(evt);
					break;
				case Keyboard.UP:
					if(foco==null || frases.indexOf(foco)==0) 
						focar(frases[frases.length-1]);
					else{
						focar(frases[frases.indexOf(foco)-1]);
						}
				break;
				case Keyboard.DOWN:
					if(foco==null) 
						focar(frases[0]);
					else {
						focar(frases[(frases.indexOf(foco)+1) % frases.length]);						
						}
				break;
			}
		}		
		
		public function getFrase(indice:int):Frase {
			return frases[indice];
		}
		
		function focar(mc:Frase):void {
			desfocar();
			mc.focar();
			foco = mc;
		}
		
		public function desfocar() {
			if(foco != null) {
				foco.desfocar();
				foco = null;
			}
		}
	}
}