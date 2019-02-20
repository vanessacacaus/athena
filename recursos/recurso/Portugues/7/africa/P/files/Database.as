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
	private static var _words:Array = new Array(5);
	
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
						<lin>2</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>Um tipo de vespa cuja ferroada é muito dolorosa.</question> 
						<answer>MARIMBONDO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>5</lin> 
						<col>7</col> 
						<orient>H</orient> 
						<question>Doce amarelo a base de ovos e côco.</question> 
						<answer>QUINDIM</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>3</subindex> 
						<lin>8</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>Interjeição equivalente a "já era!", "acabou!".</question> 
						<answer>BABAU</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>10</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>Não é cigarro nem charuto mas serve para fumar.</question> 
						<answer>CACHIMBO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>13</lin> 
						<col>7</col> 
						<orient>H</orient> 
						<question>Bebida destilada feita de cana de açúcar.</question> 
						<answer>CACHAÇA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>6</subindex> 
						<lin>0</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>Produto de contrabando.</question> 
						<answer>MUAMBA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>7</subindex> 
						<lin>7</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>Suco da cana-de-açúcar.</question> 
						<answer>GARAPA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>8</subindex> 
						<lin>0</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>Mercadinho de verduras, frutas e legumes.</question> 
						<answer>QUITANDA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>9</subindex> 
						<lin>1</lin> 
						<col>7</col> 
						<orient>V</orient> 
						<question>Um sinônimo de menino.</question> 
						<answer>MOLEQUE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>5</lin> 
						<col>13</col> 
						<orient>V</orient> 
						<question>Sovina, mão de vaca, pão duro.</question> 
						<answer>MUQUIRANA</answer> 
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
						<col>1</col> 
						<orient>H</orient> 
						<question>Mercadinho de verduras, frutas e legumes.</question> 
						<answer>QUITANDA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>2</subindex> 
						<lin>6</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>Objeto usado para autenticar documentos.</question> 
						<answer>CARIMBO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>3</subindex> 
						<lin>7</lin> 
						<col>7</col> 
						<orient>H</orient> 
						<question>Mau cheiro, fedor.</question> 
						<answer>CATINGA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>9</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>Polenta mole.</question> 
						<answer>ANGU</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>5</subindex> 
						<lin>11</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>Como fica aquele que perde os dentes.</question> 
						<answer>BANGUELA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>6</subindex> 
						<lin>8</lin> 
						<col>1</col> 
						<orient>V</orient> 
						<question>Xingamento sinônimo de chato, bobo, mané.</question> 
						<answer>BABACA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>1</lin> 
						<col>3</col> 
						<orient>V</orient> 
						<question>Insultar, ofender com palavras.</question> 
						<answer>XINGAR</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>8</subindex> 
						<lin>5</lin> 
						<col>7</col> 
						<orient>V</orient> 
						<question>Tirar uma soneca.</question> 
						<answer>COCHILAR</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>3</lin> 
						<col>10</col> 
						<orient>V</orient> 
						<question>Não é cigarro nem charuto mas serve para fumar.</question> 
						<answer>CACHIMBO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>6</lin> 
						<col>13</col> 
						<orient>V</orient> 
						<question>Carinho que se faz na cabeça de alguém.</question> 
						<answer>CAFUNÉ</answer> 
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
						<col>5</col> 
						<orient>H</orient> 
						<question>Doença que ataca as parótidas.</question> 
						<answer>CAXUMBA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>2</subindex> 
						<lin>6</lin> 
						<col>6</col> 
						<orient>H</orient> 
						<question>Produto de contrabando.</question> 
						<answer>MUAMBA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>3</subindex> 
						<lin>10</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>Interjeição equivalente a "já era!", "acabou!".</question> 
						<answer>BABAU</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>4</subindex> 
						<lin>8</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>Um tipo de vespa cuja ferroada é muito dolorosa.</question> 
						<answer>MARIMBONDO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>5</subindex> 
						<lin>12</lin> 
						<col>3</col> 
						<orient>H</orient> 
						<question>Suco da cana-de-açúcar.</question> 
						<answer>GARAPA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>6</subindex> 
						<lin>3</lin> 
						<col>1</col> 
						<orient>V</orient> 
						<question>Filho mais novo de uma família.</question> 
						<answer>CAÇULA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>7</lin> 
						<col>3</col> 
						<orient>V</orient> 
						<question>Conta colorida usada na confecção de bijuterias.</question> 
						<answer>MIÇANGA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>8</subindex> 
						<lin>0</lin> 
						<col>8</col> 
						<orient>V</orient> 
						<question>Farinha feita à base de milho que se usa para fazer polenta, bolo, angu.</question> 
						<answer>FUBÁ</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>5</lin> 
						<col>8</col> 
						<orient>V</orient> 
						<question>Feitiço.</question> 
						<answer>MANDINGA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>0</lin> 
						<col>11</col> 
						<orient>V</orient> 
						<question>Bebida destilada feita de cana de açúcar.</question> 
						<answer>CACHAÇA</answer> 
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
						<col>7</col> 
						<orient>H</orient> 
						<question>Farinha feita à base de milho que se usa para fazer polenta, bolo, angu.</question> 
						<answer>FUBÁ</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>4</lin> 
						<col>7</col> 
						<orient>H</orient> 
						<question>Estalido com a boca que demonstra insatisfação, decepção.</question> 
						<answer>MUXOXO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>3</subindex> 
						<lin>6</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>Morto-vivo.</question> 
						<answer>ZUMBI</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>4</subindex> 
						<lin>7</lin> 
						<col>5</col> 
						<orient>H</orient> 
						<question>Animal primata, símio</question> 
						<answer>MACACO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>5</subindex> 
						<lin>9</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>Má sorte, azar.</question> 
						<answer>URUCUBACA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>6</subindex> 
						<lin>8</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>Nádegas.</question> 
						<answer>BUNDA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>8</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>Confusão, bagunça.</question> 
						<answer>FUZUÊ</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>8</subindex> 
						<lin>1</lin> 
						<col>5</col> 
						<orient>V</orient> 
						<question>Doce amarelo a base de ovos e côco.</question> 
						<answer>QUINDIM</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>1</lin> 
						<col>8</col> 
						<orient>V</orient> 
						<question>Sovina, mão de vaca, pão duro.</question> 
						<answer>MUQUIRANA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>3</lin> 
						<col>12</col> 
						<orient>V</orient> 
						<question>Vasilha de barro em que se põe água.</question> 
						<answer>MORINGA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
				</words>
			]]> ).toString();
			
			_words[4] = (<![CDATA[
				<words>
					<word> 
						<subindex>1</subindex> 
						<lin>3</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>Lugar muito distante, de difícil acesso.</question> 
						<answer>CAFUNDÓ</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>2</subindex> 
						<lin>5</lin> 
						<col>5</col> 
						<orient>H</orient> 
						<question>Xingamento sinônimo de chato, bobo, mané.</question> 
						<answer>BABACA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>3</subindex> 
						<lin>8</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>Polenta mole.</question> 
						<answer>ANGU</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>4</subindex> 
						<lin>8</lin> 
						<col>8</col> 
						<orient>H</orient> 
						<question>Morto-vivo.</question> 
						<answer>ZUMBI</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>5</subindex> 
						<lin>12</lin> 
						<col>5</col> 
						<orient>H</orient> 
						<question>Má sorte, azar.</question> 
						<answer>URUCUBACA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>6</subindex> 
						<lin>4</lin> 
						<col>1</col> 
						<orient>V</orient> 
						<question>Insultar, ofender com palavras.</question> 
						<answer>XINGAR</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>2</lin> 
						<col>3</col> 
						<orient>V</orient> 
						<question>Feitiço.</question> 
						<answer>MANDINGA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>8</subindex> 
						<lin>1</lin> 
						<col>6</col> 
						<orient>V</orient> 
						<question>Nádegas.</question> 
						<answer>BUNDA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>9</lin> 
						<col>7</col> 
						<orient>V</orient> 
						<question>Confusão, bagunça.</question> 
						<answer>FUZUÊ</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>5</lin> 
						<col>9</col> 
						<orient>V</orient> 
						<question>Filho mais novo de uma família.</question> 
						<answer>CAÇULA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
				</words>
			]]> ).toString(); 
		}	
	}
}