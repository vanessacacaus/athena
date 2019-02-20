package {
	/**
	 * Classe Jogo
	 *
	 * @author Bruno Milare
	 * @date 23/03/2010
	 */
	public class Jogo {

		private var ajuda:String;
		private var intro:Array;
		

		public function Jogo(a:String, i:Array) {
				this.ajuda = a;
				this.intro = i;
		}


		public function getIntro(i:int):String { return this.intro[i]; }
		
		public function getAjuda():String {	return this.ajuda; }

	}
}