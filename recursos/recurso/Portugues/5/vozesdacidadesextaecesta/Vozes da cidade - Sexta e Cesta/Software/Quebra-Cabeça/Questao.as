package {
	/**
	 * Classe Questao
	 *
	 * @author Bruno Milare
	 * @date 23/03/2010
	 */
	public class Questao {

		private var enunciado:String;
		private var dica:String;
		private var feedbackCorreta:String;
		private var feedbackIncorreta:String;
		private var respostaCorreta:String;
		private var respostaDada:String;
		private var respondeuCorretamente:Boolean;


		public function Questao(e:String, d:String, fbC:String, fbE:String, rc:String) {

				this.enunciado = e;
				this.dica = d;
				this.feedbackCorreta = fbC;
				this.feedbackIncorreta = fbE;
				this.respostaCorreta = rc;
		}

		public function verificaResposta():void {
			this.respondeuCorretamente = this.respostaDada == this.respostaCorreta? true: false;
		}

		public function estaCorreta():Boolean {	return this.respondeuCorretamente;	}

		public function getRespostaCorreta():String { return this.respostaCorreta; }
		
		public function setRespostaCorreta(s:String):void { this.respostaCorreta = s; }

		public function getFeedbackCorreta():String { return this.feedbackCorreta; }
		
		public function getFeedbackIncorreta():String { return this.feedbackIncorreta; }

		public function setFeedbackCorreta(fb:String):void { this.feedbackCorreta= fb; }
		
		public function setFeedbackIncorreta(fb:String):void { this.feedbackIncorreta= fb; }
		
		public function getRespostaDada():String { return this.respostaDada;	}

		public function setResposta(s:String):void { this.respostaDada = s; }

		public function getDica():String {	return this.dica; }

		public function setDica(dica:String):void { this.dica = dica;	}
		
		public function getEnunciado():String {	return this.enunciado; }

		public function setEnunciado(e:String):void { this.enunciado = e; }

		public function getStringRelatorio():String {
			var ret:String;
			ret = Utils.textoTirandoTags(this.enunciado) +"\n";
			ret += this.respondeuCorretamente?"CORRETA - ":"ERRADA - ";
			ret += Utils.textoTirandoTags(this.respostaDada)+"\n";
			return ret+"\n";
		}

	}
}