package {

	import flash.events.*;
	import flash.net.*;

	/**
	 * Classe ConjuntoQuestoes
	 *
	 * @author Bruno Milare
	 * @date 25/03/2010
	 */
	public class Parseador {

		/**
		 * Define as questoes
		 */
		public static function defineQuestoes():Array {

			var questoesParseadas:Array=new Array();
			var jogo:XML=BaseDados.retornaXML();
			var enunciado;
			var dica;
			var correta;
			var feedbackCorreta;
			var feedbackIncorreta;

			for (var i=0; i<jogo.questoes.questao.length(); i++) {

				enunciado=jogo.questoes.questao[i].enunciado.text();
				dica=jogo.questoes.questao[i].dica.text();
				feedbackCorreta=jogo.questoes.questao[i].fbcorreta.text();
				feedbackIncorreta=jogo.questoes.questao[i].fbincorreta.text();
				correta=jogo.questoes.questao[i].resposta.text();

				questoesParseadas[i]=new Questao(enunciado,dica,feedbackCorreta,feedbackIncorreta,correta);
			}

			return questoesParseadas;
		}
		
		public static function defineJogo():Jogo {

			var intro:Array=new Array();
			var ajuda:String = "";
			var jogo:XML=BaseDados.retornaXML();
			
			if(jogo.ajuda != null){
				ajuda = jogo.ajuda.text();
			}else{
				ajuda = "";
			}
			
			if(jogo.intro != null){
				for(var i=0; i<jogo.intro.texto.length(); i++){
					intro[i] = jogo.intro.texto[i].text();				
				}
			}
			
			return new Jogo(ajuda, intro);
			
		}
	}
	
	
	

}