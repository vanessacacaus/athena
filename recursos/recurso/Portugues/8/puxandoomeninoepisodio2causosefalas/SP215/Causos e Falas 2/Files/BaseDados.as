package{
	import flash.events.*
	import flash.net.*
	
	/**
	 * Classe BaseDados
	 *
	 * @author Bruno Milare
	 * @date 22/04/2009
	 */
	public class BaseDados{
		
	/**
	 * Variavel que guarda as questoes de um episodio
	 */
	private static var questoesEpisodio:Array = new Array();
	
	/**
	 * Funcao que carrega as questoes , necessariamente roda somente uma vez
	 * durante a execucao.
	 */
	public static function carrega(){
		carregaQuestoes();
	}
	
	/**
	 * Retorna um XML com as questoes do episodio em questao
	 *
	 * @param {int} - indice do episodio
	 * @return {XML} - XML com as questoes do episodio em questao
	 */
	public static function retornaQuestoes(ep:int):XML{
		return new XML(questoesEpisodio[ep]);
	}
	
	/**
	 * Esta funcao tera todo o banco de questoes de um jogo
	 * descritas em XML.
	 * Consulte a documentacao para ver o formato do XML
	 * questoesEpisodio[1] = (<![CDATA[...
	 * questoesEpisodio[n] =(<![CDATA[...]]>).toString();
	 */
	public static function carregaQuestoes(){
			questoesEpisodio[0] = (
			<questoes>
	<questao>
			<enunciado>Você viu que esses versos relatam fatos de cunho jornalístico, não é? Então, quantas páginas deverá ter esse folheto? </enunciado>
			<textorelacionado><![CDATA[	Santo Deus! Quantas misérias
Contaminam nossa terra!
No Brasil ataca a seca
Na Europa assola a guerra
A Europa ainda diz
O governo do país
Trabalha para o nosso bem
O nosso em vez de nos dar
Manda logo nos tomar
O pouco que ainda se tem.
(<i>A Seca do Ceará (1915/16)</i>, de Leandro Gomes de Barros)]]>
			</textorelacionado>
			<alternativas>
				<alternativa>8 páginas</alternativa>
				<alternativa>24 páginas</alternativa>
				<alternativa>32 páginas</alternativa>
				<alternativa>48 páginas</alternativa>
				<alternativa>64 páginas</alternativa>
			</alternativas>
			<feedbacks>
				<feedback>Muito bem! Quando o folheto relata uma notícia da atualidade ou um fato do cotidiano, costuma conter 8 páginas, podendo chegar a 16. Se fosse sobre um tema ficcional, como uma história de amor ou uma batalha entre guerreiros, o folheto poderia conter de 16 a 64 páginas.</feedback>
				<feedback>Tente outra vez! Quando o folheto relata uma notícia da atualidade ou um fato do cotidiano, costuma conter 8 páginas, podendo chegar a 16. Se fosse sobre um tema ficcional, como uma história de amor ou uma batalha entre guerreiros, o folheto poderia conter de 16 a 64 páginas.</feedback>
				<feedback>Tente outra vez! Quando o folheto relata uma notícia da atualidade ou um fato do cotidiano, costuma conter 8 páginas, podendo chegar a 16. Se fosse sobre um tema ficcional, como uma história de amor ou uma batalha entre guerreiros, o folheto poderia conter de 16 a 64 páginas.</feedback>
				<feedback>Tente outra vez! Quando o folheto relata uma notícia da atualidade ou um fato do cotidiano, costuma conter 8 páginas, podendo chegar a 16. Se fosse sobre um tema ficcional, como uma história de amor ou uma batalha entre guerreiros, o folheto poderia conter de 16 a 64 páginas.</feedback>
				<feedback>Tente outra vez! Quando o folheto relata uma notícia da atualidade ou um fato do cotidiano, costuma conter 8 páginas, podendo chegar a 16. Se fosse sobre um tema ficcional, como uma história de amor ou uma batalha entre guerreiros, o folheto poderia conter de 16 a 64 páginas.</feedback>
			</feedbacks>
			<dica></dica>
			<valorpontos>0</valorpontos>
			<respcorreta>0</respcorreta>
			<dialogos>
					<quantidade>0</quantidade>
			</dialogos>
	</questao>

	<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Você percebeu a forma da estrofe? </enunciado>
		<textorelacionado><![CDATA[	Eu vou contar uma história
De um Pavão Misterioso
Que levantou voo na Grécia 
Com um rapaz corajoso
Raptando uma condessa
Filha dum conde orgulhoso.
(<i>Romance do Pavão Misterioso</i>, de João Melquíades Ferreira da Silva)]]>
		</textorelacionado>
		<alternativas>
			<alternativa>Sim! É uma setilha setessilábica.</alternativa>
			<alternativa>Sim! É uma sextilha setessilábica.</alternativa>
			<alternativa>Sim! É uma quadra pentassilábica.</alternativa>
			<alternativa>Sim! É uma décima decassilábica.</alternativa>
			<alternativa>Sim! É uma décima setessilábica.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A setilha setessilábica é uma estrofe de sete versos com sete sílabas poéticas. A estrofe recitada pelo Padre tem seis versos com sete sílabas poéticas. É, portanto, uma sextilha setessilábica, forma muito comum nos folhetos.</feedback>
			<feedback>Muito bem! A estrofe contém seis versos com sete sílabas poéticas, portanto, é uma sextilha setessilábica, forma muito comum nos folhetos.</feedback> 
			<feedback>Tente outra vez! A quadra pentassilábica é uma estrofe de quatro versos com cinco sílabas poéticas. Ela não costuma ser usada em folhetos. A estrofe recitada pelo Padre tem seis versos com sete sílabas poéticas. Portanto, é uma sextilha setessilábica, forma muito comum nos folhetos.</feedback>
			<feedback>Tente outra vez! A décima decassilábica é uma estrofe de 10 versos com 10 sílabas poéticas. Ela é usada, algumas vezes, em folhetos, mas a estrofe recitada pelo Padre tem seis versos com sete sílabas poéticas. É, portanto, uma sextilha setessilábica, forma muito comum nos folhetos.</feedback>
			<feedback>Tente outra vez! A décima setessilábica é uma estrofe de 10 versos com sete sílabas poéticas. Ela não costuma ser usada em folhetos. A estrofe recitada pelo Padre tem seis versos com sete sílabas poéticas. É, portanto, uma sextilha setessilábica.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>1</valorpontos>
		<respcorreta>1</respcorreta>
	</questao>
	
	<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Você percebeu qual é o objetivo dessa primeira estrofe?</enunciado>
		<textorelacionado><![CDATA[	Eu vou contar uma história
De um Pavão Misterioso
Que levantou voo na Grécia
Com um rapaz corajoso
Raptando uma condessa
Filha dum conde orgulhoso.
(<i>Romance do Pavão Misterioso</i>, de João Melquíades Ferreira da Silva)]]>
		</textorelacionado>
		<alternativas>
			<alternativa>Sim! É mostrar que o poeta consegue fazer sextilhas com versos de sete sílabas poéticas com rima em ABCBDB.</alternativa>
			<alternativa>Sim! É criar mistério sobre a história que será contada, desafiando o leitor ou o ouvinte a tentar adivinhar o que vai acontecer.</alternativa>
			<alternativa>Sim! É apresentar os elementos principais da história que será contada para situar o leitor ou o ouvinte, facilitando a compreensão do enredo.</alternativa>
			<alternativa>Sim! É apresentar o início de uma peleja em que os cantadores vão testar sua habilidade poética. </alternativa>
			<alternativa>Sim! É contar, em versos rimados e metrificados, um fato relevante da atualidade, extraído de um jornal.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! O objetivo dessa primeira estrofe do folheto é apresentar os elementos principais da história que será contada, para situar o leitor ou o ouvinte, facilitando a compreensão do enredo. O poeta demonstra sua habilidade para fazer sextilhas com versos de sete sílabas poéticas com rima em ABCBDB durante o folheto todo e não apenas na primeira estrofe.</feedback>
			<feedback>Tente outra vez! O objetivo dessa primeira estrofe do folheto é apresentar os elementos principais da história que será contada, para situar o leitor ou o ouvinte, facilitando a compreensão do enredo. Nela, não há mistério algum, pois já ficamos sabendo quem são as personagens principais e o que vai acontecer. </feedback>
			<feedback>Muito bem! O objetivo dessa primeira estrofe é esse mesmo! Ela também serve para atrair o interesse do leitor ou do ouvinte, que fica curioso para saber os detalhes da narrativa e para ver como o autor vai contá-los.</feedback>
			<feedback>Tente outra vez! Essa estrofe não tem nenhum elemento das pelejas, pois não apresenta o encontro de dois cantadores. O objetivo dessa primeira estrofe do folheto é apresentar os elementos principais da história que será contada, para situar o leitor ou o ouvinte, facilitando a compreensão do enredo.</feedback>
			<feedback>Tente outra vez! Existem folhetos desenvolvidos a partir de notícias da atualidade, mas eles não costumam envolver condes, condessas e pavões misteriosos.
O objetivo dessa primeira estrofe do folheto é apresentar os elementos principais da história que será contada, para situar o leitor ou o ouvinte, facilitando a compreensão do enredo.
			</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>2</valorpontos>
		<respcorreta>2</respcorreta>
	</questao>
	
	<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Você percebeu qual é o tema desse folheto?</enunciado>
		<textorelacionado><![CDATA[	Santo Deus! Quantas misérias
Contaminam nossa terra!
No Brasil ataca a seca
Na Europa assola a guerra
A Europa ainda diz
O governo do país
Trabalha para o nosso bem
O nosso em vez de nos dar
Manda logo nos tomar
O pouco que ainda se tem.
(<i>A Seca do Ceará (1915/16)</i>, de Leandro Gomes de Barros)]]>
		</textorelacionado>
		<alternativas>
			<alternativa>É louvar a Deus e pedir sua proteção para as pessoas que sofrem.</alternativa>
			<alternativa>É apresentar o início de uma peleja entre dois cantadores conhecidos.</alternativa>
			<alternativa>É apresentar o início de uma narrativa ficcional sobre um mau governante.</alternativa>
			<alternativa>É apresentar fatos de cunho jornalístico que chamavam a atenção no momento.</alternativa>
			<alternativa>É pedir a proteção de Deus contra a ação de um governante malvado.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A referência a Deus no início da estrofe é apenas uma interjeição. O tema do folheto é a Primeira Guerra Mundial (1914-1918), que aconteceu ao mesmo tempo em que ocorria uma grande seca no Ceará.</feedback>
			<feedback>Tente outra vez! Essa estrofe não tem nenhum elemento das pelejas, pois não apresenta o encontro de dois cantadores. O tema do folheto é a Primeira Guerra Mundial (1914-1918), que aconteceu ao mesmo tempo em que ocorria uma grande seca no Ceará. </feedback>
			<feedback>Tente outra vez! A referência às “misérias” e à “guerra” não é ficcional. A menção à Europa e à seca indica que o tema do folheto é a Primeira Guerra Mundial (1914-1918), que aconteceu ao mesmo tempo em que ocorria uma grande seca no Ceará. </feedback>
			<feedback>Muito bem! A referência às “misérias” e à “guerra”, bem como à Europa e à seca, indica que o tema do folheto é a Primeira Guerra Mundial (1914-1918), que aconteceu ao mesmo tempo em que ocorria uma grande seca no Ceará, o que também é indicado no título do folheto.</feedback>
			<feedback>Tente outra vez! A referência a Deus no início da estrofe é apenas uma interjeição. O tema do folheto é a Primeira Guerra Mundial (1914-1918), que aconteceu ao mesmo tempo em que ocorria uma grande Seca no Ceará.</feedback>
			</feedbacks>
		<dica></dica>
		<valorpontos>3</valorpontos>
		<respcorreta>3</respcorreta>
	</questao>
	
	<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Você percebeu que o poeta acha que tem gente que vai conhecer a história sem ler?</enunciado>
		<textorelacionado><![CDATA[	Vamos ouvir a história
De um rapaz valentão
Que andava de casa em casa
À procura de questão
Era José Colatino
Que tinha essa intenção.
(<i>Combate de José Colatino com o Carranca do Piauí</i>, de João Melquíades Ferreira da Silva)]]>
		</textorelacionado>
		<alternativas>
			<alternativa>Sim! Porque todo mundo conhece alguma história de rapaz valentão. </alternativa>
			<alternativa>Não! Porque não há como conhecer um folheto sem ler a história</alternativa>
			<alternativa>Não! Porque uma pessoa que não sabe ler não vai se interessar por folhetos</alternativa>
			<alternativa>Sim! Porque ele diz que vai apresentar uma questão para o público.</alternativa>
			<alternativa>Sim! Porque o poeta diz que a história vai ser ouvida.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! O fato de muita gente saber alguma história de valentão não quer dizer que os versos compostos pelo poeta já fossem conhecidos. O que indica que ele imagina ouvintes e não leitores para seu folheto é o primeiro verso: “Vamos ouvir a história”. </feedback>
			<feedback>Tente outra vez! É possível conhecer um folheto por meio da leitura em voz alta. O que indica que o poeta imagina ouvintes e não leitores para seu folheto é o primeiro verso: “Vamos ouvir a história”. </feedback>
			<feedback>Tente outra vez! Os folhetos atraíam tanto as pessoas capazes de ler quanto as analfabetas, que ouviam leituras orais. O que indica que o poeta imagina ouvintes e não leitores para seu folheto é o primeiro verso: “Vamos ouvir a história”.</feedback>
			<feedback>Tente outra vez! A palavra “questão” não significa que o poeta vá perguntar alguma coisa para alguém. No trecho “um rapaz valentão / que andava de casa em casa / à procura de questão”, a palavra significa “briga”, “litígio”. O que indica que o poeta imagina ouvintes e não leitores para seu folheto é o primeiro verso: “Vamos ouvir a história”.</feedback>
			<feedback>Muito bem! O primeiro verso (“Vamos ouvir a história”) indica que o poeta imagina ouvintes e não leitores para seu folheto. Realmente, não é preciso saber ler para apreciar folhetos. Por meio da leitura em voz alta, pessoas analfabetas ficam conhecendo as histórias. </feedback>			
		</feedbacks>
		<dica></dica>
		<valorpontos>4</valorpontos>
		<respcorreta>4</respcorreta>
	</questao>

</questoes>
			).toString();
	
	
			questoesEpisodio[1] = (
			<questoes>
			
			

	
	
	<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Você sabe o que é martelo agalopado?</enunciado>
		<textorelacionado>Não admito gracejo
O colega é bem ousado!
Para cantar criticando
Seu quengo está bem lixado!
Por isto vou dar-lhe agora
Em martelo agalopado!
</textorelacionado>
		<alternativas>
			<alternativa>É um tipo de composição poética em décimas de 10 sílabas com ritmo forte.</alternativa>
			<alternativa>É um tipo de composição poética em sextilhas de sete sílabas.</alternativa>
			<alternativa>É um tipo de composição poética em que o cantador se apresenta montado a cavalo.</alternativa>
			<alternativa>É um tipo de dança popular, em que há personagens humanos e animais fantásticos.</alternativa>
			<alternativa>É um tipo de narrativa em prosa, sobre a vida dos cavaleiros medievais.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! O martelo agalopado é um tipo de composição poética em décimas de 10 sílabas com a tônica na 3ª, 6ª e 10ª sílabas. Essa é uma das formas poéticas a que os repentistas recorrem para dificultar a resposta de seus oponentes.</feedback>
			<feedback>Tente outra vez! As sextilhas de sete sílabas são a forma básica dos desafios e dos folhetos. O martelo agalopado é um tipo de composição poética em décimas de 10 sílabas com ritmo forte, marcando a tônica nas sílabas 3, 6 e 10.</feedback>
			<feedback>Tente outra vez! Nas cantorias, há uma grande variedade de formas poéticas, mas não na maneira de se apresentar. Ninguém é obrigado a montar a cavalo! O martelo agalopado é um tipo de composição poética em décimas de 10 sílabas com ritmo forte, marcando a tônica nas sílabas 3, 6 e 10.</feedback>
			<feedback>Tente outra vez! Há danças em que personagens humanos e animais fantásticos se apresentam, como no bumba meu boi, que gira em torno da morte e ressurreição de um boi. O martelo agalopado é um tipo de composição poética em décimas de 10 sílabas com ritmo forte, marcando a tônica nas sílabas 3, 6 e 10.</feedback>
			<feedback>Tente outra vez! Narrativas em prosa sobre cavaleiros medievais são contadas em romances de cavalaria. Desafios e pelejas são sempre em verso. O martelo agalopado é um tipo de composição poética em décimas de 10 sílabas com ritmo forte, marcando a tônica nas sílabas 3, 6 e 10.</feedback>
			</feedbacks>
			<dica></dica>
			<valorpontos>5</valorpontos>
			<respcorreta>0</respcorreta>
	</questao>


				<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Se você fosse cantador e tivesse que responder, teria que seguir a métrica. Qual é a métrica desses versos?</enunciado>
		<textorelacionado><![CDATA[Romano você me diga
Por quais terras tem andado
Quantos livros já tem lido
Que tempo tem estudado
Quantos anos tem de idade
Que cantores tem tirado? 

BAPTISTA, Francisco das Chagas. <i>Cantadores e poetas populares</i>, Paraíba: Tipografia da Popular Editora, 1929,  pág. 72]]></textorelacionado>
		<alternativas>
			<alternativa>São versos pentassílabos.</alternativa>
			<alternativa>São versos heptassílabos.</alternativa>
			<alternativa>São versos decassílabos.</alternativa>
			<alternativa>São versos eneassílabos.</alternativa>
			<alternativa>São versos tautossilábicos.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Pentassílabos são versos de cinco sílabas poéticas. Os versos apresentados contêm sete sílabas poéticas, portanto são heptassílabos.</feedback>
			<feedback>Muito bem! Todos os versos têm sete sílabas métricas, portanto são heptassílabos.</feedback>
			<feedback>Tente outra vez! Decassílabos são versos com 10 sílabas poéticas. Os versos apresentados contêm sete sílabas poéticas, portanto são heptassílabos.</feedback>
			<feedback>Tente outra vez! Eneassílabos são versos com nove sílabas poéticas. Os versos apresentados contêm sete sílabas poéticas, portanto são heptassílabos.</feedback>
			<feedback>Tente outra vez! Palavras tautossilábicas são aquelas em que há uma duplicação de sílabas idênticas, como em “bumbum”. Isso não tem nada a ver com métrica! Os versos apresentados contêm sete sílabas poéticas, portanto são heptassílabos.</feedback>
			</feedbacks>
			<dica></dica>
			<valorpontos>6</valorpontos>
			<respcorreta>1</respcorreta>
	</questao>


	<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Cego Aderaldo comenta: Não cantei o último verso. Você sabe como ele deveria ser para acompanhar os outros na métrica e na rima?</enunciado>
		<textorelacionado>Já vi que seu Zé Pretinho
É um homem sem ação
Como se maltrata o outro
Sem haver alteração?!... 
Eu pensava que o senhor
[foi omitido o último verso: Tinha outra educação!] 
</textorelacionado>
		<alternativas>
			<alternativa>Ter 5 sílabas e terminar em ão.</alternativa>
			<alternativa>Ter 7 sílabas e terminar em inho.</alternativa>
			<alternativa>Ter 7 sílabas e terminar em ão.</alternativa>
			<alternativa>Ter 5 sílabas e terminar em inho.</alternativa>
			<alternativa>Ter 7 sílabas e terminar em ô.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback><![CDATA[Tente outra vez! A rima estaria correta, pois os versos rimados são o 2º e 4º (ação, alteração). Mas a métrica estaria errada, já que os demais versos possuem 7 sílabas métricas. O verso faltante é <i>Tinha outra educação!</i>]]></feedback>
			<feedback><![CDATA[Tente outra vez! A métrica está correta, pois todos os versos são heptassílabos. Mas a rima estaria errada, já que os versos rimados são o 2º e 4º (ação, alteração). O verso faltante é <i>Tinha outra educação!</i>]]></feedback>
			<feedback><![CDATA[Muito bem! Todos os versos são heptassílabos e as rimas estão no 2º e 4º (ação, alteração). O verso faltante é <i>Tinha outra educação!</i>]]></feedback>
			<feedback><![CDATA[Tente outra vez! Os versos são heptassílabos e as rimas estão no o 2º e 4º (ação, alteração). O verso faltante é <i>Tinha outra educação!</i>]]></feedback>
			<feedback><![CDATA[Tente outra vez! A métrica está correta, pois todos os versos são heptassílabos. Mas a rima estaria errada, já que os versos rimados são o 2º e 4º (ação, alteração). O verso faltante é <i>Tinha outra educação!</i>]]></feedback>
			</feedbacks>
			<dica></dica>
			<valorpontos>7</valorpontos>
			<respcorreta>2</respcorreta>
	</questao>

	<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Zé Pretinho perdeu a peleja e agora vamos tratar do dinheiro. Você sabe como vamos fazer?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Como você ganhou, ficará com 80% e ele, com 20%. E vocês irão logo embora, porque o serviço já está feito.</alternativa>
			<alternativa>Vocês não vão dividir nada. Quem ganhou fica com tudo. Ele vai ter que continuar cantando para os convidados.</alternativa>
			<alternativa>Vocês não vão dividir nada. Você vai ficar com tudo. E vocês irão logo embora, porque o serviço está feito.</alternativa>
			<alternativa>Vocês vão dividir o dinheiro meio a meio. E você poderá apresentar suas histórias para os convidados.</alternativa>
			<alternativa>Que dinheiro? Ninguém paga para assistir pelejas de repentistas populares como vocês.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! O que mais interessa para os repentistas é superar o talento do adversário na improvisação de versos e não o retorno financeiro. Ganhando ou perdendo, o cantador fica com metade do dinheiro recebido do público. Quem ganha recebe a honra de permanecer na festa, cantando histórias que sabe de cor.</feedback>
			<feedback>Tente outra vez! O que mais interessa para os repentistas é superar o talento do adversário na improvisação de versos e não o retorno financeiro. Ganhando ou perdendo, o cantador fica com metade do dinheiro recebido do público. Quem ganha recebe a honra de permanecer na festa, cantando histórias que sabe de cor.</feedback>
			<feedback>Tente outra vez! O que mais interessa para os repentistas é superar o talento do adversário na improvisação de versos e não o retorno financeiro. Ganhando ou perdendo, o cantador fica com metade do dinheiro recebido do público. Quem ganha recebe a honra de permanecer na festa, cantando histórias que sabe de cor.</feedback>
			<feedback>Muito bem! O que mais interessa para os repentistas é superar o talento do adversário na improvisação de versos e não o retorno financeiro. Ganhando ou perdendo, o cantador fica com metade do dinheiro recebido do público. Quem ganha recebe a honra de permanecer na festa, cantando histórias que sabe de cor.</feedback>
			<feedback>Tente outra vez! O que mais interessa para os repentistas é superar o talento do adversário na improvisação de versos e não o retorno financeiro. Ganhando ou perdendo, o cantador fica com metade do dinheiro recebido do público. Quem ganha recebe a honra de permanecer na festa, cantando histórias que sabe de cor.</feedback>
			</feedbacks>
			<dica></dica>
			<valorpontos>8</valorpontos>
			<respcorreta>3</respcorreta>
	</questao>
	
	
	<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Vou cantar uns versos da famosa peleja de Inácio da Catingueira com Romano da Mãe d’Água para ver se você entendeu como os cantadores devem se comportar! Inácio da Catingueira respondeu muito bem! Você sabe por que os versos dele foram uma boa resposta?</enunciado>
		<textorelacionado>Romano da Mãe d’Água cantou:
Com negro não canto mais  
Perante a sociedade.  
Estou dando cabimento  
Ele está com liberdade.  
Por isso vou me calar,  
Mesmo por minha vontade.
Inácio da Catingueira respondeu:
O sinhô me chama negro,  
Pensando que me acabrunha.  
O sinhô de home branco  
Só tem os dente e as unha,  
A sua pele é queimada,  
Seu cabelo é testemunha.
</textorelacionado>
		<alternativas>
			<alternativa>Porque ele mudou de assunto, mantendo a forma poética.</alternativa>
			<alternativa>Porque ele devolveu a ofensa e mudou a forma poética.</alternativa>
			<alternativa>Porque ele elogiou o adversário, mantendo a forma poética.</alternativa>
			<alternativa>Porque ele mudou para uma forma poética mais difícil.</alternativa>
			<alternativa>Porque ele desmanchou a ofensa e manteve a forma poética.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! O assunto é o mesmo – cor da pele – e a forma poética se mantém – versos de sete sílabas com rima no 2º, 4º e 6º versos.</feedback>
			<feedback>Tente outra vez! Ele não devolveu a ofensa, pois não aceitou a ideia de que ser negro é um problema e manteve a forma poética – versos de sete sílabas com rima no 2º, 4º e 6º versos.</feedback>
			<feedback>Tente outra vez! O assunto é o mesmo – cor da pele – e a forma poética se mantém – versos de sete sílabas com rima no 2º, 4º e 6º versos.</feedback>
			<feedback>Tente outra vez! Embora seja comum os repentistas mudarem a forma poética para dificultar a resposta do outro cantador, nesse caso isso não aconteceu: a forma poética se manteve – versos de sete sílabas com rima no 2º, 4º e 6º versos.</feedback>
			<feedback>Muito bem! Ele não aceitou a ideia de que ser negro é um problema e manteve a forma poética – versos de sete sílabas com rima no 2º, 4º e 6º versos.</feedback>
			</feedbacks>
			<dica></dica>
			<valorpontos>9</valorpontos>
			<respcorreta>4</respcorreta>
	</questao>
	
	

</questoes>
			).toString();
			
			
			
			questoesEpisodio[2] = (
			<questoes>
				<questao>
					<enunciado>Duvido que você saiba quantas sílabas poéticas tem cada um desses versos.</enunciado>
					<textorelacionado>O cravo brigou com a rosa
Debaixo de uma sacada
O cravo saiu ferido
E a rosa, despedaçada
</textorelacionado>
					<alternativas>
						<alternativa>Claro que eu sei! Cada um tem 7 sílabas poéticas.</alternativa>
						<alternativa>Claro que eu sei! Cada um tem 9 sílabas poéticas.</alternativa>
						<alternativa>Claro que eu sei! Cada um tem 8 sílabas poéticas.</alternativa>
						<alternativa>Claro que eu sei! Cada um tem 6 sílabas poéticas.</alternativa>
						<alternativa>Claro que eu sei! Cada um tem 5 sílabas poéticas.</alternativa>
						</alternativas>
					<feedbacks>
						<feedback><![CDATA[Muito bem! Os versos possuem 7 sílabas poéticas, pois estas são contadas pela pronúncia e somente até a última sílaba tônica: 
O-cra-vo-bri-gou-<i>co’a</i>-ro-<u>sa</u>
De-bai-xo-<i>d’u</i>-ma-sa-ca-<u>da</u>
O-cra-vo-sa-iu-fe-ri-<u>do</u>
E’a- ro-sa-des-pe-da-ça-<u>da</u>]]>
</feedback>
						<feedback><![CDATA[Tente outra vez! O primeiro verso tem 9 sílabas comuns, mas apenas 7 sílabas poéticas. Não se conta a última sílaba átona. Contam-se as sílabas pela da pronúncia: <b>O-cra-vo-bri-gou-<i>co’a</i>-ro-</b><u>sa</u>.]]></feedback>
						<feedback><![CDATA[Tente outra vez! O terceiro verso tem 8 sílabas comuns, mas apenas 7 sílabas poéticas. Não se conta a última sílaba átona. Contam-se as sílabas pela pronúncia: <b>O-cra-vo-sa-iu-fe-ri-</b><u>do</u>.]]></feedback>
						<feedback><![CDATA[Tente outra vez! Os versos têm 7 sílabas poéticas. Não se conta a última sílaba átona e contam-se as sílabas pela pronúncia: 
O-cra-vo-bri-gou-<i>co’a</i>-ro-<u>sa</u>
De-bai-xo-<i>d’u</i>-ma-sa-ca-<u>da</u>
O-cra-vo-sa-iu-fe-ri-<u>do</u>
E’a- ro-sa-des-pe-da-ça-<u>da</u>]]>
</feedback>
						<feedback><![CDATA[Tente outra vez! Os versos têm 7 sílabas poéticas. Não se conta a última sílaba átona e contam-se as sílabas pela pronúncia: 
O-cra-vo-bri-gou-<i>co’a</i>-ro-<u>sa</u>
De-bai-xo-<i>d’u</i>-ma-sa-ca-<u>da</u>
O-cra-vo-sa-iu-fe-ri-<u>do</u>
E’a- ro-sa-des-pe-da-ça-<u>da</u>]]>
</feedback>
						</feedbacks>
					<dica></dica>
					<valorpontos>10</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
				
				
				<questao>
					<enunciado>Duvido que você saiba qual é o esquema de rimas desses versos.</enunciado>
					<textorelacionado>O cravo ficou doente
A rosa foi visitar
O cravo teve um desmaio
A rosa pôs-se a chorar 
</textorelacionado>
					<alternativas>
						<alternativa>Claro que eu sei! O primeiro verso rima com o terceiro e o segundo com o quarto.</alternativa>
						<alternativa>Claro que eu sei! O segundo verso rima com o quarto.</alternativa>
						<alternativa>Claro que eu sei! Nenhum dos versos rima.</alternativa>
						<alternativa>Claro que eu sei! O primeiro verso rima com o último.</alternativa>
						<alternativa>Claro que eu sei! Todos os versos rimam.</alternativa>
						</alternativas>
					<feedbacks>
						<feedback><![CDATA[Tente outra vez! Na poesia popular, é comum as quadras rimarem os versos pares. Neste caso, o 2º verso rima com o 4º (“visit<b><i>ar</i></b>” com “chor<b><i>ar</i></b>”), gerando o esquema ABCB.]]></feedback>
						<feedback>Muito bem! Na poesia popular, é comum as quadras rimarem os versos pares. </feedback>
						<feedback><![CDATA[Tente outra vez! Na poesia popular, é comum as quadras rimarem os versos pares. Neste caso, o 2º verso rima com o 4º (“visit<b><i>ar</i></b>” com “chor<b><i>ar</i></b>”), gerando o esquema ABCB.]]></feedback>
						<feedback><![CDATA[Tente outra vez! Na poesia popular, é comum as quadras rimarem os versos pares. Neste caso, o 2º verso rima com o 4º (“visit<b><i>ar</i></b>” com “chor<b><i>ar</i></b>”), gerando o esquema ABCB.]]></feedback>
						<feedback><![CDATA[Tente outra vez! Na poesia popular, é comum as quadras rimarem os versos pares. Neste caso, o 2º verso rima com o 4º (“visit<b><i>ar</i></b>” com “chor<b><i>ar</i></b>”), gerando o esquema ABCB.]]></feedback>
						</feedbacks>
					<dica></dica>
					<valorpontos>11</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				
				<questao>
					<enunciado>Duvido que você saiba qual é o ritmo desses versos.</enunciado>
					<textorelacionado>O cravo brigou com a rosa
Debaixo de uma sacada
O cravo saiu ferido
E a rosa, despedaçada
</textorelacionado>
					<alternativas>
						<alternativa>Claro que eu sei! Os acentos rítmicos recaem sobre a 4ª e a 7ª sílaba poética.</alternativa>
						<alternativa>Claro que eu sei! Os acentos rítmicos recaem sobre a 3ª e a 6ª sílaba poética.</alternativa>
						<alternativa>Claro que eu sei! Os acentos rítmicos recaem sobre a 2ª e a 7ª sílaba poética.</alternativa>
						<alternativa>Claro que eu sei! Os acentos rítmicos recaem sobre a 3ª e a 8ª sílaba poética.</alternativa>
						<alternativa>Claro que eu sei! Os acentos rítmicos recaem sobre a 1ª e a 5ª sílaba poética.</alternativa>
						</alternativas>
					<feedbacks>
						<feedback><![CDATA[Tente outra vez! Os acentos rítmicos recaem sobre a 2ª e a 7ª sílabas poéticas. Essa repetição cria um ritmo na pronúncia:
O <b><u>cra</u></b>vo brigou com a <b><u>ro</b></u>sa
De<b><u>bai</b></u>xo de uma sa<b><u>ca</b></u>da
O <b><u>cra</b></u>vo saiu fe<b><u>ri</b></u>do
E a <b><u>ro</b></u>sa, despeda<b><u>ça</b></u>da]]>
</feedback>
						<feedback><![CDATA[Tente outra vez! Os acentos rítmicos recaem sobre a 2ª e a 7ª sílabas poéticas. Essa repetição cria um ritmo na pronúncia:
O <b><u>cra</u></b>vo brigou com a <b><u>ro</b></u>sa
De<b><u>bai</b></u>xo de uma sa<b><u>ca</b></u>da
O <b><u>cra</b></u>vo saiu fe<b><u>ri</b></u>do
E a <b><u>ro</b></u>sa, despeda<b><u>ça</b></u>da]]>
</feedback>
						<feedback><![CDATA[Muito bem! Por estarem sempre fixos à 2ª e à 7ª sílabas poéticas, os acentos criam um padrão sonoro e definem um compasso musical para a pronúncia:
O <i><u>cra</u></i>vo brigou com a <i><u>ro</i></u>sa
De<i><u>bai</i></u>xo de uma sa<i><u>ca</i></u>da
O <i><u>cra</i></u>vo saiu fe<i><u>ri</i></u>do
E a <i><u>ro</i></u>sa, despeda<i><u>ça</i></u>da]]>
</feedback>
						<feedback><![CDATA[Tente outra vez! Os acentos rítmicos recaem sobre a 2ª e a 7ª sílabas poéticas. Essa repetição cria um ritmo na pronúncia:
O <b><u>cra</u></b>vo brigou com a <b><u>ro</b></u>sa
De<b><u>bai</b></u>xo de uma sa<b><u>ca</b></u>da
O <b><u>cra</b></u>vo saiu fe<b><u>ri</b></u>do
E a <b><u>ro</b></u>sa, despeda<b><u>ça</b></u>da]]>
</feedback>
						<feedback><![CDATA[Tente outra vez! Os acentos rítmicos recaem sobre a 2ª e a 7ª sílabas poéticas. Essa repetição cria um ritmo na pronúncia:
O <b><u>cra</u></b>vo brigou com a <b><u>ro</b></u>sa
De<b><u>bai</b></u>xo de uma sa<b><u>ca</b></u>da
O <b><u>cra</b></u>vo saiu fe<b><u>ri</b></u>do
E a <b><u>ro</b></u>sa, despeda<b><u>ça</b></u>da]]>
</feedback>
						</feedbacks>
					<dica></dica>
					<valorpontos>12</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				
				<questao>
					<enunciado>Duvido que você saiba qual é o ritmo desses versos.</enunciado>
					<textorelacionado>Pirulito que bate, bate
Pirulito que já bateu
Quem gosta de mim é ela
Quem gosta dela sou eu
</textorelacionado>
					<alternativas>
						<alternativa>Claro que eu sei! Os acentos rítmicos recaem sobre a 2ª, a 6ª e a 7ª sílaba poética.</alternativa>
						<alternativa>Claro que eu sei! Os acentos rítmicos recaem sobre a 3ª, a 6ª e a 8ª sílaba poética.</alternativa>
						<alternativa>Claro que eu sei! Os acentos rítmicos recaem sobre a 3ª, a 5ª e a 7ª sílaba poética.</alternativa>
						<alternativa>Claro que eu sei! Os acentos rítmicos recaem sobre a 2ª, a 5ª e a 7ª sílaba poética.</alternativa>
						<alternativa>Claro que eu sei! Os acentos rítmicos recaem sobre a 4ª, a 5ª e a 6ª sílaba poética.</alternativa>
						</alternativas>
					<feedbacks>
						<feedback><![CDATA[Tente outra vez! Os acentos recaem sobre a 2ª, a 5ª e a 7ª sílabas poéticas. Essa repetição cria um ritmo para os versos. No caso desta cantiga infantil, a pronúncia da palavra “pirulito” é condensada em 3 sílabas poéticas: <i>P'ru</i>-<i><b>li</i></b>-to que <i><b>ba</i></b>te, <i><b>ba</i></b>te.]]></feedback>
						<feedback><![CDATA[Tente outra vez! Os acentos recaem sobre a 2ª, a 5ª e a 7ª sílabas poéticas. Essa repetição cria um ritmo para os versos. No caso desta cantiga infantil, a pronúncia da palavra “pirulito” é condensada em 3 sílabas poéticas: <i>P'ru</i>-<i><b>li</i></b>-to que <i><b>ba</i></b>te, <i><b>ba</i></b>te.]]></feedback>
						<feedback><![CDATA[Tente outra vez! Os acentos recaem sobre a 2ª, a 5ª e a 7ª sílabas poéticas. Essa repetição cria um ritmo para os versos. No caso desta cantiga infantil, a pronúncia da palavra “pirulito” é condensada em 3 sílabas poéticas: <i>P'ru</i>-<i><b>li</i></b>-to que <i><b>ba</i></b>te, <i><b>ba</i></b>te.]]></feedback>
						<feedback><![CDATA[Muito bem! Os acentos rítmicos desses versos recaem sobre a 2ª, a 5ª e a 7ª sílabas poéticas. Essa repetição cria um ritmo para os versos. No caso desta cantiga infantil, a pronúncia da palavra “pirulito” é condensada em 3 sílabas poéticas: <i>P'ru</i>-<i>li</i>-to que <i>ba</i>te, <i>ba</i>te.]]></feedback>
						<feedback><![CDATA[Tente outra vez! Os acentos recaem sobre a 2ª, a 5ª e a 7ª sílabas poéticas. Essa repetição cria um ritmo para os versos. No caso desta cantiga infantil, a pronúncia da palavra “pirulito” é condensada em 3 sílabas poéticas: <i>P'ru</i>-<i><b>li</i></b>-to que <i><b>ba</i></b>te, <i><b>ba</i></b>te.]]></feedback>
						</feedbacks>
					<dica></dica>
					<valorpontos>13</valorpontos>
					<respcorreta>3</respcorreta>
				</questao>
				
				
				<questao>
					<enunciado>Duvido que você saiba qual é a métrica desses versos.</enunciado>
					<textorelacionado>Pirulito que bate, bate
Pirulito que já bateu
Quem gosta de mim é ela
Quem gosta dela sou eu
</textorelacionado>
					<alternativas>
						<alternativa>Sei! São 9 sílabas poéticas.</alternativa>
						<alternativa>Sei! São 8 sílabas poéticas.</alternativa>
						<alternativa>Sei! São 6 sílabas poéticas.</alternativa>
						<alternativa>Sim! São 5 sílabas poéticas.</alternativa>
						<alternativa>Sim. São 7 sílabas poéticas.</alternativa>
						</alternativas>
					<feedbacks>
						<feedback><![CDATA[Tente outra vez! O primeiro verso tem 9 sílabas comuns, mas apenas 7 sílabas poéticas, pois contam-se as sílabas a partir da pronúncia (<i>P'ru</i>-li-to que ba-te, ba-<u>te</u>) e não se conta a última sílaba átona. Todos os versos dessa quadra têm 7 sílabas poéticas.]]></feedback>
						<feedback><![CDATA[Tente outra vez! O segundo e o terceiro versos têm 8 sílabas comuns, mas apenas 7 sílabas poéticas, pois contam-se as sílabas a partir da pronúncia (<i>P'ru</i>-li-to que ba-te, ba-<u>te</u> / Quem gos-ta de mim é e-<u>la</u>) e não se conta a última sílaba átona. Todos os versos dessa quadra têm 7 sílabas poéticas.]]></feedback>
						<feedback><![CDATA[Tente outra vez! Os versos têm 7 sílabas poéticas, pois contam-se as sílabas a partir da pronúncia e não se conta a última sílaba átona. Todos os versos dessa quadra têm 7 sílabas poéticas:
<i>P'ru</i>-li-to que ba-te, ba-<u>te</u>
<i>P'ru</i>-li-to que já ba-teu
Quem gos-ta de mim é e-<u>la</u>
Quem gos-ta de-la sou eu]]>
</feedback>
						<feedback><![CDATA[Tente outra vez! Os versos têm 7 sílabas poéticas, pois contam-se as sílabas a partir da pronúncia e não se conta a última sílaba átona. Todos os versos dessa quadra têm 7 sílabas poéticas:
<i>P'ru</i>-li-to que ba-te, ba-<u>te</u>
<i>P'ru</i>-li-to que já ba-teu
Quem gos-ta de mim é e-<u>la</u>
Quem gos-ta de-la sou eu]]>
</feedback>
						<feedback><![CDATA[Muito bem! Os versos possuem 7 sílabas poéticas, pois elas são contadas a partir da pronúncia até a última sílaba tônica: 
<i>P'ru</i>-li-to que ba-te, ba-<u>te</u>
<i>P'ru</i>-li-to que já ba-teu
Quem gos-ta de mim é e-<u>la</u>
Quem gos-ta de-la sou eu]]>
</feedback>
						</feedbacks>
					<dica></dica>
					<valorpontos>14</valorpontos>
					<respcorreta>4</respcorreta>
				</questao>
			
				
				
			</questoes>
			).toString();
			
			questoesEpisodio[3] = (
			<questoes>
				<questao>
					<enunciado>Você percebe alguma relação entre a forma do verso e o que ele diz?</enunciado>
					<textorelacionado><![CDATA[	O longo som
do rio
frio.

O frio
bom
do longo rio.
“Rio na Sombra”, do livro <i>Ou isto ou aquilo</i>, da Cecília Meireles.]]></textorelacionado>
					<alternativas>
						<alternativa>Sim! Os versos longos são os que tratam da extensão do som e o rio.</alternativa>
						<alternativa>Sim! Os versos são curtos porque rio e frio são palavras pequenas.</alternativa>
						<alternativa>Não! Não existe nenhuma relação entre a forma e o conteúdo em poesia.</alternativa>
						<alternativa>Não! Não existe nenhuma repetição de sons ou de formas no poema.</alternativa>
						<alternativa>Sim! O poema tem uma métrica fixa, o que lembra o rio, que nunca sai do lugar.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Muito bem! Em poesia, costuma-se explorar as relações entre forma e sentido. Neste poema, é possível perceber que os versos maiores são os que expressam a ideia de duração do som ou do comprimento do rio.</feedback>
						<feedback><![CDATA[Tente outra vez! De fato, as palavras <i>frio</i> e <i>rio</i> são pequenas, mas isso não explica nada sobre a relação entre forma e conteúdo. Neste poema, é possível perceber que os versos maiores são os que expressam a ideia de duração do som ou do comprimento do rio.]]></feedback>
						<feedback>Tente outra vez! Em poesia, costuma-se explorar as relações entre forma e sentido. Neste poema, é possível perceber que os versos maiores são os que expressam a ideia de duração do som ou do comprimento do rio.</feedback>
						<feedback><![CDATA[Tente outra vez! Há, sim, repetição de sons (<i><u>longo</u></i>, <i><u>som</u></i>, <i><u>bom</u></i>, <i><u>rio</u></i>, <i><u>frio</u></i>) e formas (os versos maiores são os que expressam a ideia de duração do som ou do comprimento do rio)]]>.</feedback>
						<feedback><![CDATA[Tente outra vez! Este poema foi composto em <i>versos livres</i>, isto é, sem métrica fixa, mas isso não explica nada sobre a relação entre forma e conteúdo. Neste poema, é possível perceber que os versos maiores são os que expressam a ideia de duração do som ou do comprimento do rio.]]></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>15</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
				
				
				
				
				<questao>
					<enunciado>Você percebeu que nesse poema tem uma onomatopeia?</enunciado>
					<textorelacionado><![CDATA[	A avó 
vive só.
Na casa da avó
o galo liró
faz “cocorocó!”
A avó bate pão-de-ló
e anda um vento-t-o-tó
na cortina de filó.
“A Avó do Menino”, do livro <i>Ou isto ou aquilo</i>, da Cecília Meireles.]]></textorelacionado>
					<alternativas>
						<alternativa>Sim! A onomatopeia é a repetição do som final ó, criando a rima do poema.</alternativa>
						<alternativa>Sim! A onomatopeia está na palavra cocorocó, que imita o som de um galo.</alternativa>
						<alternativa>Sim! A onomatopeia está na aliteração existente nas palavras liró e avó.</alternativa>
						<alternativa>Sim! A onomatopeia está no fato de haver um número fixo de sílabas em cada verso.</alternativa>
						<alternativa>Sim! A onomatopeia é criada pela repetição do v em várias palavras do poema.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback><![CDATA[Tente outra vez! A reiteração do som final <i>ó</i> cria mesmo uma rima, mas não é uma onomatopeia. A onomatopeia é a imitação de um som por meio de uma palavra. Nesse caso, <i>cocorocó</i> é o vocábulo que imita o som emitido pelo galo.]]></feedback>
						<feedback><![CDATA[Muito bem! A onomatopeia é a imitação de um som por meio de uma palavra. Nesse caso, <i>cocorocó</i> é o vocábulo que imita o som emitido pelo galo.]]></feedback>
						<feedback><![CDATA[Tente outra vez! Há efeito de aliteração entre as palavras <i>liró</i> e <i>avó</i>, mas isso não tem nada a ver com a onomatopeia! A onomatopeia é a imitação de um som por meio de uma palavra. Nesse caso, <i>cocorocó</i> é o vocábulo que imita o som emitido pelo galo.]]></feedback>
						<feedback><![CDATA[Tente outra vez! Este poema foi composto em <i>versos livres</i>, isto é, sem métrica fixa, e isso não tem nada a ver com a onomatopeia! A onomatopeia é a imitação de um som por meio de uma palavra. Nesse caso, <i>cocorocó</i> é o vocábulo que imita o som emitido pelo galo.]]></feedback>
						<feedback><![CDATA[Tente outra vez! A repetição do <i>v</i>, no poema, cria uma aliteração e não uma onomatopeia! A onomatopeia é a imitação de um som por meio de uma palavra. Nesse caso, <i>cocorocó</i> é o vocábulo que imita o som emitido pelo galo.]]></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>16</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				
				
				<questao>
					<enunciado>Você percebeu alguma relação entre a forma do verso e o que ele diz?</enunciado>
					<textorelacionado><![CDATA[	Olha a chuva que encharca a gente.
Põe a chave na fechadura.
Fecha a porta por causa da chuva,
Olha a rua como se enche!
“Enchente”, do livro <i>Ou isto ou aquilo</i>, da Cecília Meireles.]]></textorelacionado>
					<alternativas>
						<alternativa>Sim! A variação no número de sílabas lembra a chuva, que varia entre as tempestades e a garoa.</alternativa>
						<alternativa>Não! Não existe nenhuma relação entre a forma e o conteúdo em poesia.</alternativa>
						<alternativa>Sim! A repetição do ch em várias palavras cria um som que lembra a chuva caindo.</alternativa>
						<alternativa>Sim! A repetição do f  lembra o vento que costuma acompanhar a chuva.</alternativa>
						<alternativa>Não! Não existe nenhuma repetição de sons ou de formas no poema.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback><![CDATA[Tente outra vez! Os versos têm 8 sílabas métricas, portanto não há variação no número de sílabas. A relação entre a forma e o conteúdo está na aliteração, criada pela repetição do <i>ch</i> em várias palavras do poema, que lembra o som da chuva.]]></feedback>
						<feedback><![CDATA[Tente outra vez! Em poesia, costuma-se explorar as relações entre a forma e o conteúdo. Nesses versos a relação entre a forma e o conteúdo está na aliteração, criada pela repetição do <i>ch</i> em várias palavras do poema, que lembra o som da chuva.]]></feedback>
						<feedback>Muito bem! Em poesia, costuma-se explorar as relações entre a forma e o conteúdo. </feedback>
						<feedback><![CDATA[Tente outra vez! Há apenas duas palavras com <i>f</i> no poema, o que não é suficiente para criar uma sonoridade marcante. A relação entre a forma e o conteúdo está na aliteração, criada pela repetição do <i>ch</i> em várias palavras do poema, que lembra o som da chuva.]]></feedback>
						<feedback><![CDATA[Tente outra vez! Há uma repetição do <i>ch</i> em várias palavras do poema, criando uma aliteração que lembra o som da chuva. A relação entre a forma e o conteúdo está na semelhança entre o som das palavras e o som da chuva.]]></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>17</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				
				
				<questao>
					<enunciado>Você percebeu alguma relação entre a forma do verso e o que ele diz?</enunciado>
					<textorelacionado><![CDATA[	Havia a viola da vila
A viola e o violão.
Do vilão era a viola
E da Olívia o violão.
“O violão e o vilão”, do livro <i>Ou isto ou aquilo</i>, da Cecília Meireles.]]></textorelacionado>
					<alternativas>
						<alternativa>Sim! A variação no número de sílabas do poema lembra o som do violão, que varia conforme a música.</alternativa>
						<alternativa>Não! O som das palavras vilão e violão é parecido, mas elas significam coisas muito diferentes. </alternativa>
						<alternativa>Não! Não existe nenhuma relação entre a forma e o conteúdo em poesia.</alternativa>
						<alternativa>Sim! A repetição do v lembra o som produzido por um instrumento de corda como uma viola ou um violão.</alternativa>
						<alternativa>Não! Não existe nenhuma repetição de sons ou de formas no poema.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Tente outra vez! Todos esses versos têm 7 sílabas métricas. A relação entre a forma e o conteúdo está na aliteração, criada pela repetição do v em várias palavras do poema, lembrando o som produzido por um instrumento de corda, como uma viola ou um violão.</feedback>
						<feedback>Tente outra vez! É verdade que, nesse caso, há uma semelhança nos sons e uma diferença no sentido. Mas existe, nessa estrofe, uma semelhança entre som e sentido na aliteração criada pela repetição do v em várias palavras do poema. Isso lembra o som produzido por um instrumento de corda, como uma viola ou um violão.</feedback>
						<feedback>Tente outra vez! Em poesia, costuma-se explorar as relações entre a forma e o conteúdo. Nesse caso, a relação está na aliteração, criada pela repetição do v em várias palavras do poema, lembrando o som produzido por um instrumento de corda, como uma viola ou um violão.</feedback>
						<feedback>Muito bem! Em poesia, costuma-se explorar as relações entre a forma e o conteúdo.</feedback>
						<feedback>Tente outra vez! Existe, nessa estrofe, uma semelhança entre som e sentido na aliteração criada pela repetição do v em várias palavras do poema. Isso lembra o som produzido por um instrumento de corda, como uma viola ou um violão.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>18</valorpontos>
					<respcorreta>3</respcorreta>
				</questao>
				
				
				
				
				<questao>
					<enunciado>Você percebeu alguma relação entre a forma do verso e o que ele diz?</enunciado>
					<textorelacionado><![CDATA[	Roda na rua
a roda do carro.

Roda na rua
A roda das danças.
“Roda na rua”, do livro <i>Ou isto ou aquilo</i>, da Cecília Meireles.]]></textorelacionado>
					<alternativas>
						<alternativa>Sim! A métrica irregular lembra o som de uma roda que varia conforme a velocidade.</alternativa>
						<alternativa>Sim! A repetição de sons no final dos versos forma rimas que dão ritmo ao poema.</alternativa>
						<alternativa>Não! Não existe nenhuma relação entre a forma e o conteúdo em poesia.</alternativa>
						<alternativa>Não! Não existe nenhuma repetição de sons ou de formas no poema.</alternativa>
						<alternativa>Sim! A repetição do r lembra o som produzido por uma roda em movimento.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Tente outra vez! Dois versos têm quatro sílabas poéticas e dois têm cinco, mas isso não tem nada a ver com o som de uma roda em movimento!
A relação entre a forma e o conteúdo está na aliteração, criada pela repetição do r em várias palavras do poema, sugerindo o som produzido por uma roda em movimento.
</feedback>
						<feedback>Tente outra vez! Os versos não rimam entre si, em cada uma das estrofes!
A relação entre a forma e o conteúdo está na aliteração, criada pela repetição do r em várias palavras do poema, sugerindo o som produzido por uma roda em movimento.
</feedback>
						<feedback>Tente outra vez! Em poesia, costuma-se explorar as relações entre a forma e o conteúdo. Neste caso, a relação entre a forma e o conteúdo está na aliteração, criada pela repetição do r em várias palavras do poema, sugerindo o som produzido por uma roda em movimento.</feedback>
						<feedback>Tente outra vez! Há uma grande repetição do r nesses versos. Isso cria uma semelhança entre som e sentido, pois essa repetição pode sugerir o som produzido por uma roda em movimento.</feedback>
						<feedback>Muito bem! Em poesia, costuma-se explorar as relações entre a forma e o conteúdo.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>19</valorpontos>
					<respcorreta>4</respcorreta>
				</questao>
			
				
				
			</questoes>
			).toString();
			
			questoesEpisodio[4] = (
			<questoes>
				<questao>
					<enunciado>Você acha que essa é uma carta pessoal?</enunciado>
					<textorelacionado><![CDATA[<i>Piracicaba, 16 de outubro de 1938.

Mainha,

Espero que esta encontre todos na mais perfeita saúde. Recebemos a carta do Miguel, que causou grande alegria. Estamos ajeitando tudo pra poder ir aí. Com fé em Deus, chegamos para o dia da festa. Sem mais, peço a vossa bênção.

Assinado, vosso filho Mundinho.</i>]]>
</textorelacionado>
					<alternativas>
						<alternativa>Sim. Porque é uma carta a um parente, sobre assunto familiar.</alternativa>
						<alternativa>Sim. Porque consta o nome do remetente no final da carta.</alternativa>
						<alternativa>Sim. Porque se indica o destinatário logo no início da carta.</alternativa>
						<alternativa>Sim. Porque a cidade e a data estão indicadas no início da carta.</alternativa>
						<alternativa>Sim. Porque traz uma informação ao destinatário. </alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Muito bem! A carta em questão é pessoal porque é endereçada a um parente próximo e trata de assunto familiar.</feedback>
						<feedback>Tente outra vez! O nome do remetente no final aparece em todas as cartas. A carta em questão é pessoal porque é endereçada a um parente próximo e trata de assunto familiar. </feedback>
						<feedback>Tente outra vez! A indicação do destinatário logo no início é comum às cartas em geral. A carta em questão é pessoal porque é endereçada a um parente próximo e trata de assunto familiar.</feedback>
						<feedback>Tente outra vez! A indicação do local e da data em que se escreve é comum às cartas em geral. A carta em questão é pessoal porque é endereçada a um parente próximo e trata de assunto familiar.</feedback>
						<feedback>Tente outra vez! Toda carta traz algum tipo de informação ao destinatário. A carta em questão é pessoal porque é endereçada a um parente próximo e trata de assunto familiar. </feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>20</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
			
			
				<questao>
					<enunciado>Essa carta é informal. Você sabe por quê?</enunciado>
					<textorelacionado><![CDATA[<i>Piracicaba, 16 de outubro de 1938.

Mainha,

Espero que esta encontre todos na mais perfeita saúde. Recebemos a carta do Miguel, que causou grande alegria. Estamos ajeitando tudo pra poder ir aí. Com fé em Deus, chegamos para o dia da festa. Sem mais, peço a vossa bênção.

Assinado, vosso filho Mundinho.</i>]]>
</textorelacionado>
					<alternativas>
						<alternativa>Porque a cidade e a data estão indicadas no início da carta.</alternativa>
						<alternativa>Porque se usa diminutivo para identificar destinatário e remetente.</alternativa>
						<alternativa>Porque se indica o destinatário logo no início da carta.</alternativa>
						<alternativa>Porque consta o nome do remetente no final da carta.</alternativa>
						<alternativa>Porque a carta trata de um assunto muito grave.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Tente outra vez! A indicação do local e da data em que se escreve ocorre nas cartas em geral. Uma evidência da informalidade dessa carta é o uso dos diminutivos Mainha e Mundinho. A proximidade entre remetente e destinatário e o assunto tratado permitem o uso de uma linguagem informal. </feedback>
						<feedback>Muito bem! Uma evidência da informalidade dessa carta é o uso dos diminutivos Mainha e Mundinho. A proximidade entre remetente e destinatário e o assunto tratado permitem o uso de uma linguagem informal. </feedback>
						<feedback>Tente outra vez! A indicação do destinatário logo no início é comum às cartas em geral. Uma evidência da informalidade dessa carta é o uso dos diminutivos Mainha e Mundinho. A proximidade entre remetente e destinatário e o assunto tratado permitem o uso de uma linguagem informal. </feedback>
						<feedback>Tente outra vez! O nome do remetente no final aparece em todas as cartas. Uma evidência da informalidade dessa carta é o uso dos diminutivos Mainha e Mundinho. A proximidade entre remetente e destinatário e o assunto tratado permitem o uso de uma linguagem informal. </feedback>
						<feedback>Tente outra vez! Um assunto grave, em geral, é tratado com linguagem formal. Mas não é este o caso do exemplo, em que um filho escreve a sua mãe, anunciando sua chegada. A proximidade entre remetente e destinatário e o assunto tratado permitem o uso de uma linguagem informal. Uma evidência dessa informalidade é o uso dos diminutivos Mainha e Mundinho.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>21</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
							
							
							
				<questao>
					<enunciado>Você disse que está acostumado a ler carta de leitor. Eu não sei muito bem... Como é uma carta de leitor?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>É uma carta lida apenas por um destinatário, que o remetente conhece.</alternativa>
						<alternativa>É uma carta que se envia a um amigo, comentando matéria de jornal.</alternativa>
						<alternativa>É uma carta enviada a um jornal ou revista com comentários do leitor.</alternativa>
						<alternativa>É uma carta que traz apenas notícias pessoais sobre o remetente.</alternativa>
						<alternativa>É uma carta que um jornal ou uma revista envia a seus leitores.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Tente outra vez! A carta de leitor é publicada em uma seção específica de um jornal ou revista e traz comentários do remetente sobre algum assunto tratado nesse jornal ou revista. O destinatário é a redação desse jornal ou revista e seus leitores, assim a carta é lida por muitas pessoas e, provavelmente, muitas delas são desconhecidas do remetente.</feedback>
						<feedback>Tente outra vez! A carta de leitor comenta algum assunto tratado em um jornal ou revista, mas é enviada ao próprio jornal ou revista, que tem uma seção específica para a publicação dessas cartas.</feedback>
						<feedback>Muito bem! A carta de leitor traz comentários do remetente sobre algum assunto tratado em um jornal ou uma revista. É publicada em uma seção específica desse jornal ou dessa revista.</feedback>
						<feedback>Tente outra vez! A carta de leitor é publicada em uma seção específica de um jornal ou revista e pode até trazer uma informação pessoal relevante sobre o remetente, mas, tipicamente, traz comentários sobre alguma matéria publicada anteriormente.</feedback>
						<feedback>Tente outra vez! É o contrário. É uma carta escrita por um leitor e enviada a um jornal ou revista. Essa carta traz comentários do remetente sobre algum assunto tratado nesse jornal ou revista e é publicada em uma seção específica.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>22</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
							
							
				<questao>
					<enunciado>Veja a carta que achei nos guardados do meu pai. É uma carta comercial?</enunciado>
					<textorelacionado><![CDATA[<i>Barra, 12 de outubro de 1935.

Ilustríssimo Senhor Raimundo Nonato

Recebemos o pedido de Vossa Senhoria no dia 10 do mês corrente e já providenciamos a remessa do material solicitado, que deverá chegar à Fazenda Boa Sorte em cerca de 15 dias.
Agradecemos por ter procurado nossos serviços. Estamos à disposição de Vossa Senhoria para novos pedidos.
Cordialmente,
Ermelindo Azevedo de Mello
Gerente do Armazém Santa Luzia</i>]]>
</textorelacionado>
					<alternativas>
						<alternativa>Sim. Porque a cidade e a data estão indicadas no início da carta.</alternativa>
						<alternativa>Sim. Porque consta o nome do remetente no final da carta.</alternativa>
						<alternativa>Sim. Porque se indica o destinatário logo no início da carta.</alternativa>
						<alternativa>Sim. Porque trata de negócios entre um comerciante e seu cliente.</alternativa>
						<alternativa>Sim. Porque traz uma informação do remetente ao destinatário.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Tente outra vez! A indicação do local e da data em que se escreve é comum às cartas em geral. A carta em questão é comercial pessoal porque é enviada por um estabelecimento comercial a um cliente e trata de negócios. </feedback>
						<feedback>Tente outra vez! O nome do remetente no final aparece em todas as cartas. A carta em questão é comercial porque é enviada por um estabelecimento comercial a um cliente e trata de negócios.</feedback>
						<feedback>Tente outra vez! A indicação do destinatário logo no início é comum às cartas em geral. A carta em questão é comercial porque é enviada por um estabelecimento comercial a um cliente e trata de negócios. </feedback>
						<feedback>Muito bem! A carta em questão é comercial porque é enviada por um estabelecimento comercial a um cliente e trata de negócios. </feedback>
						<feedback>Tente outra vez! Toda carta traz algum tipo de informação do remetente ao destinatário A carta em questão é comercial porque é enviada por um estabelecimento comercial a um cliente e trata de negócios.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>23</valorpontos>
					<respcorreta>3</respcorreta>
				</questao>
				
				
				
				<questao>
					<enunciado>Veja o que achei nos guardados do meu pai. Eu acho que a linguagem dessa carta é formal. Você concorda comigo?</enunciado>
					<textorelacionado><![CDATA[<i>Barra, 12 de outubro de 1935.

Ilustríssimo Senhor Raimundo Nonato

Recebemos o pedido de Vossa Senhoria no dia 10 do mês corrente e já providenciamos a remessa do material solicitado, que deverá chegar à Fazenda Boa Sorte em cerca de 15 dias.
Agradecemos por ter procurado nossos serviços. Estamos à disposição de Vossa Senhoria para novos pedidos.
Cordialmente,
Ermelindo Azevedo de Mello
Gerente do Armazém Santa Luzia</i>]]>
</textorelacionado>
					<alternativas>
						<alternativa>Sim. Porque a cidade e a data estão indicadas no início da carta.</alternativa>
						<alternativa>Sim. Porque consta o nome do remetente no final da carta.</alternativa>
						<alternativa>Sim. Porque se indica o destinatário logo no início da carta.</alternativa>
						<alternativa>Sim. Porque essa carta é escrita a uma autoridade pública.</alternativa>
						<alternativa>Sim. Porque o destinatário é tratado por Ilustríssimo Senhor e Vossa Senhoria.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Tente outra vez! A indicação do local e da data em que se escreve ocorre nas cartas em geral. Uma evidência de que a carta é formal é o tratamento usado para o destinatário: Ilustríssimo Senhor e Vossa Senhoria. Esse tratamento formal é adequado ao tipo de relação entre remetente e destinatário e ao assunto tratado na carta.</feedback>
						<feedback>Tente outra vez! O nome do remetente no final aparece em todas as cartas. Uma evidência de que a carta é formal é o tratamento usado para o destinatário: Ilustríssimo Senhor e Vossa Senhoria. Esse tratamento formal é adequado ao tipo de relação entre remetente e destinatário e ao assunto tratado na carta.</feedback>
						<feedback>Tente outra vez! A indicação do destinatário logo no início é comum às cartas em geral. Uma evidência de que a carta é formal é o tratamento usado para o destinatário: Ilustríssimo Senhor e Vossa Senhoria. Esse tratamento formal é adequado ao tipo de relação entre remetente e destinatário e ao assunto tratado na carta.</feedback>
						<feedback>Tente outra vez! Usa-se linguagem formal quando se escreve a uma autoridade, mas não é esse o caso, pois Seo Raimundo não é uma autoridade pública. A carta é formal porque o assunto é impessoal e a relação entre remetente e destinatário (um comerciante e seu cliente) é impessoal e distante. Uma evidência de que a carta é formal é o tratamento usado para o destinatário, Ilustríssimo Senhor e Vossa Senhoria, adequado à situação.</feedback>
						<feedback>Muito bem! Uma evidência de que a carta é formal é o tratamento usado para o destinatário: Ilustríssimo Senhor e Vossa Senhoria. Esse tratamento formal é adequado ao tipo de relação entre remetente e destinatário e ao assunto tratado na carta.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>24</valorpontos>
					<respcorreta>4</respcorreta>
				</questao>
			
			
				
			</questoes>
			).toString();
			
			
			
			
			
						questoesEpisodio[5] = (
			<questoes>
			
			

	
	
	<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Por que você não conhece a palavra 'adjutório'?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque é uma palavra antiga que poucas pessoas ainda usam.</alternativa>
			<alternativa>Porque é uma palavra usada somente no Nordeste do Brasil.</alternativa>
			<alternativa>Porque é uma palavra usada somente na zona rural.</alternativa>
			<alternativa>Porque a palavra foi mal pronunciada; o correto é ajutório.</alternativa>
			<alternativa>Porque é uma palavra usada somente por analfabetos.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! Adjutório é uma palavra antiga, pouco usada nos dias de hoje. Em seu lugar usamos ajuda. É um exemplo de como a língua muda: certas palavras passam a ser pouco empregadas e acabam desaparecendo do uso.</feedback>
			<feedback>Tente outra vez! Existe muita variação regional no português do Brasil, mas não é o caso aqui. Pedro e Carolina não conheciam adjutório porque é uma palavra antiga, pouco usada nos dias de hoje. Em seu lugar usamos ajuda. É um exemplo de como a língua muda: certas palavras passam a ser pouco empregadas e acabam desaparecendo do uso.</feedback>
			<feedback>Tente outra vez! Realmente, existem palavras próprias do vocabulário rural, mas não é o caso aqui. Pedro e Carolina não conheciam adjutório porque é uma palavra antiga, pouco usada nos dias de hoje. Em seu lugar usamos ajuda. É um exemplo de como a língua muda: certas palavras passam a ser pouco empregadas e acabam desaparecendo do uso.</feedback>
			<feedback>Tente outra vez! Existem as duas pronúncias: adjutório e ajutório. Pedro e Carolina não conheciam essa palavra porque ela é antiga, pouco usada nos dias de hoje. Em seu lugar usamos ajuda. É um exemplo de como a língua muda: certas palavras passam a ser pouco empregadas e acabam desaparecendo do uso.</feedback>
			<feedback>Tente outra vez! Essa palavra já teve amplo uso entre analfabetos e pessoas escolarizadas. Pedro e Carolina não a conheciam porque é uma palavra antiga, pouco usada nos dias de hoje. Em seu lugar usamos ajuda. É um exemplo de como a língua muda: certas palavras passam a ser pouco empregadas e acabam desaparecendo do uso.</feedback>
			</feedbacks>
			<dica></dica>
			<valorpontos>25</valorpontos>
			<respcorreta>0</respcorreta>
	</questao>


<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Por que você não conhece a palavra 'vosmecê'?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque vosmecê é uma forma usada apenas na zona rural.</alternativa>
			<alternativa>Porque vosmecê é uma forma antiga do português, que não é mais usada.</alternativa>
			<alternativa>Porque vosmecê é uma forma usada apenas no Estado da Bahia.</alternativa>
			<alternativa>Porque vosmecê é uma palavra estrangeira, que o português adotou.</alternativa>
			<alternativa>Porque vosmecê é uma forma usada apenas por analfabetos.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Realmente, há palavras próprias do vocabulário rural, mas não é o caso aqui.  Trata-se de uma forma de tratamento antiga que teve uso geral no Brasil. O vosmecê do passado deu o você de hoje: Vossa Mercê > vosmecê > você. E não para aí: você costuma ser reduzido a ocê ou cê. É um exemplo de como a língua muda com o passar do tempo.</feedback>
			<feedback>Muito bem! O episódio se passa em uma época antiga e nas falas ocorrem formas do português que não são mais usadas. O vosmecê do passado deu o você de hoje: Vossa Mercê > vosmecê > você. E não para aí: você costuma ser reduzido a ocê ou cê. É um exemplo de como a língua muda com o passar do tempo.</feedback>
			<feedback>Tente outra vez! Realmente, há palavras de uso regional, mas não é esse o caso. O vosmecê é uma forma de tratamento antiga que teve uso geral no Brasil. O vosmecê do passado deu o você de hoje: Vossa Mercê > vosmecê > você. E não para aí: você costuma ser reduzido a ocê ou cê. É um exemplo de como a língua muda com o passar do tempo.</feedback>
			<feedback>Tente outra vez! Realmente, há palavras estrangeiras incorporadas ao português (como hambúrguer, por exemplo). Mas não é esse o caso. Vosmecê é uma forma de tratamento antiga do português. O vosmecê do passado deu o você de hoje: Vossa Mercê > vosmecê > você. E não para aí: você costuma ser reduzido a ocê ou cê. É um exemplo de como a língua muda com o passar do tempo.</feedback>
			<feedback>Tente outra vez! Vosmecê é uma forma de tratamento antiga, que tinha uso geral entre os falantes da língua. O vosmecê do passado deu o você de hoje: Vossa Mercê > vosmecê > você. E não para aí: você costuma ser reduzido a ocê ou cê. É um exemplo de como a língua muda com o passar do tempo.</feedback>
			</feedbacks>
			<dica></dica>
			<valorpontos>26</valorpontos>
			<respcorreta>1</respcorreta>
	</questao>


<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Por que você não conhece a expressão 'Qual a sua graça?' ?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque só na Bahia se usa graça com o significado de nome.</alternativa>
			<alternativa>Porque só na zona rural se usa graça com o significado de nome.</alternativa>
			<alternativa>Porque o uso da palavra graça com o significado de nome é antigo.</alternativa>
			<alternativa>Porque só os analfabetos usam a palavra graça com o significado de nome.</alternativa>
			<alternativa>Porque a palavra graça nunca teve esse significado em português.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Há muitas palavras de uso regional, mas não é esse o caso. Pedro e Carolina não entenderam porque é um uso antigo da língua. Antigamente era comum perguntar “qual a sua graça?” para saber o nome de uma pessoa. Esse é um exemplo de como a língua muda com o passar do tempo.</feedback>
			<feedback>Tente outra vez! Há palavras próprias do vocabulário rural, mas não é esse o caso. A palavra graça com o significado de nome teve amplo uso no português. Trata-se de um uso antigo, que não se conserva na língua. Esse é um exemplo de como a língua muda com o passar do tempo.</feedback>
			<feedback>Muito bem! Antigamente era comum perguntar “qual a sua graça?” para saber o nome de uma pessoa. Hoje não encontramos mais esse uso. Esse é um exemplo de como a língua muda com o passar do tempo.</feedback>
			<feedback>Tente outra vez! O uso da palavra graça com o significado de nome era comum entre os falantes, analfabetos ou escolarizados. Pedro e Carolina não entenderam porque é um uso antigo da língua. Esse é um exemplo de como a língua muda com o passar do tempo.</feedback>
			<feedback>Tente outra vez! A palavra graça com o significado de nome teve amplo uso no português. Trata-se de um uso antigo, que não se conserva na língua. Esse é um exemplo de como a língua muda com o passar do tempo.</feedback>
			</feedbacks>
			<dica></dica>
			<valorpontos>27</valorpontos>
			<respcorreta>2</respcorreta>
	</questao>



<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Por que Dona Joana não reconhece a palavra 'computador'?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Por que é uma palavra usada apenas por técnicos em informática.</alternativa>
			<alternativa>Porque é um termo de uso regional, encontrado apenas no Sudeste.</alternativa>
			<alternativa>Porque é uma palavra nova, usada apenas pelos falantes jovens.</alternativa>
			<alternativa>Porque ela surgiu não faz muito tempo, com o avanço da tecnologia.</alternativa>
			<alternativa>Porque é uma palavra conhecida apenas por quem aprendeu inglês.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Há muitos termos técnicos na língua, usados sobretudo pelos especialistas, mas não é esse o caso. Computador é uma palavra de circulação mais ampla – é usada não só pelos usuários dessa tecnologia, mas também por quem não é usuário. O termo é relativamente novo: foi criado a partir do inglês computer e entrou na língua ao mesmo tempo em que o computador se tornava conhecido. Isso mostra como o vocabulário da língua se renova para dar conta de novas situações.</feedback>
			<feedback>Tente outra vez! Há muitas palavras de uso regional em nossa língua, mas não é esse o caso. A palavra computador tem uso geral no Brasil, não só entre os usuários da informática, mas também por quem não é usuário. Dona Joana não conhecia o termo porque ele é relativamente novo: foi criado a partir do inglês computer e entrou na língua ao mesmo tempo em que o computador se tornava conhecido. Esse é um exemplo de como o vocabulário da língua se renova para dar conta de novas situações.</feedback>
			<feedback>Tente outra vez! De fato, computador é uma palavra relativamente nova, mas não é usada apenas por jovens. O termo tem uso geral entre os usuários da informática e também entre não usuários. Essa palavra foi criada a partir do inglês computer e entrou na língua ao mesmo tempo em que essa inovação tecnológica se tornava conhecida. Esse é um exemplo de como o vocabulário da língua se renova para dar conta de novas situações. </feedback>
			<feedback>Muito bem! A palavra computador é relativamente nova: entrou na língua ao mesmo tempo em que essa inovação tecnológica se tornava conhecida. O termo foi criado a partir do inglês computer e é um exemplo de como o vocabulário da língua se renova para dar conta de novas situações.</feedback>
			<feedback>Tente outra vez! A palavra computador realmente foi criada a partir do inglês computer, mas já integra nosso vocabulário, com as características de nossa língua. O termo tem uso geral entre os usuários da informática e também entre não usuários. Trata-se de uma palavra relativamente nova, que entrou na língua ao mesmo tempo em que o computador se tornava conhecido. Esse é um exemplo de como o vocabulário se renova para dar conta de novas situações.</feedback>
			</feedbacks>
			<dica></dica>
			<valorpontos>28</valorpontos>
			<respcorreta>3</respcorreta>
	</questao>



<questao>
		<dialogos>
			<quantidade>0</quantidade>
		</dialogos>
		<enunciado>Será que existe a palavra 'deletar' em português?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. Mas é uma palavra usada apenas por falantes jovens.</alternativa>
			<alternativa>Sim. Ela sempre existiu, pois o vocabulário de uma língua nunca muda.</alternativa>
			<alternativa>Sim. Mas é uma palavra usada apenas por técnicos em informática.</alternativa>
			<alternativa>Sim. Mas é uma palavra antiga que quase não se usa mais.</alternativa>
			<alternativa>Sim. É uma palavra nova, que surgiu com o uso do computador.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A palavra deletar, que significa apagar, é usada informalmente não só por jovens mas também por pessoas mais velhas. Essa palavra veio do inglês e foi incorporada à língua portuguesa recentemente, com a difusão do uso do computador. Esse é um exemplo de como o vocabulário da língua muda com o passar do tempo.</feedback>
			<feedback>Tente outra vez! As línguas mudam em seus vários aspectos, inclusive no vocabulário. A palavra deletar é um exemplo disso – foi incorporada ao português recentemente, com a difusão do uso do computador. O termo, que veio do inglês, significa apagar e é usado informalmente pelos usuários de computador, em geral.</feedback>
			<feedback>Tente outra vez! Há muitos termos técnicos na língua, usados sobretudo por especialistas, mas não é esse o caso. A palavra deletar, que significa apagar, é usada informalmente pelos usuários de computador, em geral. O termo veio do inglês e foi incorporado à língua portuguesa recentemente, com a difusão do uso do computador. Esse é um exemplo de como o vocabulário da língua muda com o passar do tempo.</feedback>
			<feedback>Tente outra vez! A palavra deletar entrou na língua recentemente, com a difusão do uso do computador. O termo, que veio do inglês, significa apagar e é usado informalmente pelos usuários de computador, em geral. Esse é um exemplo de como o vocabulário da língua muda com o passar do tempo.</feedback>
			<feedback>Muito bem! A palavra deletar, que significa apagar, veio do inglês e foi incorporada à língua portuguesa recentemente, com a difusão do uso do computador. O termo é usado informalmente pelos usuários de computador, em geral. Esse é um exemplo de como o vocabulário da língua muda com o passar do tempo.</feedback>
			</feedbacks>
			<dica></dica>
			<valorpontos>29</valorpontos>
			<respcorreta>4</respcorreta>
	</questao>




</questoes>
			).toString();
	}

		
	}
}