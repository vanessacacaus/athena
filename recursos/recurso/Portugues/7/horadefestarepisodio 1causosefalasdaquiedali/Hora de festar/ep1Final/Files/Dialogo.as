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
		
		public static function exibir(pai:*, questaoAtual:Questao):void{
			
			var mcFundo = new Fundo();
			var btnProx = new NextDiag();
			var btnAnt = new PrevDiag();
			var mcBalloon = new BalloonLeft();
			var contPers = 0;
			var cont = 0;
			var flag = 0;
			
			var personagemUm;
			var nomeUm;
			var personagemDois;
			var nomeDois;
			var doisAtivo:Boolean = false;
			
			mcFundo.visible = true;
			
			var txtdialogo = new TextField();
			var format:TextFormat = new TextFormat();
			format.color = 0xFFFFFF;
			format.font = "Bookman Old Style";
			format.size = 18;
			
			btnProx.x = 412;
			btnAnt.x = 371;
			btnProx.y = 566;
			btnAnt.y = 565;
			btnAnt.visible = false;
			txtdialogo.width = 400;
			txtdialogo.htmlText = true;
			txtdialogo.wordWrap = true;
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
				personagemUm.y = 315;
					
				txtdialogo.text =  questaoAtual.getDialogo().getUmTexto(cont);
				Utils.searchTags(txtdialogo.text);
				txtdialogo.text = Utils.textoTirandoTags(txtdialogo.text);
				Utils.setTextFormat(txtdialogo);
				
				while(txtdialogo.textHeight > 270) {
					if(txtdialogo.width == 700)
						break;
					txtdialogo.width += 50;
					trace("texto "+txtdialogo.textHeight);
				}
				
				
				if(questaoAtual.getDialogo().getPersDialogo(cont) == nomeUm){
					txtdialogo.y = personagemUm.y - txtdialogo.height - personagemUm.height/(8);
					txtdialogo.x = personagemUm.x;
				}
			
				if(nomeDois != "Vazio"){
					personagemDois.x = 580;
					personagemDois.y = 315;
					txtdialogo.text =  questaoAtual.getDialogo().getUmTexto(cont);
					Utils.searchTags(txtdialogo.text);
					txtdialogo.text = Utils.textoTirandoTags(txtdialogo.text);
					Utils.setTextFormat(txtdialogo);
							
					if(questaoAtual.getDialogo().getPersDialogo(cont) == nomeDois){
						flag = 1;
						txtdialogo.y = personagemDois.y - txtdialogo.height - personagemDois.height/(7.5);
						txtdialogo.x = personagemDois.x - txtdialogo.width + personagemDois.width*0.85;
					}
				}
				mcBalloon.x = txtdialogo.x - 30;
				mcBalloon.y = txtdialogo.y - 30;
				mcBalloon.width = txtdialogo.width + 60;
				mcBalloon.height = txtdialogo.height + 90;
				if(flag) {
					mcBalloon.scaleX *= -1;
					mcBalloon.x += mcBalloon.width;
					flag = 0;
				}
				else if(mcBalloon.scaleX < 0)
					mcBalloon.scaleX *= -1;
				
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