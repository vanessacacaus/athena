package {

	import flash.events.*;
	import flash.net.*;
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.display.*;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.utils.*;
	import flash.text.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.getDefinitionByName;

	/**
	 * Classe HQ
	 *
	 * @author Murilo Bianchini
	 * @date 10/11/2009
	 */
	public class HQ {

		public var itensHQ:Array = new Array(30);
		private var posHQ:Array = new Array(30);
		private var HQativo:Boolean = false;
		private var mascara:mascaraHQ = new mascaraHQ();
		private var molduraDoHQ:molduraHQ = new molduraHQ();
		private var fimDoHQ:fimClassText = new fimClassText();
		private var relevo:MovieClip = new fundoHQ();
		private var i:int;
		private var cont:int;
		private var textoBalao:TextField = new TextField();
		private var textoBalaoFormat:TextFormat = new TextFormat();
		private var textoBalaoDentroFormat:TextFormat = new TextFormat();
		private var hqtexto:Warning_text = new Warning_text();
		
		
		/* Esse vetor (posHQ) ajusta a posicao de todos os objetos dentro do meuno do HQ sendo
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
		
		var pos0:Array = ["pensamentoBalao",30.55,29.8,2];
		var pos1:Array = ["narradorBalao",87.25,30.8,2];
		var pos2:Array = ["musicaBalao",139.6,27.1,2];
		var pos3:Array = ["gritoBalao",91.1,75.3,2];
		var pos4:Array = ["falaBalao",141.7,74,2];

		var pos5:Array = ["powBalao",29.7,80.0,0];
		var pos6:Array = ["smackBalao",21,120.4,0];
		var pos7:Array = ["shitBalao",89.9,118.2,0];
		var pos8:Array = ["bumBalao",141.7,119.2,0];
		var pos9:Array = ["fireworksBalao",33,168.9,0];
		
		var pos10:Array = ["ipod",93.9,168.9,0];
		var pos11:Array = ["envelope",143,178.3,0];
		var pos12:Array = ["bau",39.3,239.7,0];
		var pos13:Array = ["presente",124.3,234.3,0];
		var pos14:Array = ["pasta",131.8,296.5,0];

		var pos15:Array = ["padre",28.3,452.1,1];
		var pos16:Array = ["mundinho",75.1,450.6,1];
		var pos17:Array = ["joaquimbugre",103,450.6,1];
		var pos18:Array = ["zepretinho",133.4,449.2,1];
		var pos19:Array = ["seoraimundo",169,451.6,1];
		var pos20:Array = ["donajosefa",38.05,514.9,1];
		var pos21:Array = ["chiquinha",65.4,515.8,1];
		var pos22:Array = ["donamaria",95.6,514.9,1];
		var pos23:Array = ["cegoaderaldo",130.15,515.6,1];
		var pos24:Array = ["zita",167.2,517.9,1];

		var pos25:Array = ["cozinha",63.3,320.35,3];
		var pos26:Array = ["quarto",26.4+37.2,350.6+20.7,3];
		var pos27:Array = ["sala",26+37.2,399.6+20.7,3];
		var pos28:Array = ["varanda",113.6+37.2,351.5+20.7,3];
		var pos29:Array = ["terreiro",113.5+37.2,399.4+20.7,3];


		/* Construtor inicia o vetor posHQ e inicia todas as variaveis de fundo do HQ
		 * como a moldura, a mascara, e o InputText.
		 */
				
		public function HQ() {

			for (i = 0; i < 30; i++) {
				itensHQ[i] = new Array(6);
			}

			posHQ = [pos0,pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,
			pos10,pos11,pos12,pos13,pos14,pos15,pos16,pos17,pos18,pos19,
			pos20,pos21,pos22,pos23,pos24,pos25,pos26,pos27,pos28,pos29];

			cont = 0;
			mascara.x = 224;
			mascara.y = 109.6;
			molduraDoHQ.x = 203.9;
			molduraDoHQ.y = 87.95;
			fimDoHQ.x = 702.9;
			fimDoHQ.y = 522.35;
			relevo.x = 260;
			relevo.y = 123;
			hqtexto.x = 273;
			hqtexto.y = 271;
			
			textoBalaoDentroFormat.leading = -2;
			textoBalaoFormat.size = 14;
			textoBalao.width = 150;
			textoBalao.height = 50;
			textoBalao.x = 250;
			textoBalao.y = 30;
 			textoBalao.multiline = true;
			textoBalao.wordWrap = true;
 			textoBalao.setTextFormat(textoBalaoFormat);
			textoBalao.visible = false;
			textoBalao.type = TextFieldType.INPUT;
			textoBalao.border = true;
			textoBalao.maxChars = 12;
			textoBalao.setSelection(0, textoBalao.text.length);
			textoBalao.text = "Escreva aqui";
			textoBalao.addEventListener(Event.CHANGE, utfFix);
		}

		function utfFix(e:Event):void {
			Fix.utf(e.target);
		}
		/* AddItemHQ insere um item que o jogador ganhou na matriz de objetos do HQ. 
		 * Ele pega o parametro do premio e cria um novo objeto atraves
		 * do getDefinitionByName. Entao ele procura que objeto é no posHQ e coloca todas 
		 * as informações no objeto(posicao/tipo/flags).
		 * 
		 * A matriz ItensHQ guarda 6 itens em cada linha dela (um para cada quadrinho do HQ)
		 * pois quando o personagem ganha um item, ele pode usa-lo ateh seis vezes.
		 *
		 * Exemplo Matriz ItensHQ
		 * 
		 * Item1 Item1 Item1 Item1 Item1 Item1
		 * Item2 Item2 Item2 Item2 Item2 Item2
		 * Item3 Item3 Item3 Item3 Item3 Item3
		 * Item4 Item4 Item4 Item4 Item4 Item4
		 * Item5 Item5 Item5 Item5 Item5 Item5
		 */
		 
		public function addItemHQ(premio:String):void {

			var classDefinition:Object=getDefinitionByName(premio+"Class");

			for (var i = 0; i < 6; i++) {
				itensHQ[cont][i] = new classDefinition();
				itensHQ[cont][i].x=getXPremio(premio);
				itensHQ[cont][i].inicialx=itensHQ[cont][i].x;
				itensHQ[cont][i].y=getYPremio(premio);
				itensHQ[cont][i].inicialy=itensHQ[cont][i].y;
				itensHQ[cont][i].tipoObjeto=getTipoPremio(premio);
				if ((itensHQ[cont][i].tipoObjeto==1) || (itensHQ[cont][i].tipoObjeto==2)) {
					itensHQ[cont][i].flag=0;
				}
				if (HQativo) {
					if (itensHQ[cont][i].tipoObjeto==3) {
						itensHQ[cont][i].addEventListener(MouseEvent.MOUSE_DOWN, CenarioFuncDown);
						itensHQ[cont][i].addEventListener(MouseEvent.MOUSE_UP, CenarioFuncUp);
					} else if(itensHQ[cont][i].tipoObjeto==2) {
						itensHQ[cont][i].addEventListener(MouseEvent.MOUSE_DOWN, BalaoFuncDown);
						itensHQ[cont][i].addEventListener(MouseEvent.MOUSE_UP, BalaoFuncUp);
					} else {
						itensHQ[cont][i].addEventListener(MouseEvent.MOUSE_DOWN, ObjetoFuncDown);
						itensHQ[cont][i].addEventListener(MouseEvent.MOUSE_UP, ObjetoFuncUp);
					}
				}
			}
			cont++;
		}
		
		/* Essas funcoes soh pegam as posicoes X e Y e Tipo do posHQ a partir do nome do premio
		 */
		public function getXPremio(premio:String):int {
			for (i = 0; i < 30; i++) {
				if (posHQ[i][0]==premio) {
					return posHQ[i][1];
				}
			}
			return 0;
		}

		public function getYPremio(premio:String):int {
			for (i = 0; i < 30; i++) {
				if (posHQ[i][0]==premio) {
					return posHQ[i][2];
				}
			}
			return 0;
		}

		public function getTipoPremio(premio:String):int {
			for (i = 0; i < 30; i++) {
				if (posHQ[i][0]==premio) {
					return posHQ[i][3];
				}
			}
			return 0;
		}
		
		/* As funcoes ObjetoFuncUp e ObjetoFuncDown tratam o caso do mouse no Objeto normal
		 * e personagem(não Balão, nem Cenario). ele testa com relacao a mascara criada embaixo 
		 * dos HQs. Dessa forma se o objeto estiver no HQ ele deixa lá, senão ele retorna pra
		 * posicao inicial.
		 */

		public function ObjetoFuncUp(e:Event):void {
			e.target.stopDrag();
			if (e.target.hitTestObject(mascara)==false) {
				e.target.x=e.target.inicialx;
				e.target.y=e.target.inicialy;
				if (e.target.tipoObjeto==1) {
					if (e.target.flag) {
						e.target.scaleX/=2;
						e.target.scaleY/=2;
						e.target.flag=0;
					}
				}
			}
		}

		public function ObjetoFuncDown(e:Event):void {
			e.target.startDrag();
			e.target.parent.setChildIndex((e.target as MovieClip), e.target.parent.numChildren - 2);
			if (e.target.tipoObjeto==1) {//PESSOA
				if (! e.target.flag) {
					e.target.scaleX*=2;
					e.target.scaleY*=2;
					e.target.x = e.target.parent.mouseX - e.target.width*0.35;
					e.target.y = e.target.parent.mouseY - e.target.height*0.35;
					e.target.flag=1;
				}
			}
		}
		
		/* As funcoes CenarioFuncUp e CenarioFuncDown tratam o caso do mouse nos Cenarios.
		 * ele testa com relacao a mascara criada embaixo dos HQs. Dessa forma se o objeto estiver no HQ 
		 * ele centraliza e arruma para o quadrinho que estiver mais perto, senão ele retorna para a
		 * posicao inicial.
		 *
		 * Os testes de que quadrinho será colocado o objeto sao com relacao a moldura do HQ, entao cuidado
		 * para modificar a moldura.
		 */

		function CenarioFuncDown(e:Event):void {
			e.target.startDrag();
			e.target.parent.setChildIndex((e.target as MovieClip), e.target.parent.numChildren - 2);
			e.target.width=260;
			e.target.height=147;
		}

		function CenarioFuncUp(e:Event):void {
			//LADO ESQUERDO
			e.target.stopDrag();

			if (e.target.hitTestObject(mascara)==false) {
				e.target.x=e.target.inicialx;
				e.target.y=e.target.inicialy;
				e.target.width=74.4;
				e.target.height=41.4;
			} else {
				e.target.parent.setChildIndex((e.target as MovieClip), 2);
				if (e.target.x <= (molduraDoHQ.width/2 + 203.9)) {
					if (e.target.y <= (molduraDoHQ.height/2 - 77 + 87.95)) {
						e.target.x=348.3;
						e.target.y=178.65;
					} else if (e.target.y <= (molduraDoHQ.height/2 + 77 + 87.95)) {
						e.target.x=348.3;
						e.target.y=331.65;
					} else if (e.target.y > (molduraDoHQ.height/2 + 77 + 87.95)) {
						e.target.x=348.3;
						e.target.y=480.65;
					}
					// LADO DIREITO
				} else if (e.target.x > (molduraDoHQ.width/2 + 203.9)) {
					if (e.target.y <= (molduraDoHQ.height/2 - 77 + 87.95)) {
						e.target.x=620.3;
						e.target.y=178.65;
					} else if (e.target.y <= (molduraDoHQ.height/2 + 77 + 87.95)) {
						e.target.x=620.3;
						e.target.y=331.65;
					} else if (e.target.y > (molduraDoHQ.height/2 + 77 + 87.95)) {
						e.target.x=620.3;
						e.target.y=480.65;
					}
				}
			}
		}
		
		/* ShowHQ coloca todo o HQ na tela usando addChild qdo o jogador entra no HQ.
		 * Essa funcao é chamada no frame em que ficar o HQ. Logo no começo.
		 * A funcao OrderItens ajusta os itens que estao já nos quadrinhos pelo setChildIndex
		 * para qdo o item for recolocado os cenarios nao ficarem em cima dos itens.
		 */
		
		public function showHQ(pai:*):void {
			pai.addChild(mascara);
			pai.addChild(molduraDoHQ);
			pai.addChild(fimDoHQ);
			pai.addChild(relevo);
			pai.addChild(textoBalao);
			if(!HQativo) {
				pai.addChild(hqtexto);
			}
			for(var i = 0; i < cont; i++) {
				for(var j = 0; j < 6; j++) {
					pai.addChild(itensHQ[i][j]);
				}
			}
			OrderHQItens(pai);
		}
		
		private function OrderHQItens(pai:*):void {
			for(var i = 0; i < cont; i++) {
				for(var j = 0; j < 6; j++) {
					if(itensHQ[i][j].tipoObjeto == 3) {
						pai.setChildIndex(itensHQ[i][j], 2);
					}
				}
			}
			pai.setChildIndex(mascara, 0);
			pai.setChildIndex(relevo, 1);
			pai.setChildIndex(molduraDoHQ, 3);
			pai.setChildIndex(fimDoHQ, pai.numChildren - 2);
		}
		
		/* hideHQ tira todos os itens do HQ da tela.
		 * Essa funcao é chamada nos botoes de saida do HQ, help do HQ, imprimirHQ para apagar
		 * tudo da tela antes de voltar para o jogo.
		 */
		
		public function hideHQ(pai:*):void {
			for(var i = 0; i < cont; i++) {
				for(var j = 0; j < 6; j++) {
					pai.removeChild(itensHQ[i][j]);
				}
			}
			if(!HQativo) {
				pai.removeChild(hqtexto);
			}
			pai.removeChild(relevo);
			pai.removeChild(mascara);
			pai.removeChild(molduraDoHQ);
			pai.removeChild(fimDoHQ);
			pai.removeChild(textoBalao);
		}
		
		
		/* ShowItem é uma funcao que terá que ser mudada para cada jogo.
		 * Ela é reponsável por fazer o item aparecer na tela de feedback cada vez o jogador
		 * acerta uma questao, informando que item o jogador ganhou.
		 * Então conforme o jogo é uma posicao que vc quer colocar os itens.
		 * Eles estão dividos por tipo de item. E são idenpendentes da matriz ItensHQ.
		 */
		 
		public function showItem(pai:*, premio:String):void {
			var classDefinition:Object=getDefinitionByName(premio+"Class");
			var whiteBox:Shape = new Shape();
			whiteBox.graphics.beginFill(0xFFFFFF); 
			whiteBox.graphics.drawRect(0, 0, 100,100);
			whiteBox.graphics.endFill();  
			
			
			var item:Object = new classDefinition();
			item.scaleX *= 1.5;
			item.scaleY *= 1.5;
			item.tipoObjeto = getTipoPremio(premio);
			whiteBox.width = item.width + 20;
			whiteBox.height = item.height + 20;
			if(item.tipoObjeto == 3) { // cenario
				item.x = 537.3;
				item.y = 367.4;
				whiteBox.x = item.x - 10 - item.width/2;
				whiteBox.y = item.y - 10 - item.height/2;
			}
			if(item.tipoObjeto == 1) { // pessoas
				item.x = 493.5;
				item.y = 330.4;
				whiteBox.x = item.x - 10;
				whiteBox.y = item.y - 10;
			}
			if(item.tipoObjeto == 0) {
				item.x = 499.35;
				item.y = 339.1;
				whiteBox.x = item.x - 10;
				whiteBox.y = item.y - 10;
			}
			if(item.tipoObjeto == 2) { // Baloes
				item.x = 490.05;
				item.y = 346.3;
				whiteBox.x = item.x - 10;
				whiteBox.y = item.y - 10;
			}
			pai.addChild(whiteBox);
			pai.addChild(item);
		}
		
		/* Essa funcao ajusta somente os itens que estao no HQ para ser impressos.
		 * Essa funcao tem que ser chamada em outro frame, em branco.
		 * Os itens sao deslocados para ficarem exatamente na pagina de impressao.
		 */
		
		public function printShowHQ(pai:*):void {
			for(var i = 0; i < cont; i++) {
				for(var j = 0; j < 6; j++) {
					if((itensHQ[i][j].x != itensHQ[i][j].inicialx) && (itensHQ[i][j].y != itensHQ[i][j].inicialy)) {
						itensHQ[i][j].x -= 175;
						pai.addChild(itensHQ[i][j]);
					}
				}
			}
			fimDoHQ.x -= 175;
			pai.addChild(fimDoHQ);
			printOrderHQItens(pai);
		}
		
		private function printOrderHQItens(pai:*):void {
			for(var i = 0; i < cont; i++) {
				for(var j = 0; j < 6; j++) {
					if((itensHQ[i][j].x != itensHQ[i][j].inicialx) && (itensHQ[i][j].y != itensHQ[i][j].inicialy)) {
						if(itensHQ[i][j].tipoObjeto == 3) {
							pai.setChildIndex(itensHQ[i][j], 2);
						}
					}
				}
			}
			pai.setChildIndex(fimDoHQ, pai.numChildren - 2);
		}
		
		/* Ao contrario da funcao printShowHQ, essa reajusta os itens para o HQ novamente
		 * caso o jogador decida voltar e refazer o HQ.
		 */
		
		public function printHideHQ(pai:*):void {
			fimDoHQ.x += 175;
			pai.removeChild(fimDoHQ);
			for(var i = 0; i < cont; i++) {
				for(var j = 0; j < 6; j++) {
					if((itensHQ[i][j].x != itensHQ[i][j].inicialx) && (itensHQ[i][j].y != itensHQ[i][j].inicialy)) {
						itensHQ[i][j].x += 175;
						pai.removeChild(itensHQ[i][j]);
					}
				}
			}
		}
		
		/* Até o jogador ganhar um item de cada personagem os itens não são liberados
		 * para uso. Simplesmente não são colocados os EventListeners.
		 * Essa funcao ativa o Boolean HQativo e coloca os EventListeners de todos os itens
		 * que já existem na matriz. Os novos itens o proprio addItem coloca os Listeners.
		 */
		
		public function ativaHQ():void {
			HQativo = true;
			for (var i = 0; i < cont; i++) {
				for (var j = 0; j < 6; j++) {
					if (itensHQ[i][j].tipoObjeto==3) {
						itensHQ[i][j].addEventListener(MouseEvent.MOUSE_DOWN, CenarioFuncDown);
						itensHQ[i][j].addEventListener(MouseEvent.MOUSE_UP, CenarioFuncUp);
					} else if(itensHQ[i][j].tipoObjeto==2) {
						itensHQ[i][j].addEventListener(MouseEvent.MOUSE_DOWN, BalaoFuncDown);
						itensHQ[i][j].addEventListener(MouseEvent.MOUSE_UP, BalaoFuncUp);
					} else {
						itensHQ[i][j].addEventListener(MouseEvent.MOUSE_DOWN, ObjetoFuncDown);
						itensHQ[i][j].addEventListener(MouseEvent.MOUSE_UP, ObjetoFuncUp);
					}
				}
			}
		}
		
		public function getHQativo():Boolean {
			return HQativo;
		}
		
		/* O tratamento dos Baloes eh feito pelas funcoes abaixo.
		 * Como era de se esperar eh bem mais embaçado.
		 * ele testa se o item é um TextField pois o jogador tem q clicar no TextField do Balao
		 * que cobre 95% do balao, então não ha problemas.
		 *
		 * Juntamente com as funcoes de Down e Up tem as funcoes de Over e Out.
		 * Qdo o mouse esta em cima do balao no hq, vc pode escrever a msg que deseja
		 * no quadro que aparecer. ballonResize é usado para mudar o tamanho do balao.
		 */
		 
		public function BalaoFuncDown(e:Event):void {
			if(e.target.toString() == "[object TextField]") {
				e.target.parent.startDrag();
				e.target.parent.parent.setChildIndex((e.target.parent as MovieClip), e.target.parent.parent.numChildren - 2);
				ballonResize(e.target.parent, 2);
				e.target.parent.x = e.target.parent.parent.mouseX - e.target.parent.width*0.5;
				e.target.parent.y = e.target.parent.parent.mouseY - e.target.parent.height*0.5;
				textoBalao.visible = false;
			}
		}
		
		public function BalaoFuncUp(e:Event):void {
			if(e.target.toString() == "[object TextField]") {
				e.target.parent.stopDrag();
				if (e.target.parent.hitTestObject(mascara)==false) {
					e.target.parent.x=e.target.parent.inicialx;
					e.target.parent.y=e.target.parent.inicialy;
					ballonResize(e.target.parent, 0.5);
					e.target.parent.removeEventListener(MouseEvent.MOUSE_OVER, BalaoFuncOver);
					e.target.parent.removeEventListener(MouseEvent.MOUSE_OUT, BalaoFuncOut);
					textoBalao.visible = false;
				} else {
					e.target.parent.addEventListener(MouseEvent.MOUSE_OVER, BalaoFuncOver);
					e.target.parent.addEventListener(MouseEvent.MOUSE_OUT, BalaoFuncOut);
					textoBalao.visible = true;
					setMaxChars(e.target.parent);
					e.target.parent.parent.parent.focus = textoBalao;
					textoBalao.setSelection(0, textoBalao.text.length);
				}
			}
		}
		
		public function BalaoFuncOver(e:MouseEvent):void {
			if(e.target.toString() == "[object TextField]") {
				textoBalao.visible = true;
				setMaxChars(e.target.parent);
				textoBalao.text = e.target.text;
				e.target.parent.parent.parent.focus = textoBalao;
				e.target.setTextFormat(textoBalaoDentroFormat);
				textoBalao.setSelection(0, textoBalao.text.length);
			}
		}
		
		public function BalaoFuncOut(e:MouseEvent):void {
			textoBalao.visible = false;
			e.target.text = textoBalao.text;
			if(e.target.toString() == "[object TextField]")
				e.target.setTextFormat(textoBalaoDentroFormat);
			textoBalao.text = "Escreva aqui";
		}
		
		public function ballonResize(mc:MovieClip, tam:Number):void {
			if((mc.width < 55 && tam > 1) || (mc.width > 55 && tam < 1)) {
				mc.scaleX *= tam;
				mc.scaleY *= tam;
			}
		}
		
		public function setMaxChars(mc:MovieClip):void {
			if(mc.toString() == "[object narradorBalaoClass]") {
				textoBalao.maxChars = 60;
			} else {
				textoBalao.maxChars = 30;
			}
		}								
		
		/* Essa funcao serve para ativar todo o HQ sem ter q responder nenhuma questao.
		 * Otima para testar o HQ dentro do jogo. Tem que ajustar para cada jogo, pois
		 * o nome dos premios mudam.
		 */
		
		public function testarHQ():void {
			 addItemHQ("falaBalao");
			 addItemHQ("gritoBalao");
			 addItemHQ("musicaBalao");
			 addItemHQ("narradorBalao");
			 addItemHQ("pensamentoBalao");
			 addItemHQ("bumBalao");
			 addItemHQ("fireworksBalao");
			 addItemHQ("powBalao");
			 addItemHQ("shitBalao");
			 addItemHQ("smackBalao");
			 addItemHQ("bau");
			 addItemHQ("envelope");
			 addItemHQ("ipod");
			 addItemHQ("pasta");
			 addItemHQ("presente");
			 addItemHQ("cegoaderaldo");
			 addItemHQ("chiquinha");
			 addItemHQ("donajosefa");
			 addItemHQ("donamaria");
			 addItemHQ("joaquimbugre");
			 addItemHQ("mundinho");
			 addItemHQ("padre");
			 addItemHQ("seoraimundo");
			 addItemHQ("zepretinho");
			 addItemHQ("zita");
			 addItemHQ("cozinha");
			 addItemHQ("quarto");
			 addItemHQ("sala");
			 addItemHQ("terreiro");
			 addItemHQ("varanda");
		}
	}
}