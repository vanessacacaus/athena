package {
	
public class Randomizador {
	
	private var ordemPerguntas:Array = new Array();
	private var ordemRespostas:Array = new Array();
	
	public function Randomizador(){
	
	}
	
	private function randRange(min:Number, max:Number){
		var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
	return randomNum;
	}
	
	public function randperg():Array{
	
		var perguntas:Array = new Array();
		var n:Number;
		
		for(n = 0; n < Maquina.numPerg; n++)
		{
			perguntas.push(n);
		}

		for(var i:int = 0; i < Maquina.numPerg; i++)
		{
			n = randRange(0, perguntas.length - 1);
			this.ordemPerguntas.push(perguntas[n]);
			perguntas.splice(n,1);
		}
		
		return this.ordemPerguntas;
		
	}
	
	public function randresp():Array{
		
		var respostas:Array = new Array();
		var n:Number;
		
		for(n = 0; n < Maquina.numResp; n++)
		{
			respostas.push(n);
		}

		for(var i:int = 0; i < Maquina.numResp; i++)
		{
			n = randRange(0, respostas.length - 1);
			this.ordemRespostas.push(respostas[n]);
			respostas.splice(n,1);
		}
		
		return this.ordemRespostas;
	}

}
}