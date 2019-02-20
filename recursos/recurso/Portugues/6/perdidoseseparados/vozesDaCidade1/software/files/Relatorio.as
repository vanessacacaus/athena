package {
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
	
		 private var login:Login;
		 
		/*
		 * Variáveis pertinentes a questões
		 */
		private var questoesRespondidas1:Array = new Array();
		private var questoesRespondidas2:Array = new Array();
		private var questoesRespondidas3:Array = new Array();
		
		/**
		 * Construtor
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */		
		public function Relatorio(){ return;}

		
		/**
		 * Liga um login ao Relatorio Final
		 *
		 * @param {Login} l - Objeto de login criado no inicio do jogo
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */		
		public function setLogin(l:Login){ 
			this.login = l;
		}		

		
		/**
		 * Guarda questão para ser colocada no relatorio 
		 * caso o aluno tenha visto ela
		 *
		 * @param {Questao} q - Questao vista pelo jogador
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */		
		public function empilhaQuestao(q:Questao, n:int){
			this["questoesRespondidas"+n].push(q);
		}
		
		
		
		/**
		 * Gera a String final de relatorio
		 *
		 * @return {String} - String com o relatorio completo (Login + Percurso)
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */		
		public function geraRelatorio():String{
			var rel: String = "";
			/*login*/
			rel = login.getStringRelatorio();
			
			rel += "\n Percurso:\n";
			
			/*questoes*/
			var q:Questao;
			rel += "\n Jogo 1:\n";
			for(var i:int = 0; i < questoesRespondidas1.length; i++){
				q = questoesRespondidas1[i];
				rel += (i+1) + " - "+ q.getStringRelatorio();
			}
			rel += "\n Jogo 2:\n";
			for(i = 0; i < questoesRespondidas2.length; i++){
				q = questoesRespondidas2[i];
				rel += (i+1) + " - "+ q.getStringRelatorio();
			}
			rel += "\n Jogo 3:\n";
			for(i = 0; i < questoesRespondidas3.length; i++){
				q = questoesRespondidas3[i];
				rel += (i+1) + " - "+ q.getStringRelatorio();
			}
			
			
			return rel;
		}
		
		
	}
}