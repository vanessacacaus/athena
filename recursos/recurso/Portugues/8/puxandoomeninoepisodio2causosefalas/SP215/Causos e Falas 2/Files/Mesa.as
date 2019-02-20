package {

	import flash.utils.getDefinitionByName;
	import flash.events.*;
	import flash.display.MovieClip;

	
	public class Mesa {
		
		/*
		 * Variáveis Login
		 */
	
		 private var _indicePremios:Array;
		 private var _premiosGanhos:Array;
		// public var _infoPremio:Array = new Array(30);
		 private var _premiosNaTela:Array = new Array(30);
		 private var mascara:mascaraPrato = new mascaraPrato();
		 private var maskCopo:mascaraCopo = new mascaraCopo();
		 private var telaPC:pratoConcluido = new pratoConcluido();
		 private var liqAtual = -1;
		 private var lastLiq;
		 public var comidas:Array = new Array(30);
		 private var sucoAtual;
		 private var aval_comidas:Array = new Array(30);
		 private var comidasNoPrato:Array = new Array(7);
		 
		public function Mesa(indicePremios:Array, premiosGanhos:Array){ 
			this._indicePremios = indicePremios;
			this._premiosGanhos = premiosGanhos;
			mascara.x = 244.9;
			mascara.y = 350.75;
			mascara.alpha = 0.00;
			mascara.visible = false;
			maskCopo.x = 548;
			maskCopo.y = 355;
			maskCopo.alpha = 0.00;
			maskCopo.visible = false;			
			
/*			_premiosGanhos[0] = 1;
			_premiosGanhos[5] = 1;
			_premiosGanhos[10] = 1;
			_premiosGanhos[15] = 1;
			_premiosGanhos[20] = 1;
			_premiosGanhos[25] = 1;*/
			/*
		 _infoPremio[0] = ["buchada_de_bode",230, 113.3];
		 _infoPremio[1] = ["pinicado_de_arroz",126.6, 165.3];
		 _infoPremio[2] = ["baião_de_dois",318.1, 225.3];
		 _infoPremio[3] = ["galinha_ao_molho_pardo",330.5, 107.6];
		 _infoPremio[4] = ["leitoa",338.3, 156.1];
		 _infoPremio[5] = ["alface",593.4, 159.8];
		 _infoPremio[6] = ["tomate",658.3, 110.1];
		 _infoPremio[7] = ["pepino",585.5, 114.5];
		 _infoPremio[8] = ["cenoura", 507.8, 109.8];
		 _infoPremio[9] = ["batata", 504.3, 156.7];
		 _infoPremio[10] = ["azeitonas", 404.8, 248.1];
		 _infoPremio[11] = ["queijo", 415.8, 152.2];
		 _infoPremio[12] = ["linguiça", 228.3, 163.8];
		 _infoPremio[13] = ["castanha_de_caju", 410, 198.25];
		 _infoPremio[14] = ["amendoim", 416.9, 112.95];
		 _infoPremio[15] = ["arroz",133.7, 112.2];
		 _infoPremio[16] = ["feijão", 117.3, 222.3];
		 _infoPremio[17] = ["angu",218.1, 224];
		 _infoPremio[18] = ["macarrão",205.8, 285.2];
		 _infoPremio[19] = ["farofa",108.1, 274.25];
		 _infoPremio[20] = ["suco_de_laranja", 662.5, 223.6];
		 _infoPremio[21] = ["suco_de_pitanga", 700.0, 215.55];
		 _infoPremio[22] = ["suco_de_uva", 788, 216.85];
		 _infoPremio[23] = ["suco_de_abacaxi", 606.6, 212.85];
		 _infoPremio[24] = ["água", 542.8, 221.6];
		 _infoPremio[25] = ["doce_de_leite",667.8, 158.35];
		 _infoPremio[26] = ["gelatina", 560.4, 194.65];
		 _infoPremio[27] = ["goiabada_com_queijo", 489.6, 204.35];
		 _infoPremio[28] = ["cocada", 694, 199];
		 _infoPremio[29] = ["ambrosia", 621.8, 210.25];
		 */
		}
		
		
		public function getCoomidas(){
			this.comidas;
		}
		
		public function keepPos(){

					for(var j=0; j < this.comidas.length; j++){
						trace(this.comidas[j].description + "  " + Maquina.infoPremio[(this.comidas[j].description)][2]);
						
						Maquina.infoPremio[this.comidas[j].description][1] = this.comidas[j].x;
						Maquina.infoPremio[this.comidas[j].description][2] = this.comidas[j].y;
					}
					

		}
		
		public function drawComidas(pai:*):void{
			
			for(var i =0; i<30; i++){
				if(this._premiosGanhos[i] == 1){
					var classDefinition:Object = getDefinitionByName(Maquina.infoPremio[i][0]+"_class");
					var comidaAtual = new classDefinition();
					comidaAtual.x = Maquina.infoPremio[i][1];
					comidaAtual.inicialx = comidaAtual.x;
					comidaAtual.y = Maquina.infoPremio[i][2];
					comidaAtual.inicialy = comidaAtual.y;
					comidaAtual.name = Maquina.infoPremio[i][0];
					comidaAtual.description = i;
					// nao eh liq
					if((comidaAtual.name.indexOf("suco") != -1) || (comidaAtual.name.indexOf("água") != -1)){
						comidaAtual.addEventListener(MouseEvent.CLICK, ObjetoSucoDown);

					} //liq
					else{
						comidaAtual.addEventListener(MouseEvent.MOUSE_DOWN, ObjetoFuncDown);
						comidaAtual.addEventListener(MouseEvent.MOUSE_UP, ObjetoFuncUp);
					}
					
					this.comidas[i] = comidaAtual;
					trace("add: "+comidaAtual.name);
					pai.addChild(comidaAtual);
					pai.setChildIndex(comidaAtual, pai.numChildren - 1);
					this._premiosNaTela[i] = comidaAtual;
				}
			}
			pai.addChild(maskCopo);
			pai.addChild(mascara);
			
		}
		
		
		public function cleanComidas(pai:*):void{
			
			for(var i =0; i< 30; i++){
				if(this._premiosGanhos[i] == 1){
					pai.removeChild(this._premiosNaTela[i]);
				}
			}
			if(lastLiq != null){
				pai.removeChild(lastLiq);
			}
		}
		
		
		public function ObjetoSucoDown(e:MouseEvent):void {
			
			// se for liquido
			var i;
			if((e.target.name.indexOf("suco") != -1) || (e.target.name.indexOf("água") != -1)){
				trace("Líquido");
					var classDefinition:Object = getDefinitionByName("copo_" + e.target.name);
					var liquido = new classDefinition();
					liquido.x = 547.4;
					liquido.y = 392.1;
					liquido.width = 73.9;
					liquido.height = 84.5;
					
					if(liqAtual != -1){
						i = liqAtual;
						this.comidas[i].x = Maquina.infoPremio[i][1];
						this.comidas[i].y = Maquina.infoPremio[i][2];
						this.comidas[i].visible = true;
						MovieClip(e.target.parent).removeChild(lastLiq);
					}
					MovieClip(e.target.parent).addChild(liquido);
				
					lastLiq = liquido;
					liqAtual = e.target.description;
					Maquina.comidasNoPrato[Maquina.infoPremio[liqAtual][3]] = true;
					e.target.visible = false;
					e.target.parent.setChildIndex((e.target as MovieClip), e.target.parent.numChildren - 2);
					e.target.parent.setChildIndex(liquido, e.target.parent.numChildren - 3);
					VerificaPratoConcluido(e.target.parent);
			}
		}
		
		public function imprimePrato(){
			// fazer hit test mascara e comidas
			// se sim adiciona no mc
			for(var j=0; j < this.comidas.length; j++){
				if (this.comidas[j].hitTestObject(mascara)==true) {
					
				}
			}
			
			
		}
		
		public function ObjetoFuncUp(e:MouseEvent):void {
			
			e.target.stopDrag();
			
			trace(Maquina.infoPremio[e.target.description][0]);
			
			if (e.target.hitTestObject(mascara)==false) {
				e.target.x=Maquina.originalPos[e.target.description][1];
				e.target.y=Maquina.originalPos[e.target.description][2];
			}else{
				trace("indx "+e.target.name);
				Maquina.comidasNoPrato[Maquina.infoPremio[e.target.description][3]] = true;
			}
			Maquina.infoPremio[e.target.description][1] = e.target.x;
			Maquina.infoPremio[e.target.description][2] =  e.target.y;
			VerificaPratoConcluido(e.target.parent);
		}

		public function ObjetoFuncDown(e:MouseEvent):void {
			e.target.startDrag();
			e.target.parent.setChildIndex((e.target as MovieClip), e.target.parent.numChildren - 2);
			trace("pos inicial"+e.target.x+", "+e.target.description+","+e.target.name);
		}
		
		private function VerificaPratoConcluido(pai:*):void {
			if (!Maquina.comidasNoPrato[0]) {
				for (var i=1; i<7; i++) {
					if (!Maquina.comidasNoPrato[i])
						return;
				}
				Maquina.comidasNoPrato[0] = true;

				telaPC.x = 400;
				telaPC.y = 300;
				pai.addChild(telaPC);
			}
		}
		
	}
}