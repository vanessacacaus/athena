package {

	/**
	 * Classe Acessibilidade
	 *
	 * @author Bruno Milare
	 * @date 09/08/2009	 
	 */	
	
	public class Acessibilidade {
		
		static public function setTabIndex( ... args ){
			habilitaAcessibilidade(args);
			for(var i=0; i < args.length; i++){
				
				args[i].tabIndex = i+1;
				args[i].focusRect = true;
			}
		}
		
		static public function desabilitaTab( ... args ){
			for(var i=0; i < args.length; i++){
				args[i].tabEnabled = false;
			}
		}
		
		static public function habilitaTab( ... args ){
			for(var i=0; i < args.length; i++){
				args[i].tabEnabled = true;
				args[i].focusRect = true;
			}
		}

		static public function desabilitaBotoes( ... args ){
			for(var i=0; i < args.length; i++){
				args[i].enabled = false;
			}
		}
		
		static public function habilitaBotoes( ... args ){
			for(var i=0; i < args.length; i++){
				args[i].enabled = true;
			}
		}
		
		
		static public function habilitaAcessibilidade( ... args ){
			for(var i=0; i < args.length; i++){
				//args[i].enableAcessibility();
			}
		}
		
		
		
		
		
	}
}