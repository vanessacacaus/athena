package {

	import flash.events.*;
	import flash.net.*;

	/**
	 * Classe ConjuntoQuestoes
	 *
	 * @author Bruno Milare
	 * @date 22/04/2009
	 */
	public class ConjuntoQuestoes {

		/**
		 * Variáveis mais abstratas
		 */
		private var q:Array = new Array();// questões
		private var diag:Array = new Array();
		private var pers:Array = new Array();
		private var rand:Randomizador = new Randomizador();// randomizador de perguntas e respostas
		private var p:Array = new Array();// ordem das perguntas
		private var r:Array = new Array();// ordem das respostas
		private var episodio:int;
		private var numDialogos:int;

		/**
		 * Variáveis de atribuição de dados
		 */
		private var tipo:String;
		private var dica = new Array();
		private var premios = new Array();
		private var valorPontos = new Array();
		private var historia = new Array();
		private var perguntas = new Array();
		private var respostas  = new Array();
		private var respCorreta  = new Array();
		private var respUsada  = new Array();
		private var comentarios  = new Array();
		private var dialogos = new Array();

		/**
		 * Construtor
		 *
		 * new ConjuntoQuestoes(tipo, episodio);
		 */
		public function ConjuntoQuestoes(... args) {

			tipo=args[0];
			episodio=args[1];

			this.numDialogos=0;

			if (tipo=='teste') {
				defineQuestoesTeste();
			} else {
				defineQuestoesVF();
			}
		}

		/**
		 * Retorna uma questão i
		 */
		public function getQuestao(i:int):Questao {
			return this.q[i];
		}

		/**
		 * Retorna o vetor de questoes
		 */
		public function getQuestoes() {
			return this.q;
		}

		/**
		 * Define as questoes caso o episodio tenha questoes teste
		 */
		private function defineQuestoesTeste() {

			var questoes:XML=BaseDados.retornaQuestoes(episodio);

			p=rand.randperg();

			for (var i=0; i<5; i++) {

				r=rand.randresp();

				historia[p[i]]=questoes.questao[i].textorelacionado.text();
				perguntas[p[i]]=questoes.questao[i].enunciado.text();

				respostas[p[i]] = new Array();
				dialogos[p[i]] = new Array();
				pers[p[i]] = new Array();
				respUsada[p[i]]=false;
				comentarios[p[i]] = new Array();
				dica[p[i]]=questoes.questao[i].dica.text();
				premios[p[i]]=questoes.questao[i].premio.text();
				valorPontos[p[i]]=questoes.questao[i].valorpontos.text();
				respCorreta[p[i]]=r[questoes.questao[i].respcorreta.text()];

				numDialogos=questoes.questao[i].dialogos.quantidade;

				for (var j=0; j<5; j++) {
					respostas[p[i]][r[j]]=questoes.questao[i].alternativas.alternativa[j].text();
					comentarios[p[i]][r[j]]=questoes.questao[i].feedbacks.feedback[j].text();
					
				}
				
				for (var k=0; k<numDialogos; k++) {
						dialogos[p[i]][k] = questoes.questao[i].dialogos.dialogo[k].text();
						pers[p[i]][k] = questoes.questao[i].dialogos.dialogo[k].@pers;
					}
					
				diag[p[i]]=new Dialogo(numDialogos,dialogos[p[i]], pers[p[i]], questoes.questao[i].dialogos.dialogo[0].@contra);
			}

			for (i=0; i < 5; i++) {
				q[i] = new Questao(tipo, perguntas[i], historia[i],respostas[i], dica[i], valorPontos[i], comentarios[i], respCorreta[i], diag[i], premios[i]);
			}
		}

		/**
		 * Define as questoes caso o episodio tenha questoes VF
		 */
		private function defineQuestoesVF() {

			var questoes:XML=BaseDados.retornaQuestoes(episodio);

			p=rand.randperg();

			for (var i=0; i<5; i++) {
				historia[p[i]]=questoes.questao[i].textorelacionado.text();
				perguntas[p[i]]=questoes.questao[i].enunciado.text();

				respUsada[p[i]]=false;
				valorPontos[p[i]]=questoes.questao[i].valorpontos.text();

				respostas[p[i]] = new Array();
				dica[p[i]] = new Array();
				respCorreta[p[i]] = new Array();

				for (var j=0; j<5; j++) {
					dica[p[i]][j]=questoes.questao[i].dicas.dica[j].text();
					respCorreta[p[i]][j]=questoes.questao[i].alternativas.alternativa[j].resposta.text();
					respostas[p[i]][j]=questoes.questao[i].alternativas.alternativa[j].texto.text();
				}
			}

			for (i=0; i<4; i++) {
				comentarios[i]=questoes.feedbacks.feedback[i].text();
			}

			numDialogos=questoes.questao[i].dialogos.quantidade;

			trace(numDialogos);
			for (j=0; j<numDialogos; j++) {
				dialogos[j]=questoes.questao[i].dialogos.dialogo[j].text();
				trace(dialogos[j]);
			}

			diag[i]=new Dialogo(numDialogos,dialogos,["1","2"],"Vazio");

			for (i=0; i < 5; i++) {
				q[i] = new Questao(tipo, perguntas[i], historia[i], respostas[i], dica[i], valorPontos[i], comentarios,respCorreta[i],diag[i],"nulo");
			}
		}

	}
}