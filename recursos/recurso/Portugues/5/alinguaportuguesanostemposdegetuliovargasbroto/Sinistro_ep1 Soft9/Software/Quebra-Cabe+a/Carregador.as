package {

	import flash.events.*;
	import flash.net.*;

	/**
	 * Classe Carregador
	 *
	 * @author Bruno Milare
	 * @date 25/03/2010
	 */
	public class Carregador {

		public static function carregarDados():Array{
			BaseDados.carrega();
			var questoes:Array = Parseador.defineQuestoes();
			return questoes;
		}
		
		public static function carregarJogo():Jogo{
			return Parseador.defineJogo();
		}
	}
}