package caca {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;	
	
	//eFrases;
	import caca.Palavras;
	import caca.Ajuda;
	import caca.Relatorio;
	import caca.Dica;
	import caca.eventos.EventoMatriz;
	import caca.eventos.EventoFrases;
	import caca.eventos.EventoPalavras;
	import caca.eventos.EventoTela;
	import caca.eventos.EventoTela;
	

	/* 
	 * Classe controladora do jogo 
	 */
	public class CacaPalavras extends MovieClip {
		var info:Array;
		var numeroPalavras:int;
		var banco:Array;
		var relatorio:Relatorio;
		var focusRectOriginal:Boolean;
		
		/* variveis para desonerar o relatorio */
		var nomeJogador:String;
		var anoTurma:String;
		var dataAtual:String;
		var percurso:Array;
		var pontos:int;
		var acertos:int;
		var erros:int;
		
		var palavra_arrastando:Palavra;
		var foco:MovieClip;
		
		const FRAME_PARABENS = 2;
		
		
		/*
			Construtor da classe
		*/
		public function CacaPalavras() {
			numeroPalavras = 7;
			banco = new Array(numeroPalavras);
			Dica.setPalco(this);
		}
		
		/*
			Inicializao da classe
		*/
		public function initCaca() {
			saida.visible = false;
			carregarDados(); //carrega as palavras, frases e dicas do arquivo externo
			
			adicionarEventosMatriz(); 
			adicionarEventosFrases();
			adicionarEventosPalavras();
			
			with(botoes) {
				btn_ajuda.addEventListener(MouseEvent.CLICK, ajudar);	
				btn_relatorio.addEventListener(MouseEvent.CLICK, impressao);	
				btn_fechar.addEventListener(MouseEvent.CLICK, sair);	
				lamp1.addEventListener(MouseEvent.CLICK, mostraxx);
			}
			
			with(saida) {
				btn_iniciar_novo.addEventListener(MouseEvent.CLICK, sairJogo);//ou reiniciar
				btn_continuar.addEventListener(MouseEvent.CLICK, continuar);
				btn_relatorio.addEventListener(MouseEvent.CLICK, impressao2);	
				
				btn_iniciar_novo.tabIndex = 1;
				btn_continuar.tabIndex = 2;
				btn_relatorio.tabIndex = 3;			
/*				btn_sair_jogo.addEventListener(MouseEvent.CLICK, sairJogo);*/
			}
			
			
			addEventListener(KeyboardEvent.KEY_DOWN, _gerenciarTeclado);
			placar.tabIndex = 0;
			stage.stageFocusRect = false;
			novoJogo(); //inicia um novo jogo
			
		}
		
		
		function mostraxx(){
				Dica.exibirDica("<font color='#FF0000'>DICA</font>: " + banco[0][2].getDica(), banco[0][2]);
		}
			
		/*
			Declara o vetor de informacoes utilizando um arquivo externo
		*/
		function carregarDados() {
			include "catapalavra.inc";
		}		
		
		
		/*
			Inicia um novo jogo
		*/		
		function novoJogo() {
			frases.limpar();
			palavras.limpar();
			matriz.limpar();
			percurso = new Array();
			
			obterBanco(); //obtem o banco de palavras a partir dos dados
			
			for(var i:int=0; i<banco.length; i++) {
				var _frase:Frase = frases.incluirFrase(banco[i][1], banco[i][2], banco[i][3]);
				_frase.palavra = palavras.incluirPalavra(banco[i][0], banco[i][4]);
				adicionarEventosPalavra(_frase.palavra);
			}
			
			palavras.misturarPosicoes();
			placar.zerar();
		}
		
		
		/* 
			Tratadores de eventos do painel de frases
		*/
		function adicionarEventosFrases():void {
			frases.addEventListener(EventoFrases.SELECAO_FRASE, selecionouFrase);
		}
		
		function selecionouFrase(e:EventoFrases):void {
			if(palavra_arrastando != null)
				if(conferirTentativa(palavra_arrastando, e.params.selecao)) {
					palavra_arrastando = null;
					if(palavras.temVisiveis())
						focar(palavras);
					else
						focar(matriz);
				}
		}
		
		
		/* 
			Tratadores de eventos do painel de palavras
		*/
		function adicionarEventosPalavras():void {
			palavras.addEventListener(EventoPalavras.SELECAO_PALAVRA, selecionouPalavra);
		}
		
		function selecionouPalavra(e:EventoPalavras):void {
			focar(frases);
			palavra_arrastando = e.params.selecao;
		}		
		
		
		/*
			Tratadores de eventos das palavras
		*/
		function adicionarEventosPalavra(palavra:Palavra) {
			palavra.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
			palavra.addEventListener(MouseEvent.MOUSE_UP, dropIt);
		}
		
		
		/* 
			Tratadores de eventos da matriz de letras
		*/
		function adicionarEventosMatriz():void {
			matriz.addEventListener(EventoMatriz.SELECAO_PALAVRA, circulouPalavra);
		}
		
		
		/*
			Jogador acabou de selecionar uma palavra na matriz
		*/
		function circulouPalavra(e:EventoMatriz):void {
			var palavra:Palavra = palavras.obterPalavra(e.params.palavra);
			if(palavra == null) {
				e.params.selecao.apagar();
			}
			else {
				palavra.visible = true;
			}
		}
		

		/*
			Confere se a palavra est sendo arrastada em cima de uma frase
		*/
		function checkHitTest(e:Event){
			frases.checarHit(palavra_arrastando);
		}		
		
		
		/*
			Inicia operao de arrastar palavra
		*/
		function pickUp(e:MouseEvent):void {
			palavra_arrastando = (e.currentTarget as Palavra);
			addEventListener(Event.ENTER_FRAME, checkHitTest);
			e.currentTarget.startDrag(false);
			e.currentTarget.alpha = 0.6;
		}
		
		/*
			Handler para o drop da palavra
		*/
		function dropIt(e:MouseEvent):void {
			removeEventListener(Event.ENTER_FRAME, checkHitTest);
			palavra_arrastando = null;
			e.currentTarget.stopDrag();
			e.currentTarget.alpha = 1;
			
			var alvo:DisplayObject = e.currentTarget.dropTarget;
			
			if(alvo != null && alvo.parent is Frase) {
				conferirTentativa(e.currentTarget as Palavra, alvo.parent as Frase);
			}
		}			
		
		
		
		/*
			Confere um casamento entre uma palavra e uma frase
		*/
		function conferirTentativa(palavra:Palavra, frase:Frase):Boolean {
			var strlog:String = "arrastou palavra " + palavra.getTexto() + " para a frase " + frase.getTexto();
			if(frase.palavra == palavra) {
				log(frase.getTexto().replace(/____/, "<font color='#336633'><b>" + palavra.getTexto() + "</b></font>"));
				acertar(frase);
				//Dica.exibirFeedback(frase.getFeedback(), frase);
				conferirTermino();
				return true;
			}
			else {
				errar(palavra);
				//Dica.exibirDica("<font color='#FF0000'>DICA</font>: " + frase.getDica(), frase);
				strlog += " (incorreto)";
				log(frase.getTexto().replace(/____/, "<font color='#990000'><b>" + palavra.getTexto() + "</b></font>") + " (incorreto)");		
				return false;
			}			
		}
		

		/*
			Adiciona frase ao histrico
		*/
		public function log(str:String):void {
			percurso.push(str);
		}
		
		/*
			Jogador relacionou corretamente frase e palavra
		*/
		function acertar(frase:Frase):void {
			frase.palavra.visible = false;
			frase.acertar();
			placar.acertar();
		}
		
		
		/* 
			Jogador relacionou a palavra com a frase errada
		*/
		function errar(palavra:Palavra):void {
			palavra.posicionar();
			placar.errar();
		}
				
		/*
			Confere se o jogo terminou
		*/
		function conferirTermino() {
			if(placar.getAcertos() == numeroPalavras) {
				terminarJogo(placar.getErros()==0);	
			}
		}
		
		
		/*
			Encerra o jogo
		*/
		function terminarJogo(ok:Boolean) {
			// impede que os eventos de teclado atrapalhem a utilizao do help
			removeEventListener(KeyboardEvent.KEY_DOWN, _gerenciarTeclado);
			
			// guarda na lembrana a atual situao do focusrect (se estiver na tela de login, focusrect == true)
			focusRectOriginal = stage.stageFocusRect;
			
			placar.tabEnabled = false;
				
			// liga o focusrect	
			stage.stageFocusRect = true;
			
			var mc:MovieClip;
			if(ok) {
				coletarPontuacao();
				gotoAndStop(1, "fim_ok");
			}
			else {
				coletarPontuacao();
				gotoAndStop(1, "fim_nok");
			}
		}


		/*
			Obtem o banco de palavras para ser usado no jogo atual
		*/		
		function obterBanco() {
			Util.shuffle(info);
			for(var i:int=0; i<numeroPalavras; i++)  {
				banco[i] = info[i];
				banco[i][0] = banco[i][0]; //.toUpperCase();
			}
				
			/* atribui esse banco  matriz de letras */	
			matriz.setBanco(banco);
		}
		
		
		/*
			Gerencia os eventos de teclado:
			
			Muda o foco do teclado entre os paineis se a tecla Tab for acionada. 
			Transfere o controle de foco para o painel selecionado caso as setas sejam acionadas.
			Retira o foco caso a tecla ESC seja acionada.

		*/
		function _gerenciarTeclado(e:KeyboardEvent):void {
			botoes.tabChildren=false;
			frases.tabChildren=false;
			switch (e.keyCode) {
				case Keyboard.TAB:
					if(foco==null || foco==frases)
						focar(botoes);
					else 
						if(foco==botoes)
							focar(matriz);
						else
							if(foco==matriz)
								focar(palavras);
						else
							focar(frases);
							
				break;
				case Keyboard.ESCAPE:
					if(!Dica.ocultar())
						desfocar();
				break;				
				case Keyboard.ENTER:
				case Keyboard.UP:
				case Keyboard.DOWN:
				case Keyboard.LEFT:
				case Keyboard.RIGHT:
					if(foco != null) 
						foco._gerenciarTeclado(e);
				break;
				case Keyboard.F1:
					exibirAjuda();
				break;
			}
		}
		
		/* 
			aciona o foco de um painel, colocando seu movieclip no frame "selecionado"
		*/
		function focar(mc:MovieClip):void {
			desfocar();
			mc.gotoAndStop("selecionado");
			foco = mc;
		}
		
		/*
			retira o foco de um painel, colocando seu movieclip no frame "normal"
		*/
		function desfocar():void {
			if(foco != null) {
				foco.desfocar();
				foco.gotoAndStop("normal");
				foco = null;
			}
		}		
		
		/* 
			exibe a tela de ajuda
		*/
		function ajudar(e:MouseEvent):void {
			exibirAjuda();
		}		
		
		
		/*
			exibe a tela de ajuda
		*/
		public function exibirAjuda():void {
			// impede que os eventos de teclado atrapalhem a utilizao do help
			removeEventListener(KeyboardEvent.KEY_DOWN, _gerenciarTeclado);
			
			// guarda na lembrana a atual situao do focusrect (se estiver na tela de login, focusrect == true)
			focusRectOriginal = stage.stageFocusRect;
			
			// confere se o placar existe, pois nem sempre esse mtodo  chamado na tela principal onde h placar
			if(placar != null)
				placar.tabEnabled = false;
				
			// liga o focusrect	
			stage.stageFocusRect = true;
			
			// finalmente, cria o movieclip da tela de ajuda
			var telaHelp = new Ajuda();
			telaHelp.addEventListener(EventoTela.FECHA_TELA, restaurarInteracao, false, 0, true);
			addChild(telaHelp);
		}

		
		/*
			exibe a tela de relatrio
		*/
		function impressao(e:MouseEvent):void {
			exibirRelatorio();
		}	
		

		/*
			fecha a tela de sada e exibe a tela de relatrio
		*/
		function impressao2(e:MouseEvent):void {
			continuar(null);
			exibirRelatorio();
		}
		
		
		public function exibirRelatorio():void {
			
			relatorio = new Relatorio();

			relatorio.addEventListener(EventoTela.FECHA_TELA, restaurarInteracao, false, 0, true);

			with(relatorio) {
				setNomeJogador(nomeJogador);
				setAnoTurma(anoTurma);
				setDataAtual(dataAtual);
			}
			
			for(var i:int=0; i<percurso.length; i++) 
				relatorio.log(percurso[i]);
			
			
			// impede que os eventos de teclado atrapalhem a utilizao do help
			removeEventListener(KeyboardEvent.KEY_DOWN, _gerenciarTeclado);
			
			// guarda na lembrana a atual situao do focusrect (se estiver na tela de login, focusrect == true)
			focusRectOriginal = stage.stageFocusRect;
			
			// confere se o placar existe, pois nem sempre esse mtodo  chamado na tela principal onde h placar
			if(placar != null)
				placar.tabEnabled = false;
			
			// liga o focusrect	
			stage.stageFocusRect = true;
			

			if(placar != null) 
				coletarPontuacao();				
		
			relatorio.setPontuacao(pontos);
			relatorio.setAcertos(acertos);
			relatorio.setErros(erros);
			relatorio.carregar();
			addChild(relatorio);
		}
		
		function coletarPontuacao():void {
			pontos = placar.getPontos();
			acertos = placar.getAcertos();
			erros = placar.getErros();
		}
		
		function sair(e:MouseEvent):void {
			Dica.ocultar();
			
			// impede que os eventos de teclado atrapalhem a utilizao do help
			removeEventListener(KeyboardEvent.KEY_DOWN, _gerenciarTeclado);
			
			// guarda na lembrana a atual situao do focusrect (se estiver na tela de login, focusrect == true)
			focusRectOriginal = stage.stageFocusRect;
			
			placar.tabEnabled = false;
				
			// liga o focusrect	
			stage.stageFocusRect = true;			
			
			saida.visible = true;
		}
		
		


		function reiniciar(e:MouseEvent) {
			novoJogo();
			continuar(null);
		}



		function continuar(e:MouseEvent) {
			restaurarInteracao(null);
			saida.visible = false;
		}		
		
		
		function sairJogo(e:MouseEvent) {
			gotoAndStop(1, "login");
			
		}
		
		
		
		/*
			evocada quando a tela de ajuda fecha, para restaurar as condies da tela antes da ajuda ser chamada
		*/
		function restaurarInteracao(e:Event):void {
			// retorna o focusrect  sua condio original
			stage.stageFocusRect = focusRectOriginal;
			if(placar != null) {
				// restaura a condio do placar (pode ser que ele no esteja na tela, por isso, confiro se == null)
				placar.tabEnabled = true;

				// restaura os eventos de teclado da tela principal
				addEventListener(KeyboardEvent.KEY_DOWN, _gerenciarTeclado);
			}
		}
		
		
		/*
			inicia o jogo
		*/
		function iniciarJogo(e:MouseEvent) {

				btn_iniciar.removeEventListener(MouseEvent.CLICK, iniciarJogo);

				gotoAndStop(1, "inicio");

		}		
		
	}
}