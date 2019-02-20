package{
	
	import flash.utils.*;
	import flash.events.*
	
	public class Scroll{
				
		var paraScrollLeft:Boolean = true;
		var paraScrollRight:Boolean = true;
		var mTimerLeft:Timer = new Timer(30);
		var mTimerRight:Timer = new Timer(30);
		
		public function startTimer(){
			this.mTimerLeft.start();
			this.mTimerRight.start();
			
		}
		
		public function stopTimer(){
			this.mTimerLeft.stop();
			this.mTimerRight.stop();
			
		}
		
		public function Scroll(scrollLeft:*, scrollRight:*, velocidade:int, fundo:*, ... args){
			
			if(fundo.x >= 0){
				scrollLeft.visible = false;
			}
			
			if((fundo.x + fundo.width - 830) <= 0){
				scrollRight.visible = true;
			}
			
			scrollLeft.addEventListener(MouseEvent.MOUSE_OUT, function(e:Event){this.paraScrollLeft=true;
																			   if(fundo.x < 0){
																					//scrollRight.visible = true;
																					fundo.x += velocidade;
																					for(var i=0; i < args.length; i++){
																						args[i].x += velocidade;
																					}
																				}
																				else{
																					scrollLeft.visible = false;
																					this.paraScrollLeft = true;
																				}
																			   
																			   });
			scrollRight.addEventListener(MouseEvent.MOUSE_OUT, function(e:Event){this.paraScrollRight=true;
																				if((fundo.x + fundo.width - 830) > 0){
																				
																						//scrollLeft.visible = true;
																						fundo.x -= velocidade;
																						for(var i=0; i < args.length; i++){
																								args[i].x -= velocidade;
																							}
																				}else{
																					scrollRight.visible = false;
																					this.paraScrollRight = true;
																				}
																				});
			
			scrollLeft.addEventListener(MouseEvent.MOUSE_OVER, function(e:Event){this.paraScrollLeft=false;
																				
																				if(fundo.x < 0){
																					//scrollRight.visible = true;
																					fundo.x += velocidade;
																					for(var i=0; i < args.length; i++){
																						args[i].x += velocidade;
																					}
																				}
																				else{
																					scrollLeft.visible = false;
																					this.paraScrollLeft = true;
																				}});
			
			
			
			scrollRight.addEventListener(MouseEvent.MOUSE_OVER, function(e:Event){this.paraScrollRight=false;
																				 
																				 if((fundo.x + fundo.width - 830) > 0){
																				
																						//scrollLeft.visible = true;
																						fundo.x -= velocidade;
																						for(var i=0; i < args.length; i++){
																								args[i].x -= velocidade;
																							}
																				}else{
																					scrollRight.visible = false;
																					this.paraScrollRight = true;
																				}});
			
			this.mTimerLeft.addEventListener("timer", function(e:Event){
																	if(this.paraScrollLeft == false){
																			if(fundo.x < 0){
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
																	
																	
																	
																	   });
			
			
			
			this.mTimerRight.addEventListener("timer", function (e:Event){
																		if(this.paraScrollRight == false){
																			if((fundo.x + fundo.width - 830) > 0){
																				
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
																		
																		
																		
																	});
			
			
						
			
			
		}
		
			
			
			//l:515, r:285
			
			
		
	}
	
}