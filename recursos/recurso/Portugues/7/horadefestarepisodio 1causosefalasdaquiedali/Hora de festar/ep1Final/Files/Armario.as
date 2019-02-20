package {

	import flash.events.*;
	import flash.net.*;
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.display.*;
	import flash.net.URLRequest;
	import flash.utils.*;
	import flash.text.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.getDefinitionByName;

	/**
	 * Classe Armario
	 *
	 * @author Murilo Bianchini
	 * @date 07/12/2009
	 */
	public class Armario {

		public var itensArmario:Array = new Array(30);
		private var posArmario:Array = new Array(30);
		private var ArmarioAtivo:Boolean = false;
		private var i:int;
		private var cont:int;
		public var homem:manequimH;
		public var mulher:manequimM;
		public var manequim:int = 0;
		private var cabeca:Boolean = false;
		private var camisa:Boolean = false;
		private var perna:Boolean = false;
		private var bolsa:Boolean = false;
		private var acessorio:Boolean = false;
		private var sapato:Boolean = false;
		private var avisotexto:MovieClip = new Warning_text();


		/* Esse vetor (posArmario) ajusta a posicao de todos os objetos dentro do meuno do Armario sendo
		 * [nome da classe, posicao x, posicao y, tipoObjeto]. Dessa forma qdo chamar a funcao addItem
		 * o parametro premio tem que ser igual a primeira posicao. 
		 * TipoObjeto é uma propriedade que define se ele é:
		 * -> objeto = 0
		 * -> personagem = 1
		 * -> Balao = 2
		 * -> Cenario = 3
		 *
		 * Ex: premio no xml = pensamentoBalao
		 * Classe = pensamentoBalaoClass
		 * pos["pensamentoBalao", x, y, 2] 
		 */

		var pos0:Array = ["chapeu",499.3,-0.65,37.9,85.75,0];
		var pos1:Array = ["chapeupalha",335.5,-1.5,26,105.05,0];
		var pos2:Array = ["pano",231.85,289.55,53.9,129.2,0];
		var pos3:Array = ["tiara",242.85,346.55,63.9,137.55,0];
		var pos4:Array = ["flor",290.8,401.85,101.6,128.9,0];
		
		
		/* Na hora de colocar as camisetas/calças vai ter q colocar uma parametro a mais que
		 * eh a posicao do SetIndex em relacao as outras camisetas.
		 * verde = 1
		 * branca = 2
		 * azul = 3
		 * azul bebe = 4 e assim por diante
		 * numChildren - 1 = 30;
		 */

		var pos5:Array = ["bolsa1",630.3,129.7,60.65,230.7,3];
		var pos6:Array = ["bolsa2",633.9,183.9,67.95,231.9,3];
		var pos7:Array = ["bolsa3",630.6,318.0,115.65,228.9,3];
		var pos8:Array = ["bolsa4",634.2,243.45,70.05,228.2,3];
		var pos9:Array = ["bolsa5",680.0,391.0,149.05,368.05,3];
		
		var pos10:Array = ["bota",259.95,519.1,57.0,505.2,5];
		var pos11:Array = ["chinelodedo",368.9,533.7,55.95,518.85,5];
		var pos12:Array = ["sandaliadedo",481.8,538.1,56.85,519.65,5];
		var pos13:Array = ["sandalia",583.25,540.65,57.30,521.10,5];
		var pos14:Array = ["sapato",687.25,536.05,58.3,519.85,5];
		
		var pos15:Array = ["anel",291.15,165.75,34.2,368.75,4];
		var pos16:Array = ["brincos",240.0,180.3,67.05,192.8,4];
		var pos17:Array = ["oculos",237.0,213.0,68.05,164.0,4];
		var pos18:Array = ["pulseira",244.0,245.0,37.35,341.5,4];
		var pos19:Array = ["relogio",277.95,251.0,137.3,338.5,4];
		
		var pos20:Array = ["camiseta",335.85,151.45,48.1,224.8,1];
		var pos21:Array = ["camisalonga",375.45,148.1,41.95,218.45,1];
		var pos22:Array = ["camisa",422.9,149.4,44.3,220.1,1];
		var pos23:Array = ["blusa",467.45,154.35,46.1,227,1];
		var pos24:Array = ["blusa2",534.4,162.55,67.65,226.85,1];
		
		var pos25:Array = ["saia3",480.1,304.7,62.25,325.8,2];
		var pos26:Array = ["saia2",387.65,287.6,54.95,323.2,2];
		var pos27:Array = ["saia",437.75,302.15,63,324.25,2];
		var pos28:Array = ["calça",353.25,271.0,63.3,328.95,2];
		var pos29:Array = ["bermuda",522.9,304.0,64.85,329.1,2];


		/* Construtor inicia o vetor posArmario e inicia todas as variaveis de fundo do Armario
		 * como a moldura, a mascara, e o InputText.
		 */

		public function Armario() {
			homem = new manequimH();
			mulher = new manequimM();
			homem.x = 31.2;
			homem.y = 133.45;  
			mulher.x = 31.2;
			mulher.y = 131.85;
			avisotexto.x = 256.85;
			avisotexto.y = 208.85;
			posArmario = [pos0,pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,
			pos10,pos11,pos12,pos13,pos14,pos15,pos16,pos17,pos18,pos19,
			pos20,pos21,pos22,pos23,pos24,pos25,pos26,pos27,pos28,pos29];

			cont = 0;
		}
		
		/*private function orderOverItens(pai:*):void {
			for(var i = 0; i < cont; i++) {
				if(itensArmario[i].tipoObjeto == 1 || itensArmario[i].tipoObjeto == 2) {
					if(pai.numChildren > 10) {
						switch(itensArmario[i].overIndex) {
							case 10: pai.setChildIndex(itensArmario[i], numChildren - 1); break;
							case 9: pai.setChildIndex(itensArmario[i], numChildren - 2); break;
							case 8: pai.setChildIndex(itensArmario[i], numChildren - 3); break;
							case 7: pai.setChildIndex(itensArmario[i], numChildren - 4); break;
							case 6: pai.setChildIndex(itensArmario[i], numChildren - 5); break;
							case 5: pai.setChildIndex(itensArmario[i], numChildren - 6); break;
							case 4: pai.setChildIndex(itensArmario[i], numChildren - 7); break;
							case 3: pai.setChildIndex(itensArmario[i], numChildren - 8); break;
							case 2: pai.setChildIndex(itensArmario[i], numChildren - 9); break;
							case 1: pai.setChildIndex(itensArmario[i], numChildren - 10); break;
						}
					}
				}
			}
		}*/

		/* addItemArmario insere um item que o jogador ganhou na matriz de objetos do Armario. 
		 * Ele pega o parametro do premio e cria um novo objeto atraves
		 * do getDefinitionByName. Entao ele procura que objeto é no posArmario e coloca todas 
		 * as informações no objeto(posicao/tipo/flags).
		 * 
		 * A matriz itensArmario guarda 6 itens em cada linha dela (um para cada quadrinho do Armario)
		 * pois quando o personagem ganha um item, ele pode usa-lo ateh seis vezes.
		 *
		 * Exemplo Matriz itensArmario
		 * 
		 * Item1 Item1 Item1 Item1 Item1 Item1
		 * Item2 Item2 Item2 Item2 Item2 Item2
		 * Item3 Item3 Item3 Item3 Item3 Item3
		 * Item4 Item4 Item4 Item4 Item4 Item4
		 * Item5 Item5 Item5 Item5 Item5 Item5
		 */

		public function addItemArmario(premio:String):void {

			var classDefinition:Object = getDefinitionByName(premio + "Class");
			itensArmario[cont] = new classDefinition();
			itensArmario[cont].x = getXPremio(premio);
			itensArmario[cont].inicialx = itensArmario[cont].x;
			itensArmario[cont].finalx = getXFinal(premio);
			itensArmario[cont].y = getYPremio(premio);
			itensArmario[cont].inicialy = itensArmario[cont].y;
			itensArmario[cont].finaly = getYFinal(premio);
			itensArmario[cont].tipoObjeto = getTipoPremio(premio);
			if(itensArmario[cont].tipoObjeto == 1 || itensArmario[cont].tipoObjeto == 2) {
				itensArmario[cont].ordem = getOrdemItem(premio);
			}
			if (ArmarioAtivo) {
				itensArmario[cont].addEventListener(MouseEvent.CLICK, ObjectClick);
				itensArmario[cont].addEventListener(MouseEvent.MOUSE_OVER, ObjectOver);
				itensArmario[cont].addEventListener(MouseEvent.MOUSE_OUT, ObjectOut);
			}
			cont++;
		}

		/* Essas funcoes soh pegam as posicoes X e Y e Tipo do posArmario a partir do nome do premio
		 */
		public function getXPremio(premio:String):int {
			for (i = 0; i < 30; i++) {
				if (posArmario[i][0] == premio) {
					return posArmario[i][1];
				}
			}
			return 0;
		}

		public function getYPremio(premio:String):int {
			for (i = 0; i < 30; i++) {
				if (posArmario[i][0] == premio) {
					return posArmario[i][2];
				}
			}
			return 0;
		}

		public function getXFinal(premio:String):int {
			for (i = 0; i < 30; i++) {
				if (posArmario[i][0] == premio) {
					return posArmario[i][3];
				}
			}
			return 0;
		}

		public function getYFinal(premio:String):int {
			for (i = 0; i < 30; i++) {
				if (posArmario[i][0] == premio) {
					return posArmario[i][4];
				}
			}
			return 0;
		}

		public function getTipoPremio(premio:String):int {
			for (i = 0; i < 30; i++) {
				if (posArmario[i][0] == premio) {
					return posArmario[i][5];
				}
			}
			return 0;
		}
		
		public function getOrdemItem(premio:String):int {
			for (i = 0; i < 30; i++) {
				if (posArmario[i][0] == premio) {
					return posArmario[i][6];
				}
			}
			return 0;
		}


		/* As funcoes ObjetoFuncUp e ObjetoFuncDown tratam o caso do mouse no Objeto normal
		 * e personagem(não Balão, nem Cenario). ele testa com relacao a mascara criada embaixo 
		 * dos Armarios. Dessa forma se o objeto estiver no Armario ele deixa lá, senão ele retorna pra
		 * posicao inicial.
		 */

		public function ObjectClick(e:MouseEvent):void {
			if (e.target.x == e.target.inicialx && e.target.y == e.target.inicialy) {
				if(getAcessObject(e.target.tipoObjeto)) {
					e.target.x = e.target.finalx;
					e.target.y = e.target.finaly;
				}
			} else {
				freeObject(e.target.tipoObjeto);
				e.target.x = e.target.inicialx;
				e.target.y = e.target.inicialy;
			}
		}
		
		private function getAcessObject(objeto:int):Boolean {
			if(objeto == 0) {
				cabeca = true;
				return true;
			} else if(objeto == 1 && camisa == false) {
				camisa = true;
				return true;
			} else if(objeto == 2 && perna == false) {
				perna = true;
				return true;
			} else if(objeto == 3 && bolsa == false) {
				bolsa = true;
				return true;
			} else if(objeto == 4) {
				acessorio = true;
				return true;
			} else if(objeto == 5 && sapato == false) {
				sapato = true;
				return true;
			} else {
				return false;
			}
		}
		
		private function freeObject(objeto:int):void {
			switch(objeto) {
				case 0: cabeca = false; break;
				case 1: camisa = false; break;
				case 2: perna = false; break;
				case 3: bolsa = false; break;
				case 4: acessorio = false; break;
				case 5: sapato = false; break;
			}
		}

		public function ObjectOver(e:MouseEvent):void {
			if(e.target.tipoObjeto == 4) {
				e.target.width *= 1.6;
				e.target.height *= 1.6;
				e.target.parent.setChildIndex(e.target, e.target.parent.numChildren -1);
			} else if(e.target.tipoObjeto == 1 || e.target.tipoObjeto == 2) { 
				e.target.width *= 1.25;
				e.target.height *= 1.25;
				e.target.parent.setChildIndex(e.target, e.target.parent.numChildren -1);
			} else {
				e.target.width *= 1.25;
				e.target.height *= 1.25;
				e.target.parent.setChildIndex(e.target, e.target.parent.numChildren -1);
			}
			//pensar no esquema das roupas uma em cima da outra
		}


		function ObjectOut(e:MouseEvent):void {
			if(e.target.tipoObjeto == 4) {
				e.target.width /= 1.6;
				e.target.height /= 1.6;
			} else {
				e.target.width /= 1.25;
				e.target.height /= 1.25;
			}
		}

		/* ShowArmario coloca todo o Armario na tela usando addChild qdo o jogador entra no Armario.
		 * Essa funcao é chamada no frame em que ficar o Armario. Logo no começo.
		 * A funcao OrderItens ajusta os itens que estao já nos quadrinhos pelo setChildIndex
		 * para qdo o item for recolocado os cenarios nao ficarem em cima dos itens.
		 */

		public function showArmario(pai:*):void {
			if(manequim == 0) {
				pai.addChild(homem);
			} else {
				pai.addChild(mulher);
			}
			var t:Number;
			var aux1:Number;
			var aux2:Number;
			for (var i = 0; i < cont; i++) {
				pai.addChild(itensArmario[i]);
			}
			
			for (var j = 0; j < cont; j++) {
				if(itensArmario[j].tipoObjeto == 3) {
					if(itensArmario[j].x != itensArmario[j].inicialx) {
						trace("ajustou 3");
						pai.setChildIndex(itensArmario[j], pai.numChildren-1);
					}
				} else if(itensArmario[j].tipoObjeto == 1) {
					
					if(itensArmario[j].x != itensArmario[j].inicialx) {
						trace("ajustou 1");
						pai.setChildIndex(itensArmario[j], pai.numChildren-2);
					}
				} else if(itensArmario[j].tipoObjeto == 2) {
					if(itensArmario[j].x != itensArmario[j].inicialx) {
						trace("ajustou 2");
						pai.setChildIndex(itensArmario[j], pai.numChildren-3);
					}
				}
			}
			if(!ArmarioAtivo) {
				pai.addChild(avisotexto);
			}
		}

		/* hideArmario tira todos os itens do Armario da tela.
		 * Essa funcao é chamada nos botoes de saida do Armario, help do Armario, imprimirArmario para apagar
		 * tudo da tela antes de voltar para o jogo.
		 */

		public function hideArmario(pai:*):void {
			if(manequim == 0) {
				pai.removeChild(homem);
			} else {
				pai.removeChild(mulher);
			}
			for (var i = 0; i < cont; i++) {
				pai.removeChild(itensArmario[i]);
			}
			if(!ArmarioAtivo) {
				pai.removeChild(avisotexto);
			}
		}


		/* ShowItem é uma funcao que terá que ser mudada para cada jogo.
		 * Ela é reponsável por fazer o item aparecer na tela de feedback cada vez o jogador
		 * acerta uma questao, informando que item o jogador ganhou.
		 * Então conforme o jogo é uma posicao que vc quer colocar os itens.
		 * Eles estão dividos por tipo de item. E são idenpendentes da matriz itensArmario.
		 */

		public function showItem(pai:*, premio:String):void {
			var classDefinition:Object=getDefinitionByName(premio+"Class");

			var item:Object = new classDefinition();
			item.tipoObjeto=getTipoPremio(premio);
			if (item.tipoObjeto==0) {// cabeca
				item.x=486.3;
				item.y=335.4;
			}
			if (item.tipoObjeto==1) {// camisa
				item.x=470.6;
				item.y=329.7;
				item.scaleX *= 0.8;
				item.scaleY *= 0.8;
			}
			if (item.tipoObjeto==2) {// perna
				item.x=495.3;
				item.y=332.1;
				item.scaleX *= 0.6;
				item.scaleY *= 0.6;
			}
			if (item.tipoObjeto==3) {// bolsa
				item.x=508.4;
				item.y=326.8;
			}
			if (item.tipoObjeto==4) {// acessorio
				item.x=500.5;
				item.y=363.6;
				item.scaleX *= 2;
				item.scaleY *= 2;
			}
			if (item.tipoObjeto==5) {// sapato
				item.x=482.75;
				item.y=360.6;
			}
			pai.addChild(item);
		}

		/* Essa funcao ajusta somente os itens que estao no Armario para ser impressos.
		 * Essa funcao tem que ser chamada em outro frame, em branco.
		 * Os itens sao deslocados para ficarem exatamente na pagina de impressao.
		 */

		public function printShowArmario(pai:*):void {
			if(manequim == 0) {
				homem.x += 200;
				pai.addChild(homem);
			} else {
				mulher.x += 200;
				pai.addChild(mulher);
			}
			for(var i = 0; i < cont; i++) {
				if((itensArmario[i].x != itensArmario[i].inicialx) && (itensArmario[i].y != itensArmario[i].inicialy)) {
					itensArmario[i].x += 200;
					pai.addChild(itensArmario[i]);
				}
			}
		}

		/* Ao contrario da funcao printShowArmario, essa reajusta os itens para o Armario novamente
		 * caso o jogador decida voltar e refazer o Armario.
		 */

		public function printHideArmario(pai:*):void {
			if(manequim == 0) {
				homem.x -= 200;
				pai.removeChild(homem);
			} else {
				mulher.x -= 200;
				pai.removeChild(mulher);
			}
			for(var i = 0; i < cont; i++) {
				if((itensArmario[i].x != itensArmario[i].inicialx) && (itensArmario[i].y != itensArmario[i].inicialy)) {
					itensArmario[i].x -= 200;
					pai.removeChild(itensArmario[i]);
				}
			}
		}

		/* Até o jogador ganhar um item de cada personagem os itens não são liberados
		 * para uso. Simplesmente não são colocados os EventListeners.
		 * Essa funcao ativa o Boolean Armarioativo e coloca os EventListeners de todos os itens
		 * que já existem na matriz. Os novos itens o proprio addItem coloca os Listeners.
		 */

		public function ativaArmario():void {
			ArmarioAtivo=true;
			for (var i = 0; i < cont; i++) {
				itensArmario[i].addEventListener(MouseEvent.CLICK, ObjectClick);
				itensArmario[i].addEventListener(MouseEvent.MOUSE_OVER, ObjectOver);
				itensArmario[i].addEventListener(MouseEvent.MOUSE_OUT, ObjectOut);
			}
		}

		public function getArmarioAtivo():Boolean {
			return ArmarioAtivo;
		}

		/* Essa funcao serve para ativar todo o Armario sem ter q responder nenhuma questao.
		 * Otima para testar o Armario dentro do jogo. Tem que ajustar para cada jogo, pois
		 * o nome dos premios mudam.
		 */

		public function testarArmario():void {
			addItemArmario("chapeu");
			addItemArmario("chapeupalha");
			addItemArmario("pano");
			addItemArmario("tiara");
			addItemArmario("flor");
			addItemArmario("bolsa1");
			addItemArmario("bolsa2");
			addItemArmario("bolsa3");
			addItemArmario("bolsa4");
			addItemArmario("bolsa5");
			addItemArmario("bota");
			addItemArmario("chinelodedo");
			addItemArmario("sandaliadedo");
			addItemArmario("sandalia");
			addItemArmario("sapato");
			addItemArmario("anel");
			addItemArmario("brincos");
			addItemArmario("oculos");
			addItemArmario("pulseira");
			addItemArmario("relogio");
			addItemArmario("camiseta");
			addItemArmario("camisalonga");
			addItemArmario("camisa");
			addItemArmario("blusa");
			addItemArmario("blusa2");
			addItemArmario("saia3");
			addItemArmario("saia2");
			addItemArmario("saia");
			addItemArmario("calça");
			addItemArmario("bermuda");
		}
	}
}