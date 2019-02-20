package caca {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import caca.eventos.EventoTela;
	
	public class Ajuda extends MovieClip {
		public function Ajuda() {
			abaObj.tabIndex = 0;
			abaPont.tabIndex = 1;
			abaCtrl.tabIndex = 2;
			btn_fechar.tabIndex = 20;			

			fundo_help.useHandCursor = false;
			obj.gotoAndStop("ativo");
			pont.gotoAndStop("Inativo");
			ctrl.gotoAndStop("Inativo");

			abaObj.addEventListener(MouseEvent.CLICK, objClick);
			abaPont.addEventListener(MouseEvent.CLICK, ptoClick);
			abaCtrl.addEventListener(MouseEvent.CLICK, ctlClick);
			btn_fechar.addEventListener(MouseEvent.CLICK, fecharAjuda);
		}
		

		function objClick(e:MouseEvent) { //trace("obj.aba.OnPress");
			obj.gotoAndStop("ativo");
			pont.gotoAndStop("Inativo");
			ctrl.gotoAndStop("Inativo");
			}
		function ptoClick(e:MouseEvent){ //trace("pont.aba.OnPress");
			obj.gotoAndStop("Inativo");
			pont.gotoAndStop("ativo");
			ctrl.gotoAndStop("Inativo");
			}
		function ctlClick(e:MouseEvent){ //trace("ctrl.aba.OnPress");
			obj.gotoAndStop("Inativo");
			pont.gotoAndStop("Inativo");
			ctrl.gotoAndStop("ativo");
			}
		function fecharAjuda(e:MouseEvent) {
			var evt:EventoTela = new EventoTela(EventoTela.FECHA_TELA, null);
			dispatchEvent(evt);			
			this.parent.removeChild(this);
		}		
	}
}