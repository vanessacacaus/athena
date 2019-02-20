package {
	
public class Randomizador {
	
	private var n1:Number;
	private var n2:Number;
	private var n3:Number;
	private var n4:Number;
	private var n5:Number;
	private var resp1:Number;
	private var resp2:Number;
	private var resp3:Number;
	private var resp4:Number;
	private var resp5:Number;
	
	private var ordemPerguntas:Array = new Array();
	private var ordemRespostas:Array = new Array();
	
	public function Randomizador(){
	
	}
	
	private function randRange(min:Number, max:Number){
		var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
	return randomNum;
	}
	
	public function randperg():Array{
	
		n1 = randRange(0, 4);
		n2 = randRange(0, 4);
		while (n2==n1){
			n2 = randRange(0, 4);
		}
		n3 = randRange(0, 4);
		while ((n3==n1)||(n3==n2)){
			n3 = randRange(0, 4);
		}
		n4 = randRange(0, 4);
		while ((n4==n1)||(n4==n2)||(n4==n3)){
			n4 = randRange(0, 4);
		}
		n5 = randRange(0, 4);
		while ((n5==n1)||(n5==n2)||(n5==n3)||(n5==n4)){
			n5 = randRange(0, 4);
		}
		
		this.ordemPerguntas.push(n1);
		this.ordemPerguntas.push(n2);
		this.ordemPerguntas.push(n3);
		this.ordemPerguntas.push(n4);
		this.ordemPerguntas.push(n5);
		
		return this.ordemPerguntas.reverse();
		
	}
	
	public function randresp():Array{
		resp1 = randRange(0, 4);
	
		resp2 = randRange(0, 4);
		while (resp2==resp1){
			resp2 = randRange(0, 4);
		}
	
		resp3 = randRange(0, 4);
		while ((resp3==resp1)||(resp3==resp2)){
			resp3 = randRange(0, 4);
		}
	
		resp4= randRange(0, 4);
		while ((resp4==resp1)||(resp4==resp2)||(resp4==resp3)){
			resp4 = randRange(0, 4);
		}
	
		resp5 = randRange(0, 4);
		while ((resp5==resp1)||(resp5==resp2)||(resp5==resp3)||(resp5==resp4)){
			resp5 = randRange(0, 4);
		}
		
		this.ordemRespostas.push(resp1);
		this.ordemRespostas.push(resp2);
		this.ordemRespostas.push(resp3);
		this.ordemRespostas.push(resp4);
		this.ordemRespostas.push(resp5);
		
		return this.ordemRespostas.reverse();
	}

}
}