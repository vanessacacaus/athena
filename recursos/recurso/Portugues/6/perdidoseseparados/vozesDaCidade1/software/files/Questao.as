package {
	/**
	 * Classe Questao
	 *
	 * @author Victor Muniz Cezar
	 * @date 25/05/2009
	 */
	public class Questao {
		

		private var parte:Array = new Array(5);
		private var indice1:int;
		private var indice2:int;
		private var respostaCerta1:String;
		private var respostaCerta2:String;
		private var respostaDada1:String;
		private var respostaDada2:String;
		

		public function Questao(p1:String, p2:String, p3:String, p4:String, p5:String, 
								i1:int, i2:int){
			this.parte[0] = p1;
			this.parte[1] = p2;
			this.parte[2] = p3;
			this.parte[3] = p4;
			this.parte[4] = p5;
			this.indice1 = i1;
			this.indice2 = i2;
			this.respostaCerta1 = this.getParte(indice1);
			this.respostaCerta2 = this.getParte(indice2);
			this.respostaDada1 = null;
			this.respostaDada2 = null;
			
		}
		
		
		public function setRespostaDada(s1:String, s2:String){
			this.respostaDada1 = s1;
			this.respostaDada2 = s2;
		}
		
		
		public function getRespostaDada(i:int):String{
			return this["respostaDada"+i];
		}
		
		public function getRespostaCerta(i:int):String{
			return this["respostaCerta"+i];
		}
		
		public function getIndice(i:int):int{
			return this["indice"+i];
		}
		
		public function getParte(i:int){
			return this.parte[i];
		}
		
		public function estaCorreta():Boolean{
			if(this.respostaCerta1.toUpperCase() == "CÊ TENTA" && this.respostaDada1.toUpperCase() == "VOCÊ TENTA")
				return true;
			if(this.indice2 == this.indice1)
				return this.respostaCerta1.toUpperCase() == this.respostaDada1.toUpperCase();
			else
				return this.respostaCerta1.toUpperCase() == this.respostaDada1.toUpperCase() 
						&& this.respostaCerta2.toUpperCase() == this.respostaDada2.toUpperCase();
		}
		
		
		public function getStringRelatorio():String{
			return ((this.indice1 == 0)? "\nResposta dada: "+" \""+((this.respostaDada1.toUpperCase() == this.respostaCerta1.toUpperCase())? this.respostaDada1: "<u>"+this.respostaDada1+"</u>")+"\" ":  ((this.indice2 == 0)? "\nResposta dada: "+"\""+this.respostaDada2+"\"" : this.parte[0])) +
				((this.indice1 == 1)? "\nResposta dada: "+" \""+((this.respostaDada1.toUpperCase() == this.respostaCerta1.toUpperCase())? this.respostaDada1: "<u>"+this.respostaDada1+"</u>")+"\" ":  ((this.indice2 == 1)? "\nResposta dada: "+"\""+this.respostaDada2+"\"" : this.parte[1])) +
				((this.indice1 == 2)? "\nResposta dada: "+" \""+((this.respostaDada1.toUpperCase() == this.respostaCerta1.toUpperCase())? this.respostaDada1: "<u>"+this.respostaDada1+"</u>")+"\" ":  ((this.indice2 == 2)? "\nResposta dada: "+"\""+this.respostaDada2+"\"" : this.parte[2])) +
				((this.indice1 == 2)? "\nResposta dada: "+" \""+((this.respostaDada1.toUpperCase() == this.respostaCerta1.toUpperCase())? this.respostaDada1: "<u>"+this.respostaDada1+"</u>")+"\" ":  ((this.indice2 == 3)? "\nResposta dada: "+"\""+this.respostaDada2+"\"" : this.parte[3])) +
				((this.indice1 == 4)? "\nResposta dada: "+" \""+((this.respostaDada1.toUpperCase() == this.respostaCerta1.toUpperCase())? this.respostaDada1: "<u>"+this.respostaDada1+"</u>")+"\" ":  ((this.indice2 == 4)? "\nResposta dada: "+"\""+this.respostaDada2+"\"" : this.parte[4])) +
				"\n";

		}
		
		
		
		
		
		
		
		
	}
}