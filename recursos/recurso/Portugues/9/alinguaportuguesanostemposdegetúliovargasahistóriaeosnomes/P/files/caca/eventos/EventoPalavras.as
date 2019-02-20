package caca.eventos {
    import flash.events.Event;
    
    public class EventoPalavras extends Event
    {
//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
 
        
        
//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
        
        public static const DEFAULT_NAME:String = "eventos.EventoPalavras";
        
        // event constants
        public static const SELECAO_PALAVRA:String = "onSelecaoPalavra";
        
        public var params:Object;
        
//- CONSTRUCTOR -------------------------------------------------------------------------------------------
    
        public function EventoPalavras($type:String, $params:Object, $bubbles:Boolean = false, $cancelable:Boolean = false)
        {
            super($type, $bubbles, $cancelable);
            
            this.params = $params;
        }
        
//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
        
        
        
//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
    
        
    
//- EVENT HANDLERS ----------------------------------------------------------------------------------------
    
        
    
//- GETTERS & SETTERS -------------------------------------------------------------------------------------
    
        
    
//- HELPERS -----------------------------------------------------------------------------------------------
    
        public override function clone():Event
        {
            return new EventoPalavras(type, this.params, bubbles, cancelable);
        }
        
        public override function toString():String
        {
            return formatToString("EventoPalavras", "params", "type", "bubbles", "cancelable");
        }
    
//- END CLASS ---------------------------------------------------------------------------------------------
    }
}