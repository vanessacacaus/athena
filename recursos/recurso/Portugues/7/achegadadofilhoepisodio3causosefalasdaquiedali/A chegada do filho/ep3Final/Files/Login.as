package {

	/**
	 * Classe Login
	 *
	 * @author Victor Cezar
	 * @date 22/04/2009	 
	 */	
	
	public class Login {
		
		/*
		 * Variáveis Login
		 */
	
		 private var nomeCompleto:String;
		 private var turma:String;
		 private var dataAtual:String;
		 private var pontosIniciais:int;
		
		/**
		 * Construtor
		 *
		 * @param {String} n - Nome Completo do Aluno
		 * @param {String} t - Turma do Aluno
		 * @param {String} d - Data atual
		 * @param {int} p - Pontos ao iniciar o jogo
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */
		 		
		public function Login(n:String, t:String, d:String, p:int){ 
			this.nomeCompleto = n;
			this.turma = t;
			this.dataAtual = d;
			this.pontosIniciais = p;
			
			return;
		}
		
		/**
		 * Define o Nome completo do Aluno
		 *
		 * @param {String} s - Nome Completo
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */
		 		
		
		public function setNomeCompleto(s:String){
			this.nomeCompleto = s;
		}

		/**
		 * Retorna o Nome completo do Aluno
		 *
		 * @return {String} - Nome Completo
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */		
		
		public function getNomeCompleto():String{return this.nomeCompleto;}
		
		/**
		 * Define a Turma do Aluno
		 *
		 * @param {String} s - Turma do aluno
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */		
		
		public function setTurma(s:String){
			this.turma = s;
		}
		
		
		/**
		 * Retorna a Turma do Aluno
		 *
		 * @return {String} - Turma do Aluno
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */		
		
		public function getTurma():String{return this.turma;}
		
		
		/**
		 * Define a Data atual
		 *
		 * @param {String} s - Data atual
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */		
		
		public function setDataAtual(s:String){
			this.dataAtual = s;
		}
		
		
		/**
		 * Retorna a Data Atual
		 *
		 * @return {String} - Data Atual
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */		
		
		public function getDataAtual():String{return this.dataAtual;}

		/**
		 * Define os Pontos Iniciais
		 *
		 * @param {int} p - Pontos Atuais
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */		
		
		public function setPontosIniciais(p:int){
			this.pontosIniciais = p;
		}
		
		
		/**
		 * Retorna os Pontos Iniciais
		 *
		 * @return {String} - Pontos Iniciais
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */
		
		public function getPontosIniciais():int{return pontosIniciais;}
		
		
		/**
		 * Gera a string do Login a ser utilizada no relatorio
		 *
		 * @return {String} - Cabeçalho do Relatorio como informacoes do login
		 *
		 * @author Victor Muniz Cezar
		 * @date 22/04/2009
		 */		
		
		public function getStringRelatorio():String{
			var rel:String;
			
			rel = "Nome completo: " + nomeCompleto+"\n";
			rel += "Turma: " + turma + "\n";
			rel += "Data: " + dataAtual + "\n";
			
			return rel;
		}
		
		
		
	}
}