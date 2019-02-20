package caca.eventos {
    import flash.events.Event;
    
    public class EventoFrases extends Event
    {
//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
 
        
        
//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
        
        public static const DEFAULT_NAME:String = "eventos.EventoFrases";
        
        // event constants
        public static const SELECAO_FRASE:String = "onSelecaoFrase";
        
        public var params:Object;
        
//- CONSTRUCTOR -------------------------------------------------------------------------------------------
    
        public function EventoFrases($type:String, $params:Object, $bubbles:Boolean = false, $cancelable:Boolean = false)
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
            return new EventoFrases(type, this.params, bubbles, cancelable);
        }
        
        public override function toString():String
        {
            return formatToString("EventoFrases", "params", "type", "bubbles", "cancelable");
        }
    
//- END CLASS ---------------------------------------------------------------------------------------------
    }
}