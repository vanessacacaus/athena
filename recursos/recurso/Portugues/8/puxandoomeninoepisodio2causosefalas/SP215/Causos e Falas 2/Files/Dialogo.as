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
	 * Classe Dialogo
	 *
	 * @author Bruno Milare
	 * @date 22/04/2009
	 */
	public class Dialogo {
		private var numDialogos:int;
		private var dialogos:Array = new Array();
		private var personagemDiag:Array = new Array();
		private var numPersonagens:Array = new Array();
		private var contra:String;
		
		public function Dialogo( ndiags:int, diags:Array, pers:Array, contracena:String){
			this.numDialogos = ndiags;
			this.dialogos = diags;
			this.personagemDiag = pers;
			this.contra = contracena;
		}
		
		public function getUmTexto(i:int):String{
			return this.dialogos[i];
		}
		
		public function getPersDialogo(i:int):String{
			return this.personagemDiag[i];
		}
		
		public function getTodosTextos(){
			return this.dialogos;
		}
		
		public function getNumTextos():int{
			return this.numDialogos;
		}
		
		public function getContra():String{
			return this.contra;
		}
		
		public function getNumPersonagens():int{
			var pers1:String;
			var primeira:Boolean = true;
			
			for each  (var  pers:String  in this.personagemDiag)  {
				if(primeira == true){
					pers1 = pers;					
					primeira = false;
				}
				else{
					if(pers != primeira){
					   return 2;
					}
				}
				
			}
			return 1;
		}
		public static function exibirPerguntador(pai:*, questaoAtual:Questao, posX:int, posY:int):void{
			
			var pers = "";
			var persNumber = questaoAtual.getDialogo().getNumTextos()-1;
			pers = questaoAtual.getDialogo().getPersDialogo(persNumber);
			var classDefinition:Object;
			
			if(posX < 300){
				classDefinition = getDefinitionByName(pers+"DiagEsq");
			}
			else {
				classDefinition = getDefinitionByName(pers+"DiagDir");
			}
			var personagemPerguntador = new classDefinition();
			
			personagemPerguntador.x = posX;
			personagemPerguntador.y = posY;
			
			pai.addChild(personagemPerguntador);
			
		}
		
		public static function removerPerguntador(pai:*,questaoAtual:Questao){
			
			var pers = "";
			var persNumber = questaoAtual.getDialogo().getNumTextos()-1;
			pers = questaoAtual.getDialogo().getPersDialogo(persNumber);
			
			var diplayObjCont:* = pai;
			
			for(var i:int = 0; i < diplayObjCont.numChildren; i++)
		   	{
				if(diplayObjCont.getChildAt(i).toString().indexOf(pers) != -1){
					pai.removeChild(diplayObjCont.getChildAt(i));
				}
		   	}

		}
		
		public static function exibir(pai:*, questaoAtual:Questao):void{
			
			var mcFundo = new Fundo();
			var btnProx = new NextDiag();
			var btnAnt = new PrevDiag();
			var mcBalloon = new Balloon();
			var contPers = 0;
			var cont = 0;
			
			var personagemUm;
			var nomeUm;
			var personagemDois;
			var nomeDois;
			var doisAtivo:Boolean = false;
			
			mcFundo.visible = true;
			
			var txtdialogo = new TextField();
			var format:TextFormat = new TextFormat();
			format.color = 0xFFFFFF;
			format.font = "Papyrus";
			format.size = 18;
			
			btnProx.x = 753;
			btnAnt.x = 707;
			btnProx.y = 560;
			btnAnt.y = 560;
			txtdialogo.width = 600;
			txtdialogo.defaultTextFormat = format;
			txtdialogo.autoSize = TextFieldAutoSize.LEFT;
			
			mcFundo.addChild(btnAnt);
			mcFundo.addChild(btnProx);
			
			
			definePersonagens();
			carregaPersonagens(cont);
			
			
			btnProx.addEventListener(MouseEvent.CLICK, function(e:Event){
				
				if(cont < questaoAtual.getDialogo().getNumTextos()-1){
					cont++;
					mcFundo.removeChild(mcBalloon);
					carregaPersonagens();
					btnAnt.visible = true;
				}
				else{
					pai.removeChild(mcFundo);
					
				}
				if(cont == 0){
					btnAnt.visible = false;
				}

			});
			
			
			btnAnt.addEventListener(MouseEvent.CLICK,function(e:Event){
				if(cont>0){
				cont--;
				mcFundo.removeChild(mcBalloon);
				carregaPersonagens();
				}
				if(cont == 0){
					btnAnt.visible = false;
					}
					trace(cont);
			});


			function definePersonagens(){
				
				var pers1 = "";
				pers1 = questaoAtual.getDialogo().getPersDialogo(cont);
				var classDefinition:Object = getDefinitionByName(pers1+"DiagEsq");
				personagemUm = new classDefinition();
				nomeUm = questaoAtual.getDialogo().getPersDialogo(cont);
				
				
				var pers2 = "";
				pers2 = questaoAtual.getDialogo().getContra();
				trace(pers1 + " contracendo com " +pers2);
				var classname = "";
				
				if(pers2 != "Vazio"){
					classname = pers2+"DiagDir";
					var classDefinition2:Object = getDefinitionByName(classname);
					personagemDois = new classDefinition2();
				}else{
					classname = "Vazio";
				}
				nomeDois = pers2;
					
				
				
				
			}
			
			
			function carregaPersonagens(){
				
				
				personagemUm.x = 40;
				personagemUm.y = 300;
					
				txtdialogo.text =  questaoAtual.getDialogo().getUmTexto(cont);
							
				if(questaoAtual.getDialogo().getPersDialogo(cont) == nomeUm){
					txtdialogo.y = personagemUm.y - txtdialogo.height - personagemUm.height/5 ;
					txtdialogo.x = personagemUm.x + personagemUm.width/2 ;
				}
			
				if(nomeDois != "Vazio"){
					personagemDois.x = 580;
					personagemDois.y = 300;
					
					txtdialogo.text =   questaoAtual.getDialogo().getUmTexto(cont);
							
					if(questaoAtual.getDialogo().getPersDialogo(cont) == nomeDois){
						txtdialogo.y = personagemDois.y - txtdialogo.height - personagemDois.height/6;
						txtdialogo.x = personagemDois.x - txtdialogo.width + personagemDois.width/2 ;
					}
				}
				
				mcBalloon.x = txtdialogo.x - 20;
				mcBalloon.y = txtdialogo.y - 20;
				mcBalloon.width = txtdialogo.width +40;
				mcBalloon.height = txtdialogo.height + 80;
				
				trace(txtdialogo.width+ ","+txtdialogo.height);
			
				
				if(contPers == 0){
					mcFundo.addChild(personagemUm);
					if(nomeDois != "Vazio"){
						mcFundo.addChild(personagemDois);
						doisAtivo = true;
					}
					
					contPers = 1;
				}
				
				mcFundo.addChild(mcBalloon);
				mcFundo.addChild(txtdialogo);
				
				
			}
			pai.addChild(mcFundo);
			
		}
		
		
		
		

		
		
	}
	
}