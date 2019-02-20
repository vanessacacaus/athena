package caca {
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class AjudaTeclado extends MovieClip{
		var texto:Array;
		var slide:int;
		
		
		public function AjudaTeclado() {
			texto = new Array(
				"Use a tecla Tab para passar de uma área da tela para outra. Ao usar o teclado, a área onde você está atuando fica demarcada por um retângulo colorido. São 4 as áreas da tela: Banco de frases , Botões de controle do jogo , Grade de letras e Banco de palavras.",
				"Dentro de cada área, utilize as setas do teclado para selecionar o item que deseja (pode ser uma frase, um botão, uma letra ou uma palavra, dependendo da área selecionada).",
				"Para acessar uma dica utilize as setas para cima ou para baixo selecionando uma frase e em seguida pressione a seta para a direita e visualize a dica. Para fechá-la pressione ESC.",
				"Para selecionar uma palavra na grade de letras, movimente o marcador com as setas do teclado até a letra inicial desejada. Aperte a tecla Enter para selecionar a letra. Em seguida, com as setas, movimente o marcador até a letra final desejada.",
				"Se for uma letra válida (alinhada com a primeira letra), uma bolinha verde aparece ao lado da letra e a palavra toda (da letra inicial até a final) fica circulada. Aperte Enter na letra final para confirmar a seleção da palavra.",
				"Se for uma das palavras corretas para o desafio do jogo, ficará circulada definitivamente e a palavra aparecerá no banco de palavras, pronta para ser relacionada à respectiva frase.",
				"Use a tecla Tab para selecionar o banco de palavras, em seguida, use as setas do teclado para escolher a palavra desejada, aperte Enter. Use a tecla Tab novamente para selecionar o Banco de frases. Com as setas, escolha a frase que deseja relacionar com a palavra encontrada e aperte Enter."
				);
			slide = 0;
			btn_proximo.addEventListener(MouseEvent.CLICK, btnProximo);
			btn_anterior.addEventListener(MouseEvent.CLICK, btnAnterior);
			
			btn_anterior.tabIndex = 9;
			btn_proximo.tabIndex = 10;
			
			txt_ajuda.text = texto[0];
			ajustarBotoes();
		}
		
		function ajustarBotoes():void {
			if(slide > 0) 
				habilitar(btn_anterior, btnAnterior);
			else
				desabilitar(btn_anterior, btnAnterior);

			if(slide < texto.length-1) 
				habilitar(btn_proximo, btnProximo);
			else
				desabilitar(btn_proximo, btnProximo);
		}
		
		function btnProximo(e:MouseEvent) {
			proximo();
		}
		
		function btnAnterior(e:MouseEvent) {
			anterior();
		}
		
		function proximo():void {
			txt_ajuda.text = texto[++slide];
			ajustarBotoes();
		}
		
		function anterior():void {
			txt_ajuda.text = texto[--slide];
			ajustarBotoes();
		}
		
		function habilitar(btn: SimpleButton, e:Function):void {
			if(btn.enabled) return;
			btn.enabled = true;
			btn.visible = true;
			btn.addEventListener(MouseEvent.CLICK, e);
		}
		
		function desabilitar(btn: SimpleButton, e:Function):void {
			if(!btn.enabled) return;
			btn.enabled = false;
			btn.visible = false;
			btn.removeEventListener(MouseEvent.CLICK, e);
		}
	}
}