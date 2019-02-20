package {
	/**
	 * Classe Maquina
	 *
	 * @author Victor Cezar
	 */
	public class Maquina {
		
		 public static var relatorio:Relatorio;
		 public static var login:Login; //login
		 public static var conjquestoes:Array = new Array(); //conjunto de questoes
		 public static var questaoAtual:Questao; //questao atual
		 public static var i:int; //indice questao
		 public static var j:int; //indice questao
		 public static var contadorPersA:int;
		 public static var contadorPersB:int;
		 public static var contadorPersC:int;
		 public static var contadorPersD:int;
		 public static var contadorPersE:int;
	     public static var contadorPersF:int;
		 
		 public static var startFlag:Boolean;
		 public static var fundox:Array = new Array();
		 public static var armario:Armario;
		
		 public static var flagFimParabens:int = 0;
		 
		 public static var scrollCen1:Scroll;
		 public static var scrollCen2:Scroll;

		 
		 public static var trocaCenario:int;
		 
		 public static var liberouP1:Boolean = false;
		 public static var liberouP2:Boolean = false;
		 public static var liberouP3:Boolean = false;
		 public static var liberouP4:Boolean = false;
		 public static var liberouP5:Boolean = false;
		 public static var liberouP6:Boolean = false;
		 
		 public static var terminouJogo:Boolean = false;
		 
		 public static var perdeuJogo:Boolean = false;
		 
		 public static function ganhouJogo():Boolean {
			return (liberouP1 && liberouP2 && liberouP3 && liberouP4 && liberouP5 && liberouP6); 
		 }
	}
}