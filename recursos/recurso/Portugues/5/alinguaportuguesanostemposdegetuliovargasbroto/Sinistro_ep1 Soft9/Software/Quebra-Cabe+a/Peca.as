package {
	
	import flash.display.*
	/**
	 * Classe Personagem
	 *
	 * @author Bruno Milare
	 * @date 27/03/2010
	 */
	public class Peca {

		private var valor:String;
		private var mc:MovieClip;
		private var questao:Questao;
		private var respondeu:Boolean;
		private var respondeuCorretamente:Boolean;

		public function Peca(v:String, mc:MovieClip, q:Questao) {

				this.valor = v;
				this.mc = mc;
				this.questao = q;
				this.respondeu = false;
				this.respondeuCorretamente = false;
		}

		public function setResposta(resp:Boolean):void { this.respondeuCorretamente = resp; }
		
		public function getResposta():Boolean { return this.respondeuCorretamente; }
	
		public function getValor():String { return this.valor; }
		
		public function getMC():MovieClip { return this.mc; }
		
		public function getQuestao():Questao { return this.questao; }
		
		public function setRespondeu():void { this.respondeu = true; }
		
		public function getRespondeu():Boolean { return this.respondeu; }
	
	}
}