package {

	import flash.printing.PrintJob;
	import flash.printing.PrintJobOrientation;
	import flash.text.*;
	import flash.display.*;

	/**
	 * Classe Relatorio
	 *
	 * @author Victor Cezar
	 * @date 22/04/2009 
	 */

	public class Relatorio {

		/*
		 * Variáveis Login
		 */

		//private var login:Login;

		/*
		 * Variáveis pertinentes a questões
		 */
		private var questoesRespondidas:Array = new Array();

		/**
		 * Construtor
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */
		public function Relatorio() {
			return;
		}
		/**
		 * Liga um login ao Relatorio Final
		 *
		 * @param {Login} l - Objeto de login criado no inicio do jogo
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */
		//public function setLogin(l:Login) {
			//this.login=l;
		//}
		/**
		 * Guarda questão para ser colocada no relatorio 
		 * caso o aluno tenha visto ela
		 *
		 * @param {Questao} q - Questao vista pelo jogador
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */
		public function empilhaQuestao(q:Questao) {
			this.questoesRespondidas.push(q);
		}
		/**
		 * Gera a String final de relatorio
		 *
		 * @return {String} - String com o relatorio completo (Login + Percurso)
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */
		public function geraRelatorio():String {
			var rel:String="";
			var corretas:int=0;
			var erradas:int=0;
			var q:Questao;
			/*login*/




			if (questoesRespondidas.length!=0) {

				//rel=login.getStringRelatorio();

				rel = "";
				
				for (var j:int = 0; j < questoesRespondidas.length; j++) {
					q=questoesRespondidas[j];
					if (q.estaCorreta()==true) {
						corretas++;
					} else {
						erradas++;
					}
				}
				
				rel+="Corretas: "+corretas+"\nIncorretas: "+erradas+"\n";
				rel+="\nPercurso:\n";

				/*questoes*/
		
				for (var i:int = 0; i < questoesRespondidas.length; i++) {
					q=questoesRespondidas[i];
					rel += (i+1) + " - "+ q.getStringRelatorio();
				}
				return rel;
			}

			return "\nJogador não começou a responder as questões";
		}
		/**
		 * Gera a Array de Movie Clips para impressao
		 *
		 * @return {Array} - Array de MCs
		 *
		 * @author Bruno Milare
		 * @date 08/09/2009
		 */
		public function geraRelatorioImpressao():Array {
			var rel:String="";
			var nLines:int=0;
			var nPages:int=0;
			var maxLines=40;
			var corretas:int=0;
			var erradas:int=0;
			var paperW=495;
			var paperH=842;
			var pj:PrintJob = new PrintJob();
			var arrayMCs:Array = new Array();
			var txtRelatorio = new TextField();
			var currentPage=-1;
			//var mc = new MovieClip();

			txtRelatorio.width=paperW;
			txtRelatorio.height=paperH;
			txtRelatorio.multiline=true;
			txtRelatorio.wordWrap=true;

			txtRelatorio.x=60;
			txtRelatorio.y=30;


			if (questoesRespondidas.length!=0) {
				//rel=login.getStringRelatorio();
				rel = "";

				for (var j:int = 0; j < questoesRespondidas.length; j++) {
					q=questoesRespondidas[j];
					if (q.estaCorreta()==true) {
						corretas++;
						trace("correta");
					} else {
						erradas++;
					}
				}

				rel+="Corretas: "+corretas+"\nIncorretas: "+erradas+"\n";
				rel+="\n Percurso:\n";

				txtRelatorio.text=rel;
				nLines=txtRelatorio.numLines;


				if (pj.start()) {
					/*questoes*/
					var q:Questao;
					for (var i:int = 0; i < questoesRespondidas.length; i++) {

						q=questoesRespondidas[i];
						rel = (i+1) + " - "+ q.getStringRelatorio();
						txtRelatorio.text+=rel;
						nLines=txtRelatorio.numLines;
						trace("Pagina: " + nPages );
						trace("Linhas: " + nLines );
						if (nLines > (maxLines*(nPages+1))) {
							arrayMCs[nPages] = new MovieClip();
							txtRelatorio.x=60;
							txtRelatorio.y=30;
							arrayMCs[nPages].addChild(txtRelatorio);


							try {
								pj.addPage(arrayMCs[nPages]);
								trace("Printing "+nPages);
							} catch (e:Error) {
								trace("Erro Impressao:" + e);
							}
							//pj.send();
							nPages++;
							txtRelatorio.text="";

						} else if (i == (questoesRespondidas.length -1)) {
							arrayMCs[nPages] = new MovieClip();
							arrayMCs[nPages].addChild(txtRelatorio);
							trace("ultima");
							try {
								pj.addPage(arrayMCs[nPages]);
								trace("Printing "+nPages);
							} catch (e:Error) {
								trace("Erro Impressao"+ e);
							}
							//pj.send();
							nPages++;

						}
					}
					pj.send();
				}
			}
			return arrayMCs;
		}
	}
}