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
	private static var _words:Array = new Array(10);
	
	public static function loadDb(){
		loadWords();
	}
	
	public static function getWords(i:Number):XML{
		return new XML(_words[i]);
	}
	
	public static function loadWords(){
		
			_words[0] = 
				<words>
				
					<word> 
						<subindex>1</subindex> 
						<lin>2</lin> 
						<col>5</col> 
						<orient>H</orient> 
						<question>(do inglês) lanche feito com duas fatias de pão e recheio.</question>
						<answer>SANDUÍCHE</answer>			
						<clue>O conjunto dos elementos que compõem uma legislação.</clue>			
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>4</lin> 
						<col>3</col> 
						<orient>H</orient> 
						<question>(do inglês) massa fina enrolada com recheio salgado ou doce. Dica: nos EUA é servida no café da manhã.</question> 
						<answer>PANQUECA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
										
					<word> 
						<subindex>3</subindex> 
						<lin>9</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>(do inglês) nome genérico para programa de computador.</question> 
						<answer>SOFTWARE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>11</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>(do inglês) rede mundial de computadores. Dica: também conhecida como web.</question>
						<answer>INTERNET</answer>
						<clue></clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>13</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>(do espanhol) pedrinha de gelo que cai em forma de chuva.</question> 
						<answer>GRANIZO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
										
					<word> 
						<subindex>6</subindex> 
						<lin>6</lin> 
						<col>0</col> 
						<orient>V</orient> 
						<question>(do inglês) lugar para fazer compras, passear, comer, ir ao cinema.</question> 
						<answer>SHOPPING</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>7</subindex> 
						<lin>4</lin> 
						<col>3</col> 
						<orient>V</orient> 
						<question>(do italiano) espécie de pão com frutas cristalizadas, típico do Natal.</question> 
						<answer>PANETONE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>8</subindex> 
						<lin>2</lin> 
						<col>5</col> 
						<orient>V</orient> 
						<question>(do inglês) jogo de mesa com bolas, taco e caçapa. Dica: sinônimo de bilhar.</question> 
						<answer>SINUCA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>9</subindex> 
						<lin>7</lin> 
						<col>9</col> 
						<orient>V</orient> 
						<question>(do italiano) gênero cantado de música erudita. Dica: Pavarotti é um dos artistas mais conhecidos desse gênero.</question> 
						<answer>ÓPERA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>10</subindex> 
						<lin>0</lin> 
						<col>12</col> 
						<orient>V</orient> 
						<question>(do italiano) cumprimento usado no Brasil para despedidas.</question> 
						<answer>TCHAU</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
				</words>
			.toString(); 
					
			
			_words[1] = 
				<words>
					
					<word> 
						<subindex>1</subindex> 
						<lin>1</lin> 
						<col>5</col> 
						<orient>H</orient> 
						<question>(do inglês) sociedade recreativa, associação.</question> 
						<answer>CLUBE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>3</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>(do inglês) tipo de paletó, feminino ou masculino.</question> 
						<answer>BLAZER</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>3</subindex> 
						<lin>6</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>(do inglês) brilho labial.</question> 
						<answer>GLOSS</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>9</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>(do inglês) criminoso que comete assassinatos em série.</question> 
						<answer>SERIALKILLER</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>0</lin> 
						<col>0</col> 
						<orient>V</orient> 
						<question>(do inglês) teoria científica que propõe uma explicação para a criação do universo.</question> 
						<answer>BIGBANG</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>6</subindex> 
						<lin>5</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>(do francês) casa noturna onde se pode dançar. Dica: discoteca, danceteria.</question> 
						<answer>BOATE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>7</subindex> 
						<lin>1</lin> 
						<col>5</col> 
						<orient>V</orient> 
						<question>(do francês) talão de boletos para pagamento de prestação mensal.</question> 
						<answer>CARNÊ</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>8</subindex> 
						<lin>8</lin> 
						<col>5</col> 
						<orient>V</orient> 
						<question>(do francês) serve bebidas e comidas em bares e restaurantes.</question> 
						<answer>GARÇOM</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>9</subindex> 
						<lin>0</lin> 
						<col>7</col> 
						<orient>V</orient> 
						<question>(do japonês) arte marcial, esporte olímpico. Dica : um conhecido atleta brasileiro dessa modalidade é Aurélio Miguel.</question>			
						<answer>JUDÔ</answer>			
						<clue></clue>			
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>10</subindex> 
						<lin>5</lin> 
						<col>8</col> 
						<orient>V</orient> 
						<question>(do inglês) estiloso, chique, que chama a atenção por estar na moda.</question> 
						<answer>FASHION</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
			</words> .toString(); 
					
					
			_words[2] = 
				<words>
					
					<word> 
						<subindex>1</subindex> 
						<lin>1</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>(do inglês) prática feminina de tirar a parte de cima do biquíni.</question> 
						<answer>TOPLESS</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>3</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>(do inglês) correio eletrônico.</question> 
						<answer>EMAIL</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>3</subindex> 
						<lin>7</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>(do francês) abrigo para carros.</question> 
						<answer>GARAGEM</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>8</lin> 
						<col>7</col> 
						<orient>H</orient> 
						<question>(do italiano) massa redonda assada coberta com molho de tomate e queijo.</question> 
						<answer>PIZZA</answer> 
						<clue></clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>10</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>(do francês) roupa íntima feminina para sustentar os seios.</question> 
						<answer>SUTIÃ</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>6</subindex> 
						<lin>12</lin> 
						<col>4</col> 
						<orient>H</orient> 
						<question>(do francês) onde colocamos as mãos para guiar a bicicleta.</question> 
						<answer>GUIDÃO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>7</subindex> 
						<lin>1</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>(do inglês) set decisivo do jogo de vôlei.</question> 
						<answer>TIEBREAK</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>8</subindex> 
						<lin>6</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>(do inglês) classificação ordenada segundo critérios previamente definidos. Dica: _____ das melhores seleções de futebol do mundo.</question>
						<answer>RANKING</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>9</subindex> 
						<lin>5</lin> 
						<col>7</col> 
						<orient>V</orient> 
						<question>(do inglês) produto para lavar os cabelos.</question> 
						<answer>XAMPU</answer> 
						<clue></clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>10</subindex> 
						<lin>7</lin> 
						<col>11</col> 
						<orient>V</orient> 
						<question>(do francês) peça de roupa usada para nadar.</question> 
						<answer>MAIÔ</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
			</words> .toString(); 
					
					
			_words[3] =  <words>
					
					<word> 
						<subindex>1</subindex> 
						<lin>1</lin> 
						<col>4</col> 
						<orient>H</orient> 
						<question>(do francês) roupa íntima feminina para sustentar os seios.</question> 
						<answer>SUTIÃ</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>4</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>(do inglês) produto para lavar os cabelos.</question> 
						<answer>XAMPU</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>3</subindex> 
						<lin>5</lin> 
						<col>8</col> 
						<orient>H</orient> 
						<question>(do inglês) tipo de paletó, feminino ou masculino.</question> 
						<answer>BLAZER</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>6</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>(do espanhol) pedrinha de gelo que cai em forma de chuva.</question> 
						<answer>GRANIZO</answer> 
						<clue></clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>1</lin> 
						<col>1</col> 
						<orient>V</orient> 
						<question>(do italiano) cumprimento usado no Brasil para despedidas.</question> 
						<answer>TCHAU</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>6</subindex> 
						<lin>6</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>(do inglês) brilho labial.</question>
						<answer>GLOSS</answer>
						<clue></clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>7</subindex> 
						<lin>1</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>(do inglês) jogo de mesa com bolas, taco e caçapa. Dica: sinônimo de bilhar.</question> 
						<answer>SINUCA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>8</subindex> 
						<lin>5</lin> 
						<col>6</col> 
						<orient>V</orient> 
						<question>(do inglês) set decisivo do jogo de vôlei.</question> 
						<answer>TIEBREAK</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>9</subindex> 
						<lin>5</lin> 
						<col>8</col> 
						<orient>V</orient> 
						<question>(do francês) casa noturna onde se pode dançar. Dica: discoteca, danceteria.</question> 
						<answer>BOATE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>10</subindex> 
						<lin>4</lin> 
						<col>10</col> 
						<orient>V</orient> 
						<question>(do inglês) estiloso, chique, que chama a atenção por estar na moda.</question> 
						<answer>FASHION</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
			</words> .toString(); 
			
			_words[4] =  <words>
					
					<word> 
						<subindex>1</subindex> 
						<lin>0</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>(do inglês) lugar para fazer compras, passear, comer, ir ao cinema.</question> 
						<answer>SHOPPING</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>2</lin> 
						<col>4</col> 
						<orient>H</orient> 
						<question>(do inglês) rede mundial de computadores. Dica: também conhecida como web.</question> 
						<answer>INTERNET</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>3</subindex> 
						<lin>4</lin> 
						<col>5</col> 
						<orient>H</orient> 
						<question>(do inglês) prática feminina de tirar a parte de cima do biquíni.</question> 
						<answer>TOPLESS</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>6</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>(do inglês) teoria científica que propõe uma explicação para a criação do universo.</question> 
						<answer>BIGBANG</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>8</lin> 
						<col>8</col> 
						<orient>H</orient> 
						<question>(do inglês) sociedade recreativa, associação.</question> 
						<answer>CLUBE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>6</subindex> 
						<lin>11</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>(do francês) peça de roupa usada para nadar.</question> 
						<answer>MAIÔ</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>7</subindex> 
						<lin>6</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>(do francês) serve bebidas e comidas em bares e restaurantes.</question> 
						<answer>GARÇOM</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>8</subindex> 
						<lin>9</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>(do francês) onde colocamos as mãos para guiar a bicicleta.</question> 
						<answer>GUIDÃO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>9</subindex> 
						<lin>0</lin> 
						<col>5</col> 
						<orient>V</orient> 
						<question>(do italiano) espécie de pão com frutas cristalizadas, típico do Natal.</question> 
						<answer>PANETONE</answer> 
						<clue></clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>10</subindex> 
						<lin>4</lin> 
						<col>10</col> 
						<orient>V</orient> 
						<question>(do inglês) lanche feito com duas fatias de pão e recheio.</question> 
						<answer>SANDUÍCHE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
			</words>.toString(); 
			
			_words[5] = (<![CDATA[  <words>		
								  
					<word>			
						<subindex>1</subindex>			
						<lin>2</lin>			
						<col>2</col>			
						<orient>H</orient>			
						<question>(do inglês) nome genérico para programa de computador.</question>			
						<answer>SOFTWARE</answer>			
						<clue>Mamíferos, aves, répteis, anfíbios e peixes são .........</clue>			
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>					
					</word>
					
					<word>			
						<subindex>2</subindex>			
						<lin>5</lin>			
						<col>2</col>			
						<orient>H</orient>			
						<question>(do inglês) massa fina enrolada com recheio salgado ou doce. Dica: nos EUA é servida no café da manhã.</question> 
						<answer>PANQUECA</answer> 
						<clue>Qual é o nome do autor da obra ‘Os Lusíadas’?</clue> 
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>				
					</word>
					
					<word>			
						<subindex>3</subindex>			
						<lin>8</lin>			
						<col>8</col>			
						<orient>H</orient>			
						<question>(do italiano) massa redonda assada coberta com molho de tomate e queijo.</question> 
						<answer>PIZZA</answer> 
						<clue>Essa é fácil. Pense no início do nome Gândavo.</clue>			
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>						
					</word>
					
					<word>			
						<subindex>4</subindex>			
						<lin>9</lin>			
						<col>0</col>			
						<orient>H</orient>			
						<question>(do francês) talão de boletos para pagamento de prestação mensal.</question> 
						<answer>CARNÊ</answer> 
						<clue>Pense no símbolo do cristianismo.</clue> 
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>						
					</word>
					
					<word>			
						<subindex>5</subindex>			
						<lin>10</lin>			
						<col>5</col>			
						<orient>H</orient>			
						<question>(do inglês) correio eletrônico.</question>			
						<answer>EMAIL</answer>			
						<clue>O conjunto dos elementos que compõem uma legislação.</clue>			
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>				
					</word>
					
					<word>			
						<subindex>6</subindex>			
						<lin>12</lin>			
						<col>7</col>			
						<orient>H</orient>			
						<question>(do francês) abrigo para carros.</question>			
						<answer>GARAGEM</answer>			
						<clue>Uma dica: quanto é 20 - 6?</clue>			
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>						
					</word>
					
					<word>			
						<subindex>7</subindex>			
						<lin>4</lin>			
						<col>3</col>			
						<orient>V</orient>			
						<question>(do inglês) classificação ordenada segundo critérios previamente definidos. Dica: ____ das melhores seleções de futebol do mundo.</question> 
						<answer>RANKING</answer> 
						<clue>Continente colonizado pelos europeus.</clue> 
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>						
					</word>
					
					<word>			
						<subindex>8</subindex>
						<lin>4</lin>
						<col>6</col>
						<orient>V</orient>			
						<question>(do japonês) arte marcial, esporte olímpico. Dica : um conhecido atleta brasileiro dessa modalidade é Aurélio Miguel.</question> 
						<answer>JUDÔ</answer> 
						<clue>Quem casa quer....</clue> 		
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>					
					</word>
					
					<word>			
						<subindex>9</subindex>			
						<lin>1</lin>			
						<col>9</col>			
						<orient>V</orient>			
						<question>(do inglês) criminoso que comete assassinatos em série.</question>			
						<answer>SERIALKILLER</answer>			
						<clue>Qual é o nome dos movimentos militares e também religiosos cujo objetivo era colocar a Terra Santa e Jerusalém sob domínio cristão?</clue>			
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>						
					</word>
					
					<word>			
						<subindex>10</subindex>			
						<lin>4</lin>			
						<col>12</col>			
						<orient>V</orient>			
						<question>(do italiano) gênero cantado de música erudita. Dica: Pavarotti é um dos artistas mais conhecidos desse gênero.</question>			
						<answer>ÓPERA</answer>			
						<clue>Não foi dessa vez!  Gândavo era um viajante.</clue>			
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>						
					</word>
					
			</words>  ]]> ).toString(); 
			
			_words[6] = (<![CDATA[  <words>
					
					<word>
						<subindex>1</subindex>			
						<lin>2</lin>			
						<col>0</col>			
						<orient>V</orient>			
						<question>O relato de _____________ foi publicado em 1576.</question>
						<answer>GANDAVO</answer>
						<clue>Faça um esforço: qual é o nome do autor do texto lido pelo mensageiro do rei?</clue>			
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>						
					</word>
					
					<word>			
						<subindex>2</subindex>			
						<lin>4</lin>			
						<col>2</col>			
						<orient>V</orient>			
						<question>Chamar os índios de ________________é ter uma postura etnocêntrica.</question> 
						<answer>SELVAGENS</answer> 
						<clue>Os europeus se consideravam civilizados.</clue> 		
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>				
					</word>
					
					<word>			
						<subindex>3</subindex>			
						<lin>0</lin>			
						<col>4</col>			
						<orient>V</orient>			
						<question>Muitos nomes de animais e plantas do Brasil são de _________ indígenas.</question> 
						<answer>LINGUAS</answer> 
						<clue>O tupi era uma delas.</clue> 
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>				
					</word>
					
					<word>			
						<subindex>4</subindex>			
						<lin>0</lin>			
						<col>8</col>			
						<orient>V</orient>			
						<question>A relação entre o Estado Português e a ___________ era muito forte no século XVI.</question>			
						<answer>IGRAJACATOLICA</answer>			
						<clue>Instituição chefiada pelo Papa.</clue>			
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>				
					</word>
					
					<word>			
						<subindex>5</subindex>			
						<lin>3</lin>			
						<col>10</col>			
						<orient>V</orient>			
						<question>O _______ era o chefe político dos portugueses.</question> 
						<answer>REI</answer> 
						<clue>Como Pelé é conhecido no futebol?</clue> 			
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>				
					</word>
					
					<word>			
						<subindex>6</subindex>			
						<lin>1</lin>			
						<col>1</col>			
						<orient>H</orient>			
						<question>D. Sebastião também tinha muito interesse nas colônias da __________________.</question> 
						<answer>AFRICA</answer> 
						<clue>Continente colonizado pelos europeus.</clue> 
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>					
					</word>
					
					<word>			
						<subindex>7</subindex>			
						<lin>5</lin>			
						<col>0</col>			
						<orient>H</orient>			
						<question>O rei de Portugal nessa época era _____________.</question> 
						<answer>DSEBASTIAOI</answer> 
						<clue>Vamos lá! Esse rei ficou muito famoso por ter morrido numa batalha.</clue> 
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>						
					</word>
					
					<word>			
						<subindex>8</subindex>			
						<lin>9</lin>			
						<col>7</col>			
						<orient>H</orient>			
						<question>Gândavo descreve a ________, a flora e os aspectos sociais da nova terra.</question> 
						<answer>FAUNA</answer> 
						<clue>Pense no nome do conjunto dos animais.</clue>
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>					
					</word>
					
					<word>			
						<subindex>9</subindex>			
						<lin>9</lin>			
						<col>5</col>			
						<orient>H</orient>			
						<question>Um dos símbolos que indica quem é o rei e a rainha é a __________.</question> 
						<answer>COROA</answer> 
						<clue>Os reis e rainhas usam na cabeça em situações formais.</clue> 		
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>					
					</word>
					
					<word>
						<subindex>10</subindex>			
						<lin>13</lin>			
						<col>7</col>			
						<orient>H</orient>			
						<question>‘Carioca’ quer dizer _________ de branco na língua tupi.</question> 
						<answer>CASA</answer> 
						<clue>Quem casa quer....</clue> 	
						<feedback_right></feedback_right>			
						<feedback_wrong></feedback_wrong>				
					</word>
					
			</words>  ]]> ).toString(); 
			
			_words[7] = (<![CDATA[  <words>
					
					<word> 
						<subindex>1</subindex> 
						<lin>4</lin> 
						<col>1</col> 
						<orient>V</orient> 
						<question>Os índios são descritos de forma ______________ pelo viajante.</question> 
						<answer>EXOTICA</answer> 
						<clue>Um dos sentidos dessa palavra é ‘extravagante’.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>0</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>Gândavo foi _____________ de português e latim.</question> 
						<answer>PROFESSOR</answer> 
						<clue>O dia desse profissional é comemorado em 15 de outubro.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>3</subindex> 
						<lin>1</lin> 
						<col>6</col> 
						<orient>V</orient> 
						<question>O rei de Portugal nessa época era _____________.</question> 
						<answer>DSEBASTIAOI</answer> 
						<clue>Vamos lá! Esse rei ficou muito famoso por ter morrido numa batalha.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>5</lin> 
						<col>9</col> 
						<orient>V</orient> 
						<question>O relato de _____________ foi publicado em 1576.</question>
						<answer>GANDAVO</answer>
						<clue>Faça um esforço: qual é o nome do autor do texto lido pelo mensageiro do rei?</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>0</lin> 
						<col>12</col> 
						<orient>V</orient> 
						<question>Gândavo descreveu um animal que chamou de papa-formigas: o _____.</question> 
						<answer>TAMANDUA</answer> 
						<clue>O ... bandeira está em extinção.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>6</subindex> 
						<lin>2</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>_________ Vaz de Caminha escreveu a Carta do Descobrimento do Brasil para o rei D. Manuel I.</question> 
						<answer>PERO</answer> 
						<clue>‘Mas’ em espanhol é....</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>7</subindex> 
						<lin>5</lin> 
						<col>9</col> 
						<orient>H</orient> 
						<question>Ele era chamado de Gândavo, pois seus pais vinham da cidade de ___________ na Bélgica.</question> 
						<answer>GAND</answer> 
						<clue>Essa é fácil. Pense no início do nome Gândavo.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>8</subindex> 
						<lin>8</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>Os europeus não conheciam bem a _____________ das línguas faladas pelos índios.</question> 
						<answer>DIVERSIDADE</answer> 
						<clue>Cerca de 1000 línguas eram faladas no território brasileiro no início da colonização.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>9</subindex> 
						<lin>11</lin> 
						<col>4</col> 
						<orient>H</orient> 
						<question>O _______ era o chefe político dos portugueses.</question> 
						<answer>REI</answer> 
						<clue>Como Pelé é conhecido no futebol?</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>10</subindex> 
						<lin>11</lin> 
						<col>8</col> 
						<orient>H</orient> 
						<question>Um dos símbolos que indica quem é o rei e a rainha é a __________.</question> 
						<answer>COROA</answer> 
						<clue>Os reis e rainhas usam na cabeça em situações formais.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
			</words>  ]]> ).toString(); 
					
			
			_words[8] = (<![CDATA[  <words>
					
					<word> 
						<subindex>1</subindex> 
						<lin>0</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>Um dos símbolos que indica quem é o rei e a rainha é a __________.</question> 
						<answer>COROA</answer> 
						<clue>Os reis e rainhas usam na cabeça em situações formais.</clue>  
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>9</lin> 
						<col>3</col> 
						<orient>V</orient> 
						<question>O _______ era o chefe político dos portugueses.</question> 
						<answer>REI</answer> 
						<clue>Como Pelé é conhecido no futebol?</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>3</subindex> 
						<lin>1</lin> 
						<col>5</col> 
						<orient>V</orient> 
						<question>Ele desaparece em 1578 nas ____________ no Marrocos.</question>
						<answer>CRUZADAS</answer>
						<clue>Qual é o nome dos movimentos militares e também religiosos cujo objetivo era colocar a Terra Santa e Jerusalém sob domínio cristão?</clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>1</lin> 
						<col>8</col> 
						<orient>V</orient> 
						<question>O rei de Portugal nessa época era _____________.</question> 
						<answer>DSEBASTIAOI</answer> 
						<clue>Vamos lá! Esse rei ficou muito famoso por ter morrido numa batalha.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>7</lin> 
						<col>10</col> 
						<orient>V</orient> 
						<question>Gândavo e _________________ são contemporâneos.</question> 
						<answer>CAMOES</answer> 
						<clue>Qual é o nome do autor da obra ‘Os Lusíadas’?</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>6</subindex> 
						<lin>1</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>Os índios são descritos de forma ______________ pelo viajante.</question> 
						<answer>EXOTICA</answer> 
						<clue>Um dos sentidos dessa palavra é ‘extravagante’.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>7</subindex> 
						<lin>3</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>Gândavo era um viajante  ______________.</question> 
						<answer>PORTUGUES</answer> 
						<clue>Pense bem! Qual foi o país responsável pela colonização do Brasil?</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>8</subindex> 
						<lin>5</lin> 
						<col>4</col> 
						<orient>H</orient> 
						<question>O relato de _____________ foi publicado em 1576.</question>
						<answer>GANDAVO</answer>
						<clue>Faça um esforço: qual é o nome do autor do texto lido pelo mensageiro do rei?</clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>9</subindex> 
						<lin>7</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>Gândavo descreve a ________, a flora e os aspectos sociais da nova terra.</question> 
						<answer>FAUNA</answer> 
						<clue>Pense no nome do conjunto dos animais.</clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>10</subindex> 
						<lin>10</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>Ele era extremamente _____________________.</question> 
						<answer>RELIGIOSO</answer> 
						<clue>Vou ajudar você: qual é a qualidade de quem se dedica muito à religião?</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
			</words>  ]]> ).toString(); 
			
			_words[9] = (<![CDATA[  <words>
					
					<word> 
						<subindex>1</subindex> 
						<lin>5</lin> 
						<col>1</col> 
						<orient>V</orient> 
						<question>Gândavo descreveu um animal que chamou de papa-formigas: o _____.</question> 
						<answer>TAMANDUA</answer> 
						<clue>O ... bandeira está em extinção.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>2</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>Gândavo descreve a ________, a flora e os aspectos sociais da nova terra.</question> 
						<answer>FAUNA</answer> 
						<clue>Pense no nome do conjunto dos animais.</clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>3</subindex> 
						<lin>9</lin> 
						<col>5</col> 
						<orient>V</orient> 
						<question>‘Carioca’ quer dizer _________ de branco na língua tupi.</question> 
						<answer>CASA</answer> 
						<clue>Quem casa quer....</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>0</lin> 
						<col>8</col> 
						<orient>V</orient> 
						<question>D. Sebastião I assume o trono português com _____ anos.</question>
						<answer>QUATORZE</answer>
						<clue>Uma dica: quanto é 20 - 6?</clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>7</lin> 
						<col>10</col> 
						<orient>V</orient> 
						<question>Um dos símbolos que indica quem é o rei e a rainha é a __________.</question> 
						<answer>COROA</answer> 
						<clue>Os reis e rainhas usam na cabeça em situações formais.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>6</subindex> 
						<lin>2</lin> 
						<col>3</col> 
						<orient>H</orient> 
						<question>D. Sebastião também tinha muito interesse nas colônias da __________________.</question> 
						<answer>AFRICA</answer> 
						<clue>Continente colonizado pelos europeus.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>7</subindex> 
						<lin>4</lin> 
						<col>6</col> 
						<orient>H</orient> 
						<question>Os índios são descritos de forma ______________ pelo viajante.</question> 
						<answer>EXOTICA</answer> 
						<clue>Um dos sentidos dessa palavra é ‘extravagante’.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>8</subindex> 
						<lin>6</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>O Brasil era chamado por Gândavo de Província de _________________.</question> 
						<answer>SANTACRUZ</answer> 
						<clue>Pense no símbolo do cristianismo.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>9</subindex> 
						<lin>8</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>Ele era chamado de Gândavo, pois seus pais vinham da cidade de ___________ na Bélgica.</question> 
						<answer>GAND</answer> 
						<clue>Essa é fácil. Pense no início do nome Gândavo.</clue>
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>10</subindex> 
						<lin>10</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>O rei de Portugal nessa época era _____________.</question> 
						<answer>DSEBASTIAOI</answer> 
						<clue>Vamos lá! Esse rei ficou muito famoso por ter morrido numa batalha.</clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
			</words>  ]]> ).toString(); 
	
	}

		
	}
}