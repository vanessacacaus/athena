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
	 * Classe Utils
	 *
	 * @author Bruno Milare
	 * @date 19/06/2009
	 */
	public class Utils {

		public static var beginTags:Array = new Array(20);
		public static var endTags:Array = new Array(20);
		public static var typeTags:Array = new Array(20);
		public static var nTags = 0;
		public static var charsWasted = 0;
		

		public static function temImagem(texto:String):Boolean {
			if (texto.indexOf("#img")!=-1) {
				return true;
			}
			return false;
		}

		public static function textoTirandoImagem(texto:String):String {
			if (texto.indexOf("#img")!=-1) {
				var pos=texto.indexOf("#img");
				return texto.substring(0, pos);
			}
			return texto;
		}


		public static function textoTirandoTags(texto:String):String {
			var begin = 0;
			
			while ((texto.indexOf("#b#")!=-1) || (texto.indexOf("#i#")!=-1)){
				if(texto.indexOf("#b#")!=-1){
					texto = texto.replace("#b#","");
					texto = texto.replace("#!b#","");
				}
				
				if(texto.indexOf("#i#",begin)!=-1){
					texto = texto.replace("#i#","");
					texto = texto.replace("#!i#","");
				}
			}
			
			return texto;
		}
		
		public static function dumpTags(){
			
			for(var i=0; i< Utils.nTags; i++){
				trace(i + ".Tipo: " + Utils.typeTags[i]+ " Comeca em: " +Utils.beginTags[i] + " e termina em: " + Utils.endTags[i] ); 
			}
			
		}
		
		public static function searchTags(texto):void{
			
			Utils.nTags = 0;
			Utils.charsWasted = 0;
			
			var begin = 0;
			var openTagSize = 3;
			var closeTagSize  = 4;
			
			
			while ((texto.indexOf("#b#",begin)!=-1) || (texto.indexOf("#i#",begin)!=-1)){
				if(texto.indexOf("#b#",begin)!=-1){
					Utils.beginTags[Utils.nTags] = texto.indexOf("#b#",begin) - Utils.charsWasted;
					Utils.charsWasted += openTagSize;
					Utils.endTags[Utils.nTags] = texto.indexOf("#!b#",Utils.beginTags[Utils.nTags]) - Utils.charsWasted;
					Utils.charsWasted += closeTagSize;
					Utils.typeTags[Utils.nTags] = "bold";
					trace("Achou " + (Utils.nTags + 1) +" tags" );
					
					begin = texto.indexOf("#b#",begin) + 3;
					Utils.nTags++;
				}
				
				if(texto.indexOf("#i#",begin)!=-1){
					Utils.beginTags[Utils.nTags] = texto.indexOf("#i#",begin) - Utils.charsWasted;
					Utils.charsWasted += openTagSize;
					Utils.endTags[Utils.nTags] = texto.indexOf("#!i#",Utils.beginTags[Utils.nTags]) - Utils.charsWasted;
					Utils.charsWasted += closeTagSize;
					Utils.typeTags[Utils.nTags] = "italic";
					trace("Achou " + (Utils.nTags + 1) +" tags" );
					
					begin = texto.indexOf("#i#",begin) + 3;
					Utils.nTags++;
				}
			}
			
			
			Utils.dumpTags();
		}
		
		public static function setTextFormat( campo:* ){
			
			var txtFormatBold:TextFormat = new TextFormat();
			var txtFormatItalic:TextFormat = new TextFormat();
			
			txtFormatBold.bold = true;
			txtFormatItalic.italic = true;
			
			for(var i=0; i<Utils.nTags; i++){
				if(Utils.typeTags[i] == "bold"){
					campo.setTextFormat(txtFormatBold, Utils.beginTags[i], Utils.endTags[i]);
				}
				else if(Utils.typeTags[i] == "italic"){
					campo.setTextFormat(txtFormatItalic, Utils.beginTags[i], Utils.endTags[i]);
				}
			}
		}
		
		
		public static function getCaminhoImagem(texto:String):String {
			if (texto.indexOf("#img")!=-1) {
				var begin=texto.indexOf("#img")+5;
				var end=texto.indexOf("#",begin);
				return texto.substring(begin, end);
			}
			return texto;
		}


		public static function carregaImagemComFundoPreto(texto:String, btnAtivar:*, mcParent:*):Boolean {
			
			var mc = new MovieClip();
			var loader = new Loader();
			var btnFechar = new CloseButton();
			var imgDisp:Bitmap = new Bitmap();
			var classDefinition:Object = getDefinitionByName(Utils.getCaminhoImagem(texto));
			var img:BitmapData = new classDefinition(1,1);
			
			
			mc = new MovieClip();
			mc.graphics.beginFill(0x000000,0.8);
			mc.graphics.drawRect(0, 0,800, 600);
			mc.graphics.endFill();
			mc.x=0;
			mc.y=0;
			mc.visible=false;
			
			imgDisp.bitmapData = img;
			btnFechar.x=750;
			btnFechar.y=50;
			imgDisp.x = 400 - imgDisp.width/2;
			imgDisp.y = 300 - imgDisp.height/2;
			
			mc.addChild(imgDisp);
			mc.addChild(btnFechar);
			
			/*for (var i:uint = 0; i < mcParent.numChildren; i++) {
				trace('\t|\t ' +i+'.\t name:' + mcParent.getChildAt(i).name + '\t type:' + typeof (mcParent.getChildAt(i))+ '\t' + mcParent.getChildAt(i));
			}*/

			mcParent.addChild(mc);
			btnAtivar.addEventListener(MouseEvent.CLICK,  function(e:Event){mc.visible = true;});
			btnFechar.addEventListener(MouseEvent.CLICK, function(e:Event){mc.visible = false;});
			mc.addEventListener(MouseEvent.CLICK, function(e:Event){mc.visible = false;});
			mcParent.addEventListener(KeyboardEvent.KEY_DOWN, function(e:Event){if(mc.visible == true){mc.visible = false;}
																									  
		});

		return true;
	}


		public static function carregaTextoComFundoPreto(texto:String, btnAtivar:*, mcParent:*):Boolean {
			
			var mc = new MovieClip();
			var btnFechar = new CloseButton();
			var txtField:TextField = new TextField();
			var offset:int = 30;
			
			var format:TextFormat = new TextFormat();
            format.size = 14;
			format.font = "Verdana"
			
			txtField.defaultTextFormat = format;
			txtField.embedFonts = true;
			txtField.antiAliasType = flash.text.AntiAliasType.ADVANCED;

			txtField.htmlText = texto;
			
			txtField.width=400;
			txtField.height=450;
			
			txtField.y = 50 + offset;
			txtField.x = 150 + offset;
			
			
			txtField.multiline=true;
			txtField.wordWrap=true;
			
			setTextFormat(txtField);
			
			mc = new MovieClip();
			
			mc.graphics.beginFill(0x000000,0.8);
			mc.graphics.drawRect(0, 0,800, 600);
			mc.graphics.endFill();
			
			mc.graphics.beginFill(0xFFFFFF,1.0);
			mc.graphics.drawRect( 150 , 50, txtField.width+(2*offset), txtField.height+offset);
			mc.graphics.endFill();
			
			mc.x=0;
			mc.y=0;
			mc.visible=false;
			
			btnFechar.x=750;
			btnFechar.y=50;
			
			mc.addChild(txtField);
			mc.addChild(btnFechar);
			
			
			mcParent.addChild(mc);
			btnAtivar.addEventListener(MouseEvent.CLICK,  function(e:Event){mc.visible = true;});
			btnFechar.addEventListener(MouseEvent.CLICK, function(e:Event){mc.visible = false;});
			mc.addEventListener(MouseEvent.CLICK, function(e:Event){mc.visible = false;});
			mcParent.addEventListener(KeyboardEvent.KEY_DOWN, function(e:Event){if(mc.visible == true){mc.visible = false;}
																									  
		});

		return true;
	}



	public static function trataTexto(texto:String, campo:*, botaoAtivar:*, pai:*):void {


		trace("Desabilita 2:"+campo);

		if(campo == "tr"){
			trace("vai texto");
			if(texto != ""){
				botaoAtivar.visible=true;
				//texto = checkAndSetBold(texto);
				//texto = textoTirandoTags(texto);
				searchTags(texto);
				texto = textoTirandoTags(texto);
				Utils.carregaTextoComFundoPreto(texto, botaoAtivar, pai);
			}
		}
		else if (Utils.temImagem(texto)==true) {

			texto = Utils.textoTirandoImagem(texto);
			botaoAtivar.visible=true;
			//texto = textoTirandoTags(texto);
			//texto = checkAndSetBold(texto);
			searchTags(texto);
			texto = textoTirandoTags(texto);
			campo.text= texto;
			Utils.carregaImagemComFundoPreto(texto, botaoAtivar, pai);
			setTextFormat(campo);


		} else {
			
			botaoAtivar.visible=false;
			searchTags(texto);
			texto = textoTirandoTags(texto);
			campo.text = texto;
			setTextFormat(campo);
			

		}

	}

	public static function estaNaTela(obj:*, range_esq:int, range_dir:int):Boolean {
		return ((obj.x < range_esq)&&(obj.x > range_dir))?true:false;
	}


	public static function verificaAparicao(obj:*, range_esq:int, range_dir:int) {


		var checaBtn:Timer=new Timer(30);
		checaBtn.addEventListener(TimerEvent.TIMER, function (e:TimerEvent){
		if(Utils.estaNaTela(obj,range_esq,range_dir) == false){
		obj.tabEnabled = false;
	}
	else{
	obj.tabEnabled = true;
}
//trace("Checando Porta... obj.x:"+ obj.x+" ta na tela: "+Utils.estaNaTela(obj,range_esq,740));
});

checaBtn.start();
}

}
}