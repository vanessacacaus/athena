package {
	/**
	 * Classe Questao
	 *
	 * @author Bruno Milare
	 * @date 22/04/2009
	 */
	public class Questao {
		
		/*
		 * Variáveis Gerais
		 */
		private var tipo:String;
		private var enunciado:String;
		private var textoRelacionado:String;
		private var alternativas:Array = new Array(5);
		private var valorPontos:int;
		private var numAlternativas:int;
		private var dialogo:Dialogo;		
		
		/*
		 * Variáveis pertinentes a questões de teste
		 */
		private var dicaTeste:String;
		private var respostaCorretaTeste:int;
		private var feedbackTeste:Array = new Array(5);
		private var respostaDadaTeste:int;
		private var respondeuCorretamenteTeste:Boolean;
		
		/*
		 * Variáveis pertinentes a questões de Verdadeiro ou Falso
		 */
   		private var dicaVF:Array = new Array(5);
		private var respostaCorretaVF:Array = new Array(5);
		private var feedbackVF:Array = new Array(4);
		private var respostaDadaVF:Array = new Array(5);
		private var respondeuCorretamenteVF:Array = new Array(5);
	
		/**
		 * Construtor
		 *
		 * @param {String} args[0] - tipo da questao ('teste' ou 'VF')
		 * @param {String} args[1] - enunciado da questao
		 * @param {String} args[2] - texto relacionado a questao
		 * @param {Array(10)} args[3] - alternativas
		 * @param {String} args[4] - dica
		 * @param {int} args[5] - valor em pontos da questao
		 * @param {Array} args[6] - feedback
		 * @param {int,Array} args[7] - resposta correta
		 * @param {Dialogo,Array} args[8] - dialogo
		 */
		 
		public function Questao( ... args){
		
			if(args.length > 0){
				this.tipo = args[0];
				this.enunciado = args[1];
				this.textoRelacionado = args[2];
				this.alternativas = args[3];
				this.valorPontos = args[5];
				this.numAlternativas = 5;
			
				if(this.tipo == 'teste'){
					this.dicaTeste = args[4];
					this.feedbackTeste = args[6];
					this.respostaCorretaTeste = args[7];
					this.dialogo = args[8];
				}
			
				else if(this.tipo == 'vf'){
					this.dicaVF = args[4];
					this.feedbackVF = args[6];
					this.respostaCorretaVF = args[7];
					this.dialogo = args[8];
				}
			}
		}
		
		/*
		 * Guarda a informação sobre a corretude da resposta, deve ser utilizado
		 * sempre depois de receber uma resposta.
		 * para teste: q.verificaResposta();
		 * para v ou f: q.verificaResposta(i) - para guardar soh uma alternativa.
		 *              q.verificaResposta() - para guardar todas.
		 *
		 * @param {int} args[0] - indice da alternativa de V ou F.
		 */
		public function verificaResposta(... args):void{
			if(this.tipo == 'teste')
				this.respondeuCorretamenteTeste = this.respostaDadaTeste == this.respostaCorretaTeste ? true : false;
			
			else if(this.tipo == 'vf')
				if(args.length > 0){
					if(this.respostaDadaVF[args[0]] == this.respostaCorretaVF[args[0]])
						this.respondeuCorretamenteVF[args[0]] = true 
					else
						this.respondeuCorretamenteVF[args[0]] = false;
				}
				else{
					for(var i=0; i< this.numAlternativas; i++){
						if(this.respostaDadaVF[i] == this.respostaCorretaVF[i])
							this.respondeuCorretamenteVF[i] = true ;
						else 
							this.respondeuCorretamenteVF[i] = false;
					}
				}
		}
		
		/*
		 * Informa se a resposta estava certa
		 * para teste: q.estaCorreta()
		 * para v ou f: q.estaCorreta(i) - para uma alternativa
		 *              q.estaCorreta() - para ver se todas estao corretas
		 *
		 * @param {int} args[0] - indice da alternativa VF
		 */
		public function estaCorreta(... args):Boolean{
			if(this.tipo == 'teste')
				return this.respondeuCorretamenteTeste;
				
			else if(this.tipo == 'vf')
				if(args.length > 0)
					return this.respondeuCorretamenteVF[args[0]];
	
				for( var i=1; i< this.numAlternativas; i++)
					if(this.respondeuCorretamenteVF[i] == false) 
						return false;
				return true;				
		}
	
		/** 
		 * Devolve uma ou todas as alternativas
		 *
		 * para teste e vf: getAlternativas(i):String - retorna uma alternativa
		 *                  getAlternativas():Array - retorna todas alternativas
		 *
		 * @param {int} args[0] - numero da alternativa, null para todas
		 * @return {String}
		 */
		public function getAlternativas(... args){
			return args[0] == null ? this.alternativas : this.alternativas[args[0]];
		}
		
		/**
		 * Define uma ou todas alternativas
		 * (uma): setAlternativas(2,"Nova Alternativa 2");
		 * (todas): setAlternativas (["alt1","alt2","alt3","alt4","alt5"])
		 *
		 * @param {int} args[0] - valor da alternativa(teste) ou indice da alternativa(VF)
		 * @param {int} args[1] - valor da alternativa VF
		 */
		public function setAlternativas(... args){
	
			if(args[1] == null) 
				this.alternativas = args[0];
			else 
				this.alternativas[args[0]] = args[1];
		}
		
			/** 
		 * Devolve a resposta correta
		 *
		 * para teste: getRespostaCorreta(): int
		 * para v ou f: getRespostaCorreta(i): 'V' ou 'F'
		 *              getRespostaCorreta(): Array de V ou F.
		 *
		 * @param {int} args[0] - indice da alternativa de V ou F.
		 */ 
		public function getRespostaCorreta(... args){ 
		
			if(this.tipo == 'teste')
				return this.respostaCorretaTeste;
				
			if(this.tipo == 'vf') 
				if(args[0] != null)
					return this.respostaCorretaVF[args[0]];
			return this.respostaCorretaVF;
		}
		/** 
		 * Define a resposta correta
		 *
		 * para teste: q.setRepostaCorreta(i:int)
		 * para v ou f: q.setRespostaCorreta(indice:int, valor:String {'V' ou 'F'})
		 *              q.setRespostaCorreta(a:Array {'V' ou 'F'})
		 *
		 * @param {int} args[0] - valor da alternativa(teste) ou indice da alternativa(VF)
		 * @param {int} args[1] - valor da alternativa VF
		 */
		public function setRespostaCorreta(... args){
			if(this.tipo == 'teste')
				this.respostaCorretaTeste = args[0];
			else if(this.tipo == 'vf'){
				if(args[1] != null)
					this.respostaCorretaVF[args[0]] = args[1];
				else
					this.respostaCorretaVF = args[0];
			}
		}
		
		/** 
		 * Devolve o feedback de uma ou de todas alternativas
		 *
		 * @param {int} args[0] - indice da questao
		 * @return {String}
		 */ 
		public function getFeedback(... args){ 
			if(this.tipo == 'teste'){
				if(args[0] != null)
					return this.feedbackTeste[args[0]];
				else
					return this.feedbackTeste;
			}
			
			else if(this.tipo == 'vf'){
				if(args[0] != null)
					return this.feedbackVF[args[0]];
				else
					return this.feedbackVF;
			}
		}
		
		/** 
		 * Define o feedback de uma ou de todas alternativas
		 *
		 * @param {String} args[0] - indice ou valor feedback
		 * @param {String} args[1] - indice ou valor feedback
		 */
		public function setFeedback(... args){ 
			if(this.tipo == 'teste'){
				if(args[1] != null)
					this.feedbackTeste[args[0]] = args[1];
				else
					this.feedbackTeste = args[0];
			}
			
			else if(this.tipo == 'vf'){
				if(args[1] != null)
					this.feedbackVF[args[0]] = args[1];
				else
					this.feedbackVF = args[0];
			}
		}
		
		/** 
		 * Devolve a resposta dada de um teste,de uma alternativa VF ou de todas VF
		 *
		 * @param {String} args[0] - indice de uma alternativa VF
		 * @return {int}
		 */ 
		public function getRespostaDada(... args){ 
			if(this.tipo == 'teste'){
				return this.respostaDadaTeste;
			}
			else if(this.tipo == 'vf'){
				if(args[0] == null){
					return this.respostaDadaVF;
				}
				 else
					return this.respostaDadaVF[args[0]];
			}
		}
		
		/** 
		 * Define a resposta dada pelo aluno
		 *
		 * @param {int} args[0] - resposta de questao teste ou indice de VF
		 * @param {int} args[1] - resposta de questao VF
		 */
		public function setResposta(... args){ 
			if(this.tipo == 'teste') 
				this.respostaDadaTeste = args[0];
			else if(this.tipo == 'vf'){
				if(args[1] != null)
					this.respostaDadaVF[args[0]] = args[1];
				else
					this.respostaDadaVF = args[0];
			}
		}
		
		/**
		 * Gera a string que sera colocada no relatorio, referente a uma determinada questao
		 *
		 * @author Victor Cezar
		 * @date 22/04/2009
		 * @return {String} ret - relatorio sobre a questao 
		 */
		public function getStringRelatorio():String{
			var ret:String;
			
			ret =   Utils.textoTirandoImagem(this.enunciado) + "\n";
	
			if(this.tipo == "teste")
				ret += ((this.respondeuCorretamenteTeste) ? "CORRETA - " : "INCORRETA - " ) +this.alternativas[this.respostaDadaTeste] + "\n";
			else {
				for(var i:int = 0; i < 5; i++){
					ret += ((this.respondeuCorretamenteVF[i]) ? "\nCORRETA - " : "\nINCORRETA - " );
					ret += this.respostaDadaVF[i] + " - " + this.alternativas[i];
				}
			}
			
			return ret + "\n";
		}
		
		/** 
		 * Devolve a dica
		 *
		 * @param {int} args[0] - indice da dicaVF
		 * @return {String}
		 */ 
		public function getDica(... args){ 
			if(this.tipo == 'teste'){
				return this.dicaTeste; 
			}
			else{
				if(args.length > 0){
					return this.dicaVF[args[0]];
				}
				else{
					return this.dicaVF;
				}
			}
		}
		
		/** 
		 * Define a dica
		 *
		 * @param {String, Array} args[0] - dica da questao ou vetor de dicas
		 * @param {String} args[1] - indice da questao a ser atribuida a dica VF
		 */
		public function setDica(... args){ 
			if(this.tipo == 'teste'){
				this.dicaTeste = args[0];	
			}
			else{
				if(args[1] != null){
					this.dicaVF[args[1]] = args[0];
				}
				else{
					this.dicaVF = args[0];
				}
			}
		}
		
		/** 
		 * Devolve o tipo de questao
		 *
		 * @return {String}
		 */ 
		public function getTipo():String{ return this.tipo; }
		
		/** 
		 * Define o tipo de questao
		 *
		 * @param {String} t - tipo da questao
		 */ 
		public function setTipo(t:String){ this.tipo = t; } 
		
		/** 
		 * Devolve o enunciado
		 *
		 * @return {String}
		 */ 
		public function getEnunciado():String{ return this.enunciado; }
		
		/** 
		 * Define o enunciado
		 *
		 * @param {String} e - enunciado
		 */
		public function setEnunciado(e:String){ this.enunciado = e;	}
		
		/** 
		 * Devolve o texto relacionado
		 *
		 * @return {String}
		 */ 
		public function getTextoRelacionado():String{ return this.textoRelacionado; }
		
		/** 
		 * Define o texto relacionado
		 *
		 * @param {String} tr - texto relacionado a questao
		 */
		public function setTextoRelacionado(tr:String){ this.textoRelacionado = tr;	}
		
		/** 
		 * Devolve o valor da questao
		 *
		 * @return {int}
		 */ 
		public function getValorPontos():int{ return this.valorPontos; }
		
		/** 
		 * Define o valor da questao
		 *
		 * @param {int} v - valor
		 */
		public function setValorPontos(v:int){ this.valorPontos = v; }
		
		/** 
		 * Devolve o numero de alternativas
		 *
		 * @return {int}
		 */ 
		public function getNumAlternativas():int{ return this.numAlternativas; }
		
		/** 
		 * Define o numero de alternativas
		 *
		 * @param {int} n - valor
		 */
		public function setNumAlternativas(n:int){ this.numAlternativas = n; }
		
		public function getDialogo():Dialogo{ return this.dialogo; }
		
		
	}
}