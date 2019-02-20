package{
	import flash.events.*
	import flash.net.*
	
	/**
	 * Classe BaseDados
	 *
	 * @author Bruno Milare
	 * @date 22/04/2009
	 */
	public class Database{
		
	private var _numWords:int = 10;
	private static var _words:Array = new Array(4);
	
	public static function loadDb(){
		loadWords();
	}
	
	public static function getWords(i:Number):XML{
		return new XML(_words[i]);
	}
	
	public static function loadWords(){
			_words[0] = (<![CDATA[
				<words>
					<word> 
						<subindex>1</subindex> 
						<lin>1</lin> 
						<col>9</col> 
						<orient>H</orient>  
						<question>Esse remédio é "mais ruim" que o outro.</question> 
						<answer>PIOR</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>4</lin> 
						<col>6</col> 
						<orient>H</orient>  
						<question>Li essa "notiça" no jornal.</question> 
						<answer>NOTÍCIA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>3</subindex> 
						<lin>9</lin> 
						<col>1</col> 
						<orient>H</orient>  
						<question>Comi um sanduíche de "mortandela".</question> 
						<answer>MORTADELA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>4</subindex> 
						<lin>12</lin> 
						<col>3</col> 
						<orient>H</orient>  
						<question>Deixa esse trabalho pra "mim" fazer.</question> 
						<answer>EU</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>5</subindex> 
						<lin>9</lin> 
						<col>1</col> 
						<orient>V</orient>  
						<question>Tem "menas" gente do que eu pensava.</question> 
						<answer>MENOS</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>6</subindex> 
						<lin>3</lin> 
						<col>2</col> 
						<orient>V</orient>  
						<question>Preciso acender uma vela.Você tem uma caixa de "fósfo"? </question> 
						<answer>FÓSFORO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>9</lin> 
						<col>4</col> 
						<orient>V</orient>  
						<question>Traz a "tauba" de carne.</question> 
						<answer>TÁBUA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>8</subindex> 
						<lin>3</lin> 
						<col>7</col> 
						<orient>V</orient>  
						<question>Que "barboleta" bonita!</question> 
						<answer>BORBOLETA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>1</lin> 
						<col>9</col> 
						<orient>V</orient>  
						<question>Chama a "poliça"!</question> 
						<answer>POLÍCIA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>0</lin> 
						<col>11</col> 
						<orient>V</orient>  
						<question>A gente "fomos" de trem.</question> 
						<answer>FOI</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
				</words>
			]]> ).toString();
			
			_words[1] = (<![CDATA[
				<words>
					<word> 
						<subindex>1</subindex> 
						<lin>2</lin> 
						<col>2</col> 
						<orient>H</orient>  
						<question>Quer que eu "compro" o almoço?</question> 
						<answer>COMPRE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>2</subindex> 
						<lin>4</lin> 
						<col>6</col> 
						<orient>H</orient>  
						<question>Você quer que eu "faço" isso para você?</question> 
						<answer>FAÇA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>3</subindex> 
						<lin>7</lin> 
						<col>5</col> 
						<orient>H</orient>  
						<question>Nós não "vai" mais.</question> 
						<answer>VAMOS</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>4</subindex> 
						<lin>11</lin> 
						<col>6</col> 
						<orient>H</orient>  
						<question>Aconteceu um "estrupo" naquela rua escura.</question> 
						<answer>ESTUPRO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>5</subindex> 
						<lin>1</lin> 
						<col>3</col> 
						<orient>V</orient> 
						<question>A roupa não "cabeu" em mim.</question> 
						<answer>COUBE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>6</subindex> 
						<lin>0</lin> 
						<col>7</col> 
						<orient>V</orient> 
						<question>"Chegou" as encomendas.</question> 
						<answer>CHEGARAM</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>9</lin> 
						<col>7</col> 
						<orient>V</orient> 
						<question>Nós "se" encontramos na festa.</question> 
						<answer>NOS</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>8</subindex> 
						<lin>7</lin> 
						<col>9</col> 
						<orient>V</orient> 
						<question>O povo "sumiram" depois da chuva.</question> 
						<answer>SUMIU</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>11</lin> 
						<col>10</col> 
						<orient>V</orient> 
						<question>Já "ponhei" tudo no lugar.</question> 
						<answer>PUS</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>9</lin> 
						<col>11</col> 
						<orient>V</orient> 
						<question>Ele disse pra você "vim" hoje.</question> 
						<answer>VIR</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
				</words>
			]]> ).toString();
			
			_words[2] = (<![CDATA[
				<words>
					<word> 
						<subindex>1</subindex> 
						<lin>1</lin> 
						<col>9</col> 
						<orient>H</orient> 
						<question>Tem "menas" gente do que eu pensava.</question> 
						<answer>MENOS</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>2</subindex> 
						<lin>7</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>Outro dia "encontremo" com eles.</question> 
						<answer>ENCONTRAMOS</answer>
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>3</subindex> 
						<lin>11</lin> 
						<col>6</col> 
						<orient>H</orient> 
						<question>Fiquei com muita pena daquele "mendingo".</question> 
						<answer>MENDIGO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>4</subindex> 
						<lin>13</lin> 
						<col>3</col> 
						<orient>H</orient> 
						<question>Traz a "tauba" de carne.</question> 
						<answer>TÁBUA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>5</subindex> 
						<lin>1</lin> 
						<col>1</col> 
						<orient>V</orient> 
						<question>Que "barboleta" bonita!</question> 
						<answer>BORBOLETA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>6</subindex> 
						<lin>3</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>Preciso acender uma vela.Você tem uma caixa de "fósfo"? </question> 
						<answer>FÓSFORO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>5</lin> 
						<col>7</col> 
						<orient>V</orient> 
						<question>Comi um sanduíche de "mortandela".</question> 
						<answer>MORTADELA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>8</subindex> 
						<lin>7</lin> 
						<col>9</col> 
						<orient>V</orient> 
						<question>Eu "se" enganei.</question> 
						<answer>ME</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>1</lin> 
						<col>10</col> 
						<orient>V</orient> 
						<question>Aconteceu um "estrupo" naquela rua escura.</question> 
						<answer>ESTUPRO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>9</lin> 
						<col>12</col> 
						<orient>V</orient> 
						<question>Esse remédio é "mais ruim" que o outro.</question> 
						<answer>PIOR</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
				</words>
			]]> ).toString();
			
			_words[3] = (<![CDATA[
				<words>
					<word> 
						<subindex>1</subindex> 
						<lin>2</lin> 
						<col>9</col> 
						<orient>H</orient> 
						<question>O carro deu "perca" total.</question> 
						<answer>PERDA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>2</subindex> 
						<lin>6</lin> 
						<col>5</col> 
						<orient>H</orient> 
						<question>Eu não "alembrava" dele.</question> 
						<answer>LEMBRAVA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>3</subindex> 
						<lin>8</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>Chama a "poliça"!</question> 
						<answer>POLÍCIA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>4</subindex> 
						<lin>9</lin> 
						<col>6</col> 
						<orient>H</orient> 
						<question>A casa dele é "mais grande" que a minha.</question> 
						<answer>MAIOR</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>5</subindex> 
						<lin>11</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>Nós não "vai" mais.</question> 
						<answer>VAMOS</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>6</subindex> 
						<lin>7</lin> 
						<col>1</col> 
						<orient>V</orient>  
						<question>A gente "fomos" de trem.</question> 
						<answer>FOI</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>5</lin> 
						<col>3</col> 
						<orient>V</orient>  
						<question>Li essa "notiça" no jornal.</question> 
						<answer>NOTÍCIA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>8</subindex> 
						<lin>5</lin> 
						<col>6</col> 
						<orient>V</orient>  
						<question>Epa! "Peguemo" o ônibus errado.</question> 
						<answer>PEGAMOS</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>0</lin> 
						<col>10</col> 
						<orient>V</orient>  
						<question>"Chegou" as encomendas.</question> 
						<answer>CHEGARAM</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>5</lin> 
						<col>12</col> 
						<orient>V</orient>  
						<question>Ela tem medo de "largatixa".</question> 
						<answer>LAGARTIXA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
				</words>
			]]> ).toString();
		}	
	}
}