package caca {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;	

	import caca.Palavra;
	import caca.Util;
	import caca.eventos.EventoPalavras;

	/* 
	 * Classe que serve de conteiner para as palavras
	 */
	public class Palavras extends MovieClip {
		var quantidade:int;
		var palavras:Array;
		var foco:Palavra;
		
		public function Palavras() {
			quantidade = 0;
			palavras = new Array();
		}
		
		public function limpar() {
			quantidade = 0;
			foco = null;
			while(palavras.length > 0) {
				removeChild(palavras.pop());
			}
		}		

		public function incluirPalavra(palavra:String, chave:String):Palavra {
			var _palavra:Palavra = new Palavra(palavra, chave);
			
			_palavra._x_ = 40 + (width/4) * (quantidade++ % 4);
			_palavra._y_ = quantidade > 4? 70 : 30;
			_palavra.posicionar();
			_palavra.visible = false;
			
			//palavras[palavra] = _palavra;
			palavras.push(_palavra);
			addChild(_palavra);
			return _palavra;
		}
		
		
		/*
		*   mistura as posições das palavras no banco, para que não fique trivial acertar o provérbio pela posição da palavra
		*/
		public function misturarPosicoes():void {
			for ( var i=0; i<quantidade; i++ ) {
				trocarPosicoes(i, Util.randi(0, quantidade));
			};
		}		
		
		/*
		*	troca as posições das palavras dos índices dados
		*/
		function trocarPosicoes(indice1, indice2):void {
			var tempX:int;	var tempY:int;
			var aux;
			
			aux=palavras[indice1];
			palavras[indice1]=palavras[indice2];
			palavras[indice2]=aux;
			
			tempX = palavras[indice1]._x_; tempY = palavras[indice1]._y_;
			palavras[indice1]._x_ = palavras[indice2]._x_;
			palavras[indice1]._y_ = palavras[indice2]._y_;
			palavras[indice2]._x_ = tempX;
			palavras[indice2]._y_ = tempY;
			
			palavras[indice1].posicionar();
			palavras[indice2].posicionar();
		}
		
		
		/* 
		 * retorna o objeto Palavra a partir de sua chave. Tenta usar a chave invertida também
		*/
		public function obterPalavra(palavra:String):Palavra {
			for ( var i=0; i<palavras.length; i++ ) {
				if(palavras[i].getChave()==palavra)
					return(palavras[i]);
			};
			var reverso:String = Util.reverseString(palavra);
			for ( var j=0; j<palavras.length; j++ ) {
				if(palavras[j].getChave()==reverso)
					return(palavras[j]);
			};
			return null;
		}
		
		
		function _gerenciarTeclado(e:KeyboardEvent):void {
			var i:int;
			var indice:int;
			
			switch (e.keyCode) {
				case Keyboard.ENTER:
					var evt:EventoPalavras = new EventoPalavras(EventoPalavras.SELECAO_PALAVRA, {selecao: this.foco});
					dispatchEvent(evt);		
					foco.selecionar();
				break;
				case Keyboard.DOWN:
				case Keyboard.RIGHT:
					if(foco==null)
						foco = palavras[0];
					indice = palavras.indexOf(foco);
					for (i=0; i<palavras.length; i++) {
						if(palavras[++indice % palavras.length].visible == true) {
							focar(palavras[indice % palavras.length]);
							break;
						}
					};
				break;
				case Keyboard.UP:
				case Keyboard.LEFT:
					if(foco==null)
						foco = palavras[0];
					indice = palavras.indexOf(foco);
					for (i=0; i<palavras.length; i++) {
						if(indice==0) indice = palavras.length-1;
						if(palavras[--indice % palavras.length].visible == true) {
							focar(palavras[indice % palavras.length]);
							break;
						}
					};
				break;
			}
		}
		
		function contarVisiveis():int {
			var j:int = 0;
			for ( var i=0; i<palavras.length; i++ ) 
				if(palavras[i].visible)
					j++;
			return j;
		}
		
		public function temVisiveis():Boolean {
			return Boolean(contarVisiveis() > 0);
		}
		
		
		function focar(mc:Palavra):void {
			desfocar();
			mc.focar();
			foco = mc;
		}
		
		public function desfocar():void {
			if(foco != null)
				foco.desfocar();			
		}
		
	}
}