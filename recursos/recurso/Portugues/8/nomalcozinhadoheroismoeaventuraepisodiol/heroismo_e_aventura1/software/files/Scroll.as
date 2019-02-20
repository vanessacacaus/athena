package{
	
	import flash.utils.*;
	import flash.events.*
	
	public class Scroll{
				
		var paraScrollLeft:Boolean;
		var paraScrollRight:Boolean;
		var mTimerLeft:Timer;
		var mTimerRight:Timer;
		var pressRight:Boolean;
		var pressLeft:Boolean;
		var mInstance:int = 0;
		var ultimoCen:int = 1;
		var btnLeft;
		var btnRight;
		
		
		
		
		public function createScroll(pai:*, cenario:int, scrollLeft:*, scrollRight:*, velocidade:int, fundo:*, ... args){
			
			this.paraScrollLeft = new Boolean(true);
			this.paraScrollRight = new Boolean(true);
			this.mTimerLeft = new Timer(50);
			this.mTimerRight = new Timer(50);
			this.pressRight = new Boolean(false);
			this.pressLeft = new Boolean(false);
			
			Maquina.scrollInstances++;
			this.mInstance ++;
		
			this.btnLeft = scrollLeft;
			this.btnRight = scrollRight;
			
			
			/*if(((fundo.x < 400)&&(cenario==1)) || ((fundo.x < 631)&&(cenario==2))){
				scrollLeft.visible = false;
			}
			
			if(((fundo.x > 247)&&(cenario==1)) || ((fundo.x  > 281)&&(cenario==2))){
				scrollRight.visible = true;
			}*/
			/*
			function pressButtonUp(event:KeyboardEvent):void {
				 switch (event.keyCode) {
				  case 37 : //ESQUERDA;
				   pressLeft = false;
				   break;
				  case 39 : //DIREITA;
				   pressRight = false;
				   break;
				 }
			}
			
			function pressButtonDown(event:KeyboardEvent):void {
				switch (event.keyCode) {
				  case 37 : //ESQUERDA;
				   teclaParaEsq()
				   pressLeft = true;
				   break;

				  case 39 : //DIREITA;
				   teclaParaDir()
				   pressRight = true;
				   break;
				   

				   
				 }
			}
			
			
			function teclaParaEsq(){
					if(((fundo.x < 400)&&(cenario==1)) || ((fundo.x < 631)&&(cenario==2))){
					scrollRight.visible = true;
					fundo.x += velocidade;
					for(var i=0; i < args.length; i++){
						args[i].x += velocidade;
					}
					
				}
				else{
					scrollLeft.visible = false;
					this.paraScrollLeft = true;
				}
			}
				
				
				
			function teclaParaDir(){
				if(((fundo.x > 247)&&(cenario==1)) || ((fundo.x  > 281)&&(cenario==2))){
					
					scrollLeft.visible = true;
					fundo.x -= velocidade;
					for(var i=0; i < args.length; i++){
							args[i].x -= velocidade;
						}
				}else{
					scrollRight.visible = false;
					this.paraScrollRight = true;
				}
				
			}
			
			pai.addEventListener(KeyboardEvent.KEY_DOWN, pressButtonDown);
			pai.addEventListener(KeyboardEvent.KEY_UP, pressButtonUp);
			*/
			
			scrollLeft.addEventListener(MouseEvent.ROLL_OUT, function(e:Event){this.paraScrollLeft=true;});
			scrollRight.addEventListener(MouseEvent.ROLL_OUT, function(e:Event){this.paraScrollRight=true;});
			
			scrollLeft.addEventListener(MouseEvent.ROLL_OVER, function(e:Event){trace("Instance n: "+ mInstance); this.paraScrollLeft=false;});
			scrollRight.addEventListener(MouseEvent.ROLL_OVER, function(e:Event){trace("Instance n: "+ mInstance); this.paraScrollRight=false;});
			
			scrollLeft.addEventListener(MouseEvent.CLICK, function(e:Event){trace("Instance n: "+ mInstance); this.paraScrollLeft=false;});
			scrollRight.addEventListener(MouseEvent.CLICK, function(e:Event){trace("Instance n: "+ mInstance); this.paraScrollRight=false;});
			
			scrollLeft.addEventListener(KeyboardEvent.KEY_UP, function(e:Event){this.paraScrollLeft=true;});
			scrollRight.addEventListener(KeyboardEvent.KEY_UP, function(e:Event){this.paraScrollRight=true;});
			
			
			
			if(this.ultimoCen != cenario){
				tiraListeners();
				this.ultimoCen = cenario;
				trace("mudou cenario");
			}
			
			this.mTimerLeft.addEventListener("timer", function(e:Event){
																	if(this.paraScrollLeft == false){
																		//trace("Esquerda -> fundo.x / width: " + fundo.x + " / "+fundo.width +" pos:"+ (fundo.x + 400));
																			if(((fundo.x < 400)&&(cenario==1)) || ((fundo.x < 631)&&(cenario==2))){
																			scrollRight.visible = true;
																			fundo.x += velocidade;
																			for(var i=0; i < args.length; i++){
																				args[i].x += velocidade;
																			}
																		}
																		else{
																			//trace("Esquerda -> fim - fundo.x / width: "+ fundo.x +" / "+fundo.width+fundo.width +" pos:"+ (fundo.x - (fundo.width/2)));
																			scrollLeft.visible = false;
																			this.paraScrollLeft = true;
																		}
																	}
																	
																});
			
			this.mTimerLeft.start();
			
			this.mTimerRight.addEventListener("timer", function (e:Event){ 
																		if(this.paraScrollRight == false){
																			if(((fundo.x > 247)&&(cenario==1)) || ((fundo.x  > 281)&&(cenario==2))){
																				//trace("Direita <- fundo.x / width: " + fundo.x +" / "+fundo.width+fundo.width +" pos:"+ (fundo.x - (fundo.width/2)));
																				scrollLeft.visible = true;
																				fundo.x -= velocidade;
																				for(var i=0; i < args.length; i++){
																						args[i].x -= velocidade;
																					}
																			}else{
																				//trace("Direita <- fim - fundo.x / width: "+ fundo.x +" / "+fundo.width+fundo.width +" pos:"+ (fundo.x - (fundo.width/2)));
																				(cenario == 1) ? scrollRight.visible = true : scrollRight.visible = false;
																				this.paraScrollRight = true;
																				}
																		}
																															
																	});
			
			this.mTimerRight.start();
						
			
			
		}		
		
		public function getUltimoCen():int{
			return this.ultimoCen;
		}
		
		static public function limitePorta(fundo:*, cenario:int):Boolean{
			
			if(cenario == 1)
				return (fundo.x <= 247)? true : false;
			else
				return (fundo.x >= 630)? true : false;
		}
		
		
		public function tiraListeners(){

				
				//this.btnRight.removeEventListener(MouseEvent.MOUSE_OVER,over);
				//this.btnRight.removeEventListener(MouseEvent.MOUSE_OUT,over);
				
				//this.btnLeft.removeEventListener(MouseEvent.MOUSE_OVER,over);
				//this.btnLeft.removeEventListener(MouseEvent.MOUSE_OUT,over);
				
				//this.pai.removeEventListener(KeyboardEvent.KEY_DOWN,over);
				//this.pai.removeEventListener(KeyboardEvent.KEY_UP,over);
				
				//this.mTimerLeft.removeEventListener("timer",over);
				//this.mTimerRight.removeEventListener("time",over);
				
				//this.mTimerLeft.reset();
				//this.mTimerRight.reset();
				
				this.paraScrollLeft=true;
				this.paraScrollRight=true;
				
				this.mTimerLeft.stop();
				this.mTimerRight.stop();
				
				
				//trace("listeners were removed");
				//trace("mTimerLeft: " + this.mTimerLeft.hasEventListener(TimerEvent.TIMER));
				//trace("mTimerRight: " + this.mTimerLeft.hasEventListener("timer"));
			
			
			function over(e:MouseEvent) {
				//trace("mTimerLeft: " + this.mTimerLeft.hasEventListener(TimerEvent.TIMER));
				//trace("mTimerRight: " + this.mTimerLeft.hasEventListener("timer"));
				tiraListeners();
			}
			
			
		
		}
		
		public function estaInstanciado():int{ return this.mInstance; }
		
		public function getInstance():void{ trace("Quem: "+ this); }
		
		//public function timersRodando():Boolean{ return (this.mTimerRight.running() & this.mTimerLeft.running()); }
		
		
		
		
	}
	
}