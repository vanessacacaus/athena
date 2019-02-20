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
		 
		 public static var gratificacaoPersA:int;
		 public static var gratificacaoPersB:int;
		 public static var gratificacaoPersC:int;
		 public static var gratificacaoPersD:int;
		 public static var gratificacaoPersE:int;
		 public static var gratificacaoPersF:int;
		 
		 
		 public static var scrollCen1:Scroll;
		 public static var scrollCen2:Scroll;

		 public static var scrollInstances;
		 
		 public static var timesHere;
		 
		 public static var cenUmOldPos:int;
		 public static var cenDoisOldPos:int;
		 public static var persUmOldPos:int;
		 public static var persDoisOldPos:int;
		 public static var persTresOldPos:int;
		 public static var persQuatroOldPos:int;
		 public static var persCincoOldPos:int;
		 public static var persSeisOldPos:int;
		 public static var portaUmOldPos:int;
		 
		 public static var trocaCenario:int;
		 
		 public static var liberouP1:Boolean;
		 public static var liberouP2:Boolean;
		 public static var liberouP3:Boolean;
		 public static var liberouP4:Boolean;
		 public static var liberouP5:Boolean;
		 
		 public static var contaZeros:int;
		 public static var priLiberados:int;
		 
		 public static var terminouJogo:Boolean;
		 
	}
}