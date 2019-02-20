package caca {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.net.LocalConnection;	
	
	import com.gskinner.utils.SWFBridgeAS3;
	
	import caca.eventos.EventoTela;
	
	public class Relatorio extends MovieClip {
		private var percurso:Array;
		private var pontuacao:int;
		private var acertos:int;
		private var erros:int;
		private var nomeJogador:String;
		private var anoTurma:String;
		private var dataAtual:String;
		private var loader:Loader;
		private var ponte:SWFBridgeAS3;
		//private var palco:MovieClip;
		
		
		
		public function Relatorio() {
			percurso = new Array();
			pontuacao = 0;
			loader = null;
			ponte = null;
			//this.palco = palco;
			
			btn_imprimir.tabIndex = 0;
			btn_sair.tabIndex = 1;
			
			btn_imprimir.addEventListener(MouseEvent.CLICK, imprimir);
			btn_sair.addEventListener(MouseEvent.CLICK, sair);
		}
		
		public function limpar():void {
			percurso = new Array();
			pontuacao = 0;
			acertos = 0;
			erros = 0;
		}
		
		public function setPontuacao(pontuacao:int):void {
			this.pontuacao = pontuacao;
		}
		
		public function setAcertos(acertos:int):void {
			this.acertos = acertos;
		}
		
		public function setErros(erros:int):void {
			this.erros = erros;
		}
		
		
		public function setNomeJogador(nomeJogador:String):void {
			this.nomeJogador = nomeJogador;
		}

		public function setAnoTurma(anoTurma:String):void {
			this.anoTurma = anoTurma;
		}

		public function setDataAtual(dataAtual:String):void {
			this.dataAtual = dataAtual;
		}
		
		public function log(str:String):void {
			percurso.push(str);
		}
		
		
		/*
			carrega as informações disponíveis nos textfields do palco para visualização do relatório na tela
		*/
		public function carregar():void {
			txt_relat.htmlText += "<p align=\"center\"><font size=\"24\"><b>Relatório</b></font></p><br><br>";
			//txt_relat.htmlText += "<font size=\"16\"><b>Nome: </b>"+nomeJogador+"</font>";
			//txt_relat.htmlText += "<font size=\"16\"><b>Turma: </b>"+ anoTurma+"</font>";
			//txt_relat.htmlText += "<font size=\"16\"><b>Data: </b>"+ dataAtual+"</font><br><br><ul>";
			txt_relat.htmlText += "<li>pontuação total: <b>" + pontuacao + "</b></li>";
			txt_relat.htmlText += "<li>frases corretas: <b>" + acertos + "</b></li>";
			txt_relat.htmlText += "<li>frases incorretas: <b>" + erros + "</b></li></ul><br>";
			
			txt_relat.htmlText += "<font size=\"16\"><b>Frases formadas</b></font><br><br></ul>";	
			txt_percurso.htmlText = "";	
			for ( var i=0; i<percurso.length; i++ ) {
				txt_percurso.htmlText += "<li>" + percurso[i] + "</li>";	
			}
			
			txt_percurso.htmlText += "</ul>";
		}
		
		
		/*
			inicia o trabalho de impressão carregando o swf externo, se ainda não tiver sido carregado
		*/
		public function imprimir(e:MouseEvent):void {
			if(loader == null) {
				loader = new Loader();
				var objFileToLoad:URLRequest = new URLRequest("files/print.swf");
				loader.contentLoaderInfo.addEventListener(Event.INIT, printCarregado);
				loader.load(objFileToLoad);	
			}
			else {
				printCarregado(null);
			}
			addChild(loader);		
		}
		
		
		/*
			Carregou o swf de impressão, já podemos estabelecer a ponte
		*/
		function printCarregado(event:Event):void
		{
			if(ponte == null) {
				ponte = new SWFBridgeAS3("impressaoProverbios2", this);
				ponte.addEventListener(Event.CONNECT, onConnect);
			}
			else {
				onConnect(null);
			}
		}		
		
		/*
			envia a mensagem para o swf que vai realizar a impressão na impressora
		*/
		function onConnect(p_evt:Event) {
			var strImpressao:String;
			
			// o relatório é formado pelo conteúdo dos textfields que estão no palco
			strImpressao = txt_relat.htmlText + txt_percurso.htmlText;	
			
			// dispara a impressão, enviando o conteúdo html e a função de callback
			ponte.send("imprimir", strImpressao, "finalizarImpressora");
		}	
		
		
		/*
			método chamado através da ponte pelo swf de impressão assim que termina de imprimir
		*/
		public function finalizarImpressora() {
			removeChild(loader);
		}	
		
		
		/*
		 	abre a tela de fechar da tela de impressao
		*/
		function sair(e:MouseEvent):void {
			var evt:EventoTela = new EventoTela(EventoTela.FECHA_TELA, null);
			dispatchEvent(evt);			
			parent.removeChild(this);
			//saida_relat.visible = true;
		}		
		
	}
}