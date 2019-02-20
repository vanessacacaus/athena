package caca {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class AjudaControles extends MovieClip {
		var texto_botao:Array;
		
		public function AjudaControles() {
			stop();
			texto_botao = new Array();
			texto_botao["anterior"] = "O botão anterior é usado para retroceder nos diálogos ao longo do jogo.";
			texto_botao["proximo"] = "O botão próximo é usado para avançar nos diálogos ao longo do jogo.";
			texto_botao["siga"] = "O botão siga é usado para dar continuidade, seja ao entrar, na tela de login, seja depois de parar a entrevista, para continuá-la do mesmo ponto.";
			texto_botao["parar"] = "O botão parar serve para interromper o diálogo a qualquer momento. Depois de parar você pode trocar de capítulo.";
			texto_botao["pular"] = "Acionando esse botão é possível pular todo o diálogo e ir direto para a próxima ação do jogo. Você pode pular o diálogo introdutório ou o de um capítulo (caso já tenha ouvido uma vez).";
			texto_botao["improvisar"] = "Esse botão serve para que Juliana improvise na entrevista se aprofundando no assunto e, consequentemente, ampliando seus conhecimentos e melhorando sua avaliação!";
			texto_botao["roteiro"] = "Este botão, por sua vez, faz com que Juliana siga o roteiro pré-determinado da entrevista, sem arriscar uma pergunta improvisada. ";
			texto_botao["volume"] = "Utilize esse botão para acessar o controle de volume e áudio do jogo.";
			texto_botao["impressao"] = "Esse botão abre a tela do relatório de desempenho. A partir dela é possível  visualizar o relatório e imprimi-lo.";
			texto_botao["imprimir"] = "Envia o relatório para a impressora.";
			texto_botao["fechar"] = "Finaliza o jogo atual e inicia um novo.";
			texto_botao["trocar"] = "Permite que de desista de responder uma pergunta, indo para a tela de escolha dos assuntos daquele capítulo.";
			addFrameScript(0, init);
		}
		
		function init():void {
			btn_prev.addEventListener(MouseEvent.CLICK, anterior);	
			btn_next.addEventListener(MouseEvent.CLICK, proximo);
			btn_close.addEventListener(MouseEvent.CLICK, fechar);
			btn_relatorio.addEventListener(MouseEvent.CLICK, impressao);
			btn_imprimir.addEventListener(MouseEvent.CLICK, imprimir);
			
			btn_prev.tabIndex = 5;
			btn_next.tabIndex = 6;
			btn_relatorio.tabIndex = 7;
			btn_imprimir.tabIndex = 8;
			btn_close.tabIndex = 9;

			texto.text = "";
			borda.visible = false;
		}
		
		function anterior(e:MouseEvent) {
			mudarTexto("anterior");
			fazerBorda(btn_prev); 
		}
		
		function proximo(e:MouseEvent) {
			mudarTexto("proximo");
			fazerBorda(btn_next);
		}


		function fechar(e:MouseEvent) {
			mudarTexto("fechar");
			fazerBorda(btn_close);
		}

		function impressao(e:MouseEvent) {
			mudarTexto("impressao");
			fazerBorda(btn_relatorio);
		}
		
		function imprimir(e:MouseEvent) {
			mudarTexto("imprimir");
			fazerBorda(btn_imprimir);
		}
		


		function mudarTexto(botao:String):void {
			texto.text = texto_botao[botao];
		}


		function fazerBorda(botao) {
			borda.visible = false;
			borda.width = botao.width + 10;
			borda.height = botao.height + 10;
			borda.x = botao.x-8;
			borda.y = botao.y-8;	
			borda.visible = true;
		}

	}
}


