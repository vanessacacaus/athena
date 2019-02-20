package {
	/**
	 * Classe Questao
	 *
	 * @author Victor Muniz Cezar
	 * @date 25/05/2009
	 */
	public class Questao {
		

		private var parte:Array = new Array(2);
		private var indice1:int;
		private var indice2:int;
		private var respostaCerta:String;
		private var respostaDada:String;
		private var dica:String;
		private var imagem:int;
		

		public function Questao(p1:String, p2:String, resp:String, img:int, d:String){
			this.parte[0] = p1;
			this.parte[1] = p2;
			this.respostaCerta = resp;
			this.respostaDada = null;
			this.imagem = img;
			this.dica = d;
			
		}
		
		
		public function setRespostaDada(s:String){
			this.respostaDada = s;
		}
		
		
		public function getRespostaDada():String{
			return this.respostaDada;
		}
		
		public function setDica(d:String){
			this.dica = d;
		}
		
		public function getDica():String{
			return this.dica;
		}
		
		public function getRespostaCerta():String{
			return this.respostaCerta;
		}
		
		public function getImagem():int{
			return (this.imagem);
		}
		
		
		
		public function getParte(i:int){
			return this.parte[i];
		}
		
		public function estaCorreta():Boolean{
			return this.respostaCerta.toUpperCase() == this.respostaDada.toUpperCase();
		}
		
		
		public function getStringRelatorio():String{
			return this.parte[0] + this.parte[1] + "\nResp: " + this.respostaDada + "\n";

		}
		
		
		
		
		
		
		
		
	}
}