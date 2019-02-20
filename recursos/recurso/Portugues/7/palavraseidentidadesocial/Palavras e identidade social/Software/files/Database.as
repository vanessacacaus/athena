
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
						<lin>1</lin> 
						<col>3</col> 
						<orient>H</orient> 
						<question>Dor de cabeça (termo médico). </question> 
						<answer>CEFALÉIA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>2</subindex> 
						<lin>3</lin> 
						<col>3</col> 
						<orient>H</orient> 
						<question>Programa de computador (termo da informática). </question> 
						<answer>SOFTWARE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>3</subindex> 
						<lin>5</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>Afastamento de governantes nos casos de instauração de processos para apuração de crimes de responsabilidade (termo político). </question> 
						<answer>IMPEACHMENT</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>4</subindex> 
						<lin>7</lin> 
						<col>4</col> 
						<orient>H</orient> 
						<question>Decisão do juiz ao final do processo (termo jurídico).</question> 
						<answer>SENTENÇA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>5</subindex> 
						<lin>12</lin> 
						<col>6</col> 
						<orient>H</orient> 
						<question>Aumento de preços de bens e serviços em um país, com consequente desvalorização da moeda (termo econômico). </question> 
						<answer>INFLAÇÃO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>6</subindex> 
						<lin>4</lin> 
						<col>0</col> 
						<orient>V</orient> 
						<question>Decisão provisória do juiz no início do processo (termo jurídico). </question> 
						<answer>LIMINAR</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>2</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>Qualifica o crime não intencional (termo jurídico).</question> 
						<answer>CULPOSO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>8</subindex> 
						<lin>0</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>Estágio na vida da mulher em que cessa a menstruação. (termo médico) </question> 
						<answer>MENOPAUSA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>7</lin> 
						<col>11</col> 
						<orient>V</orient> 
						<question>Acordos políticos/partidários para organizar e somar as forças em uma eleição ou em um governo (termo político). </question> 
						<answer>ALIANÇA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>10</subindex> 
						<lin>5</lin> 
						<col>13</col> 
						<orient>V</orient> 
						<question>Queda dos preços, diminuição da produção e do consumo de bens e serviços em um país (termo econômico). </question> 
						<answer>DEFLAÇÃO</answer> 
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
						<lin>3</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>Afastamento de governantes nos casos de instauração de processos para apuração de crimes de responsabilidade (termo político). </question> 
						<answer>IMPEACHMENT</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>2</subindex> 
						<lin>9</lin> 
						<col>6</col> 
						<orient>H</orient> 
						<question>Sigla de Produto Interno Bruto (termo econômico). </question> 
						<answer>PIB</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>3</subindex> 
						<lin>11</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>(?) de Valores – lugar de comercialização de ações e de outros bens (termo econômico). </question> 
						<answer>BOLSA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>4</subindex> 
						<lin>3</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>Comissão Parlamentar de (?) – Significado da sigla CPI (termo político). </question> 
						<answer>INQUÉRITO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>5</subindex> 
						<lin>0</lin> 
						<col>3</col> 
						<orient>V</orient> 
						<question>E-mail ou informação não solicitada (termo da informática). </question> 
						<answer>SPAM</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>6</subindex> 
						<lin>10</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>Entrada do computador para conexão com dispositivos externos (termo da informática). </question> 
						<answer>USB</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>2</lin> 
						<col>5</col> 
						<orient>V</orient> 
						<question>Primeira menstruação (termo médico). </question> 
						<answer>MENARCA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>8</subindex> 
						<lin>3</lin> 
						<col>7</col> 
						<orient>V</orient> 
						<question>Dor de cabeça (termo médico). </question> 
						<answer>CEFALÉIA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>1</lin> 
						<col>9</col> 
						<orient>V</orient> 
						<question>Decisão provisória do juiz no início do processo (termo jurídico). </question> 
						<answer>LIMINAR</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>2</lin> 
						<col>11</col> 
						<orient>V</orient> 
						<question>Aumento de preços de bens e serviços em um país, com consequente desvalorização da moeda (termo econômico). </question> 
						<answer>INFLAÇÃO</answer> 
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
						<col>1</col> 
						<orient>H</orient> 
						<question>Conclusão feita pelo médico sobre o problema de saúde que afeta o paciente (termo médico). </question> 
						<answer>DIAGNÓSTICO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>2</subindex> 
						<lin>3</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>(?) de Valores – lugar de comercialização de ações e de outros bens (termo econômico). </question> 
						<answer>BOLSA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>3</subindex> 
						<lin>5</lin> 
						<col>7</col> 
						<orient>H</orient> 
						<question>Qualifica o crime não intencional (termo jurídico). </question> 
						<answer>CULPOSO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>7</lin> 
						<col>3</col> 
						<orient>H</orient> 
						<question>Favorecimento a parentes ou amigos em relação a cargos públicos (termo político). </question> 
						<answer>NEPOTISMO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>10</lin> 
						<col>6</col> 
						<orient>H</orient> 
						<question>(?) corpus – ação judicial que garante a liberdade de locomoção do suspeito,  anula ou impede sua prisão (termo jurídico). </question> 
						<answer>HÁBEAS</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>6</subindex> 
						<lin>13</lin> 
						<col>10</col> 
						<orient>H</orient> 
						<question>Cravos e espinhas na pele (termo médico). </question> 
						<answer>ACNE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>3</lin> 
						<col>1</col> 
						<orient>V</orient> 
						<question>Cópia de segurança de dados diversos (termo da informática). </question> 
						<answer>BACKUP</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>8</subindex> 
						<lin>0</lin> 
						<col>3</col> 
						<orient>V</orient> 
						<question>Comissão (?) de Inquérito – Significado da sigla CPI (termo político). </question> 
						<answer>PARLAMENTAR</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>7</lin> 
						<col>10</col> 
						<orient>V</orient> 
						<question>Primeira menstruação (termo médico). </question> 
						<answer>MENARCA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>0</lin> 
						<col>11</col> 
						<orient>V</orient> 
						<question>Qualifica o crime intencional (termo jurídico). </question> 
						<answer>DOLOSO</answer> 
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
						<lin>1</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>Sigla de Produto Interno Bruto (termo econômico). </question> 
						<answer>PIB</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>2</subindex> 
						<lin>3</lin> 
						<col>0</col> 
						<orient>H</orient> 
						<question>Componente físico de um computador (termo da informática). </question> 
						<answer>HARDWARE</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>3</subindex> 
						<lin>6</lin> 
						<col>6</col> 
						<orient>H</orient> 
						<question>Queda dos preços, diminuição da produção e do consumo de bens e serviços em um país (termo econômico). </question> 
						<answer>DEFLAÇÃO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>4</subindex> 
						<lin>11</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>Período prolongado de queda na produção e no consumo de bens em um país (termo econômico). </question> 
						<answer>RECESSÃO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>13</lin> 
						<col>1</col> 
						<orient>H</orient> 
						<question>Local para bate-papo online (termo da informática).</question> 
						<answer>CHAT</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>6</subindex> 
						<lin>1</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>Comissão (?) de Inquérito – Significado da sigla CPI (termo político).</question> 
						<answer>PARLAMENTAR</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>7</subindex> 
						<lin>5</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>Consulta direta ao povo sobre questões de notória importância antes de leis a respeito serem elaboradas (termo político). </question> 
						<answer>PLEBISCITO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>8</subindex> 
						<lin>3</lin> 
						<col>7</col> 
						<orient>V</orient> 
						<question>Dívida (?) -  o que um país deve a outros países ou a instituições financeiras internacionais (termo econômico). </question> 
						<answer>EXTERNA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					
					<word> 
						<subindex>9</subindex> 
						<lin>4</lin> 
						<col>9</col> 
						<orient>V</orient> 
						<question>Qualifica o crime intencional (termo jurídico). </question> 
						<answer>DOLOSO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>0</lin> 
						<col>11</col> 
						<orient>V</orient> 
						<question>Decisão do juiz ao final do processo (termo jurídico). </question> 
						<answer>SENTENÇA</answer> 
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
						<col>1</col> 
						<orient>H</orient> 
						<question>Consulta direta ao povo sobre questões de notória importância após a elaboração de leis, podendo ou não ratificá-las (termo político). </question> 
						<answer>REFERENDO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>2</subindex> 
						<lin>8</lin> 
						<col>6</col> 
						<orient>H</orient> 
						<question>Qualifica o crime não intencional (termo jurídico). </question> 
						<answer>CULPOSO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>3</subindex> 
						<lin>10</lin> 
						<col>2</col> 
						<orient>H</orient> 
						<question>Dívida (?) - o que um país deve a outros países ou a instituições financeiras internacionais (termo econômico). </question> 
						<answer>EXTERNA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>4</subindex> 
						<lin>13</lin> 
						<col>5</col> 
						<orient>H</orient> 
						<question>Dor de cabeça (termo médico). </question> 
						<answer>CEFALÉIA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>5</subindex> 
						<lin>0</lin> 
						<col>2</col> 
						<orient>V</orient> 
						<question>Período prolongado de queda na produção e no consumo de bens em um país (termo econômico). </question> 
						<answer>RECESSÃO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
					<word> 
						<subindex>6</subindex> 
						<lin>0</lin> 
						<col>4</col> 
						<orient>V</orient> 
						<question>Afastamento de governantes nos casos de instauração de processos para apuração de crimes de responsabilidade (termo político). </question> 
						<answer>IMPEACHMENT</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>7</subindex> 
						<lin>1</lin> 
						<col>7</col> 
						<orient>V</orient> 
						<question>Cravos e espinhas na pele (termo médico). </question> 
						<answer>ACNES</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>8</subindex> 
						<lin>7</lin> 
						<col>8</col> 
						<orient>V</orient> 
						<question>Acordos políticos/partidários para organizar e somar as forças em uma eleição ou em um governo (termo político). </question> 
						<answer>ALIANÇA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>9</subindex> 
						<lin>7</lin> 
						<col>10</col> 
						<orient>V</orient> 
						<question>(?) de Valores – lugar de comercialização de ações e de outros bens (termo econômico). </question> 
						<answer>BOLSA</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>

					<word> 
						<subindex>10</subindex> 
						<lin>5</lin> 
						<col>12</col> 
						<orient>V</orient> 
						<question>Qualifica o crime intencional (termo jurídico). </question> 
						<answer>DOLOSO</answer> 
						<clue></clue> 
						<feedback_right></feedback_right> 
						<feedback_wrong></feedback_wrong>			 
					</word>
					
				</words>
			]]> ).toString(); 
		}	
	}
}