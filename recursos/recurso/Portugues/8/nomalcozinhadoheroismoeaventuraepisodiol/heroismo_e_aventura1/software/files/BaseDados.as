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
			questoesEpisodio[0] = (<![CDATA[
			<questoes>
				<questao>
					<enunciado>Veja a descrição que um missionário fez durante sua missão na Angola e no Congo. A descrição é bastante detalhada! Isso indica que ele viu mesmo esse monstro, não é?</enunciado>
					<textorelacionado>O chamado cavalo-marinho, por ser semelhante ao terrestre na cabeça e nas costas, é, porém, classificado entre os peixes, de maneira que se come livremente nos dias de abstinência.
	O focinho deste monstro é aterrorizador. A força das pernas, que acabam num tamanco de forma redonda, parece sem limites, pois com elas faz virar e reduz a pedaços qualquer embarcação daquelas que se usam nos rios.
	Fonte: MONTECUCCOLO, João Antonio Cavazzi de. Descrição histórica dos três reinos de Congo, Matamba e Angola. (trad) Graciano Maria de Leguzzano. (1ª edição 1695). Lisboa: Junta de Investigações do Ultramar, 1965, p. 75.</textorelacionado>
					<alternativas>
						<alternativa>Não! O desconhecimento do mundo faz com que as pessoas imaginem o que pode ser encontrado ou descrevam como monstros seres vistos pela primeira vez.</alternativa>
						<alternativa>Sim! Os relatos dos viajantes comprovam que existiam vários monstros espalhados pelo mundo, principalmente na Ásia, na África e na América, os quais foram exterminados.</alternativa>
						<alternativa>Sim! Os viajantes tentam descrever, com o máximo de detalhes possível, os monstros encontrados e levam essas criaturas para a Europa a fim de comprovar a veracidade de seus relatos.</alternativa>
						<alternativa>Não! As descrições contidas nos livros dos viajantes são reconhecidamente ficcionais. Todos sabem que esses seres não poderiam existir na realidade, mesmo nos lugares mais distantes da Europa.</alternativa>
						<alternativa>Sim! É descrito um monstro muito conhecido e temido, que vivia nas regiões mais profundas do Oceano Atlântico. Ele foi responsável pela destruição de muitas embarcações. </alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Muito bem! Na tentativa de explicar como eram os seres vivos das novas terras descobertas, os viajantes acabavam descrevendo-os como monstros (ou com características monstruosas) por nunca os terem visto. A falta de contato com o animal, muitas vezes, os impedia de fazer observações mais rigorosas. Hoje, supõe-se que o animal visto tenha sido um hipopótamo.</feedback>
						<feedback>Não foi desta vez! Colonizadores exterminaram algumas espécies encontradas, mas nada indica que eles fossem monstros. Na tentativa de explicar como eram os seres vivos das novas terras descobertas, os viajantes acabavam descrevendo-os como monstros (ou com características monstruosas) por nunca os terem visto. A falta de contato com o animal, muitas vezes, os impedia de fazer observações rigorosas.</feedback>
						<feedback>Não foi desta vez! Os viajantes levaram algumas espécies nativas para a Europa, mas não eram seres monstruosos. Na tentativa de explicar como eram os seres vivos das novas terras descobertas, os viajantes acabavam descrevendo-os como monstros (ou com características monstruosas) por nunca os terem visto. A falta de contato com o animal, muitas vezes, os impedia de fazer observações rigorosas.</feedback>
						<feedback>Não foi desta vez! Na época, muitas pessoas acreditavam na existência dos monstros descritos nos relatos dos viajantes. Provavelmente, até mesmo seus próprios autores criam no que escreviam. Na tentativa de explicar como eram os seres vivos das novas terras descobertas, os viajantes acabavam descrevendo-os como monstros (ou com características monstruosas) por nunca os terem visto. A falta de contato com o animal, muitas vezes, os impedia de fazer observações rigorosas.</feedback>
						<feedback>Não foi desta vez! A falta de contato com o animal, muitas vezes, levava os viajantes a apresentar como monstros, seres desconhecidos. A impossibilidade de fazer observações rigorosas e o desejo de explicar como eram os seres vivos das novas terras descobertas, levava-os a descrevê-los como monstros (ou com características monstruosas). </feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
			
				<questao>
					<enunciado>Veja a imagem que encontrei em um livro de viajantes.
Essa imagem confirma a existência de monstros, não é?#img:img1.jpg#	</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Sim! Os viajantes costumam fotografar os animais que veem para ilustrar seus relatos, a fim de que todos conheçam os seres monstruosos que vivem fora da Europa.</alternativa>
						<alternativa>Não! As imagens são produzidas a partir da imaginação de seus autores ou a partir da observação pouco rigorosa de seres e animais existentes fora da Europa.</alternativa>
						<alternativa>Sim! A figura é a reprodução fiel de um dos seres que existia na África, fruto do cruzamento entre pessoas e animais, apresentando, por isso, algumas características humanas, como seios e nariz.</alternativa>
						<alternativa>Não! As imagens têm função meramente ornamental, visando tornar o livro mais bonito. Elas jamais foram vistas pelos europeus como comprovação da existência de seres monstruosos.</alternativa>
						<alternativa>Não! Todos sabem que os monstros são frutos de crenças populares e não passam de lendas. Ninguém acredita que esses seres possam realmente existir.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! No século XVI, ainda não existia a fotografia. A primeira fotografia foi feita em 1826 pelo francês Nièpce. Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as ilustrações atestam a dificuldade de compreender seres que não existiam na Europa.</feedback>
						<feedback>Muito bem! Além de descrições escritas, os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as imagens atestam a dificuldade de compreender seres que não existiam na Europa.</feedback>
						<feedback>Não foi desta vez! Não é possível haver cruzamento entre seres humanos e animais. Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter encontrado nas novas terras. Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as ilustrações atestam a dificuldade de compreender seres que não existiam na Europa.</feedback>
						<feedback>Não foi desta vez! As imagens eram inseridas nos livros na tentativa de dar maior credibilidade aos relatos, dando a ver os seres que viveriam em locais distantes.  Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as ilustrações atestam a dificuldade de compreender seres que não existiam na Europa. Alguns viajantes e muitos de seus leitores acreditavam na existência de seres monstruosos.</feedback>
						<feedback>Não foi desta vez! Alguns viajantes e muitos de seus leitores acreditavam na existência de seres monstruosos. Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as ilustrações atestam a dificuldade de compreender seres que não existiam na Europa.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Veja a imagem que encontrei em um livro de viajantes.
Essa imagem confirma a existência de monstros, não é?#img:img2.jpg#
					</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Não!Ninguém acredita que esses seres possam realmente existir; essa imagem é fruto de crenças populares, que não passam de lendas.</alternativa>
						<alternativa>Sim! Os viajantes costumam capturar os monstros que encontram e, quando isso não é possível, desenham-nos a fim de que todos os conheçam. </alternativa>
						<alternativa>Não! As imagens são produzidas a partir da observação superficial de seres e animais ou mesmo da imaginação de seus autores. </alternativa>
						<alternativa>Não! As imagens têm função meramente ornamental, visando  tornar o livro mais bonito. Elas jamais foram vistas pelos europeus como a comprovação da existência de seres monstruosos.</alternativa>
						<alternativa>Sim! A figura apresenta um dos monstros que existia no litoral africano, fruto do cruzamento entre vários animais, apresentando, por isso, características de peixe e ave.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Alguns viajantes e muitos de seus leitores acreditavam na existência de seres monstruosos. Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as imagens atestam a dificuldade de compreender seres que não existiam na Europa.</feedback>
						<feedback>Não foi desta vez! Os viajantes capturavam algumas espécies inexistentes na Europa, mas em nenhuma delas havia seres monstruosos. Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto.  Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as imagens atestam a dificuldade de compreender seres que não existiam na Europa.</feedback>
						<feedback>Muito bem! Além de descrições escritas, os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação, em outros são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as imagens atestam a dificuldade de compreender seres que não existiam na Europa.</feedback>
						<feedback>Não foi desta vez! As imagens eram inseridas nos livros na tentativa de dar maior credibilidade aos relatos, dando a ver os seres que viveriam em locais distantes. Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as imagens atestam a dificuldade de compreender seres que não existiam na Europa. Alguns viajantes e muitos de seus leitores acreditavam na existência de seres monstruosos.</feedback>
						<feedback>Não foi desta vez! Não é possível haver cruzamento entre peixe e ave. Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as imagens atestam a dificuldade de compreender seres que não existiam na Europa.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Veja a descrição que o missionário João Antonio Cavazzi fez durante sua missão na Angola e no Congo. O fato de o autor ter feito uma descrição bastante detalhada indica que ele viu mesmo essa criatura, não é?</enunciado>
					<textorelacionado>Em primeiro lugar, um há que os europeus chamam peixe-mulher e os naturais ngulu-a-maza, bonito de nome, mas horrendo de forma. Tem o focinho escancarado, mas pequeno em comparação com um outro que parece ser o macho. (...) 
	Os dentes parecem-se com os do cão; as barbatanas à semelhança de braços, chegam até a metade do corpo, acabando com cinco dedos de matéria cartilaginosa e mal feitos. O rabo tem mais de 3 palmos, e os seios, donde suponho vir o nome, parecem-se com os de uma mulher.
	(...)
	Tal peixe, como pude verificar, tem uma pele que desce da nuca até ao começo do rabo, cobrindo-o à maneira de manta. Julgo que ele se enrola nela e também abriga suas crias para as amamentar. (...)
	Fonte: MONTECUCCOLO, João Antonio Cavazzi de. Descrição histórica dos três reinos de Congo, Matamba e Angola. (trad) Graciano Maria de Leguzzano. (1ª edição 1695). Lisboa: Junta de Investigações do Ultramar, 1965, p. 71. </textorelacionado>
					<alternativas>
						<alternativa>Não! Todos sabem que esses seres não poderiam existir na realidade, mesmo nos lugares mais distantes da Europa, pois as descrições dos viajantes não passam de textos ficcionais.</alternativa>
						<alternativa>Sim! Os relatos dos viajantes comprovam que existiam vários monstros espalhados pelo mundo, principalmente na Ásia, na África e na América, que foram exterminados.</alternativa>
						<alternativa>Sim! Os viajantes tentam descrever com o máximo de veracidade possível os monstros encontrados e ainda os levam para a Europa a fim de comprovar seus relatos.</alternativa>
						<alternativa>Não! Muitos viajantes descrevem como monstros seres vistos pela primeira vez, pois observavam com pouco rigor seres e animais presentes no novo mundo ou mesmo os imaginavam.</alternativa>
						<alternativa>Sim! É descrito um monstro que existia na costa da África, fruto do cruzamento entre pessoas e animais, apresentando, por isso, algumas características humanas como seios e nariz.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Muitas pessoas acreditavam na existência dos monstros descritos nos relatos dos viajantes. Provavelmente, até mesmo seus próprios autores criam no que escreviam. Na tentativa de explicar como eram os seres vivos das novas terras descobertas, os viajantes acabavam descrevendo-os como monstros (ou com características monstruosas) por nunca os terem visto. A falta de contato com o animal, muitas vezes, os impediam de fazer observações mais rigorosas.</feedback>
						<feedback>Não foi desta vez! Colonizadores exterminaram algumas espécies encontradas, mas não se pode atestar a existência de monstros. Na tentativa de explicar como eram os seres vivos das novas terras descobertas, os viajantes acabavam descrevendo-os como monstros (ou com características monstruosas) por nunca os terem visto. A falta de contato com o animal, muitas vezes, os impediam de fazer observações mais rigorosas.</feedback>
						<feedback>Não foi desta vez! Os viajantes até levaram algumas espécies para a Europa, mas não seres monstruosos. Na tentativa de explicar como eram os seres vivos das novas terras descobertas, os viajantes acabavam descrevendo-os como monstros (ou com características monstruosas) por nunca os terem visto. A falta de contato com o animal, muitas vezes, os impediam de fazer observações mais rigorosas.</feedback>
						<feedback>Muito bem! Na tentativa de explicar como eram os seres vivos das novas terras descobertas, os viajantes acabavam descrevendo-os como monstros (ou com características monstruosas) por nunca os terem visto. A falta de contato com o animal, muitas vezes, os impediam de fazer observações mais rigorosas. </feedback>
						<feedback>Não foi desta vez! Não é possível haver cruzamento entre seres humanos e animais. Na tentativa de explicar como eram os seres vivos das novas terras descobertas, os viajantes acabavam descrevendo-os como monstros ou com características monstruosas por nunca os terem visto ou mesmo por fazerem uma observação pouco rigorosa de alguns animais desconhecidos.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>3</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Veja a imagem que encontrei em um livro de viajantes.
Essa imagem confirma a existência de monstros, não é?#img:img3.jpg#
					</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Não!Ninguém acredita que esses seres possam realmente existir; essa imagem é fruto de crenças populares, que não passam de lendas.</alternativa>
						<alternativa>Sim! Os viajantes costumam capturar os monstros que encontram e, quando isso não é possível, desenham-nos a fim de que todos os conheçam. </alternativa>
						<alternativa>Sim! A figura apresenta um dos monstros que existia no litoral africano, fruto do cruzamento entre vários animais, apresentando, por isso, características de cavalo, elefante e porco.</alternativa>
						<alternativa>Não! As imagens têm função meramente ornamental, visando a tornar o livro mais bonito. Elas jamais foram vistas pelos europeus como a comprovação da existência de seres monstruosos.</alternativa>
						<alternativa>Não! As imagens são produzidas a partir da observação superficial de seres e animais ou mesmo da imaginação de seus autores. </alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Alguns viajantes e muitos de seus leitores acreditavam na existência de seres monstruosos. Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as imagens atestam a dificuldade de compreender seres que não existiam na Europa.</feedback>
						<feedback>Não foi desta vez! Os viajantes capturavam algumas espécies inexistentes na Europa, mas em nenhuma delas havia seres monstruosos. Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto.  Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as imagens atestam a dificuldade de compreender seres que não existiam na Europa.</feedback>
						<feedback>Não foi desta vez! Não é possível haver cruzamento entre espécies diferentes (como cavalo, elefante e porco). A figura representa um ser descrito como monstro e conhecido como “cavalo-marinho”. Hoje, supõe-se que o animal visto tenha sido um hipopótamo. Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as imagens atestam a dificuldade de compreender seres que não existiam na Europa.</feedback>
						<feedback>Não foi desta vez! As imagens eram inseridas nos livros na tentativa de dar maior credibilidade aos relatos, dando a ver os seres que viveriam em locais distantes. Os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação; em outros, são resultado das dificuldades de observar de perto e com detalhe alguns animais. De qualquer forma, as imagens atestam a dificuldade de compreender seres que não existiam na Europa. Alguns viajantes e muitos de seus leitores acreditavam na existência de seres monstruosos.</feedback>
						<feedback>Muito bem! Além de descrições escritas, os viajantes produziam desenhos ou encomendavam imagens que mostravam o que eles acreditavam ter visto. Em alguns casos, as imagens são fruto da imaginação, em outros são resultado das dificuldades de observar de perto e com detalhe alguns animais. A figura representa um ser descrito como monstro e conhecido como “cavalo-marinho”. Hoje, supõe-se que o animal visto tenha sido um hipopótamo.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>4</respcorreta>
				</questao>
				
			</questoes>
			]]> ).toString();
	
	
			questoesEpisodio[1] = (<![CDATA[
			<questoes>
				<questao>
					<enunciado>Tenho conversado com vários viajantes que estiveram na América e eles dizem que o Brasil é como o paraíso na Terra. Por que eles dizem isso?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Porque a natureza lembra a imagem que os europeus têm do éden.</alternativa>
						<alternativa>Porque lá há muitos padres catequizando os índios.</alternativa>
						<alternativa>Porque lá as pessoas não envelhecem.</alternativa>
						<alternativa>Porque lá as feras convivem harmonicamente.</alternativa>
						<alternativa>Porque as tempestades tropicais lembram a ira divina.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Muito bem! Alguns viajantes, ao chegarem ao Brasil, acreditavam ter encontrado o paraíso, que, em sua imaginação, assemelhava-se à natureza tropical. Alguns acharam semelhanças entre Adão e Eva e os índios por eles andarem nus e, aparentemente, não trabalharem.</feedback>
						<feedback>Não foi desta vez! A presença de padres envolvidos com a conversão dos índios relacionava-se à ideia de salvação de suas almas, mas não fazia com que o paraíso fosse localizado na América. Alguns viajantes, ao chegarem ao Brasil, acreditavam ter encontrado o paraíso, que, em sua imaginação, assemelhava-se à natureza tropical. Alguns acharam semelhanças entre Adão e Eva e os índios por eles andarem nus e, aparentemente, não trabalharem.</feedback>
						<feedback>Não foi desta vez! Embora os viajantes acreditassem que, devido ao clima, os habitantes da nova terra podiam viver mais, a razão pela qual pensavam ter encontrado o paraíso, se deve ao fato de que, em sua imaginação, o paraíso assemelhava-se à natureza tropical. Alguns acharam semelhanças entre Adão e Eva e os índios por eles andarem nus e, aparentemente, não trabalharem.</feedback>
						<feedback>Não foi desta vez! A ideia de que o paraíso era um local onde as feras conviviam harmonicamente era recorrente, mas não era o motivo que fazia com que os viajantes imaginassem que o Brasil era o paraíso. Essa crença existia, pois alguns viajantes, ao chegarem ao Brasil, acreditavam ter encontrado o paraíso, que, em sua imaginação, assemelhava-se à natureza tropical. Alguns acharam semelhanças entre Adão e Eva e os índios por eles andarem nus e, aparentemente, não trabalharem.</feedback>
						<feedback>Não foi desta vez! As tempestades tropicais efetivamente amedrontavam os viajantes, mas não faziam que eles pensassem ter chegado ao paraíso. Essa crença devia-se ao fato de que o éden, em sua imaginação, assemelhava-se à natureza tropical. Alguns acharam semelhanças entre Adão e Eva e os índios por eles andarem nus e, aparentemente, não trabalharem.</feedback>
					</feedbacks>
					<dica>#img:dica1_persB.jpg#</dica>
					<valorpontos>120</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
			
				<questao>
					<enunciado>Alguns portugueses acham que o Brasil é um presente de Deus. Por que Deus teria dado esse presente para eles?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Por um único motivo: permitir que eles enriquecessem, explorando a natureza.</alternativa>
						<alternativa>Por um duplo motivo: permitir que eles enriquecessem e ampliassem o número de fiéis.</alternativa>
						<alternativa>Por um duplo motivo: permitir que os índios conhecessem os homens civilizados e favorecer a exploração do pau-brasil.</alternativa>
						<alternativa>Por um único motivo: permitir que eles ampliassem o número de fiéis, convertendo os índios para a fé católica.</alternativa>
						<alternativa>Por um único motivo: permitir que a Europa conhecesse a bio-diversidade local e entrasse em contato com culturas distintas.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Além do propósito de enriquecer, os portugueses acreditavam que, na nova terra, poderiam difundir a religião católica. </feedback>
						<feedback>Muito bem! Os principais objetivos dos portugueses na nova terra foram enriquecer e difundir a religião católica.</feedback>
						<feedback>Não foi desta vez! À época do achamento do Brasil não se considerava o ponto de vista dos índios. Os principais objetivos dos portugueses eram enriquecer através da exploração das riquezas da nova terra (não necessariamente madeiras) e difundir a religião católica entre os nativos. </feedback>
						<feedback>Não foi desta vez! Além do propósito de difundir a religião católica, os portugueses acreditavam que, na nova terra, poderiam enriquecer.</feedback>
						<feedback>Não foi desta vez! No século XVI, não havia uma preocupação com a biodiversidade e tampouco com o multiculturalismo. Os principais objetivos dos portugueses na nova terra foram enriquecer e difundir a religião católica.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Algumas pessoas acham que o Brasil vai solucionar os problemas dos portugueses pobres. Por que elas acham isso?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Eles acreditam que os pobres poderão trabalhar na catequese dos índios. </alternativa>
						<alternativa>Eles acreditam que os pobres morrerão nos navios, resolvendo os problemas do reino.</alternativa>
						<alternativa>Eles acreditam que, na nova terra, haverá trabalho para todos, possibilitando que os pobres enriqueçam. </alternativa>
						<alternativa>Eles acreditam que, na nova terra, os pobres serão devorados pelas feras, resolvendo os problemas do reino.</alternativa>
						<alternativa>Eles acreditam que os índios, que habitam a nova terra, devorarão os pobres, resolvendo os problemas do reino.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Quem trabalhava na catequese dos índios eram os padres. Os portugueses pensavam que, no Brasil, haveria trabalho para todos e os pobres enriqueceriam.</feedback>
						<feedback>Não foi desta vez! Muita gente morria nas viagens marítimas, mas isso era visto como um problema. Os portugueses pensavam que, no Brasil, haveria trabalho para todos e os pobres enriqueceriam.</feedback>
						<feedback>Muito bem! Os portugueses pensavam que, no Brasil, haveria trabalho para todos e os pobres enriqueceriam.</feedback>
						<feedback>Não foi desta vez! Muitas pessoas eram devoradas por feras, mas isso era visto como um problema. Os portugueses pensavam que, no Brasil, haveria trabalho para todos e os pobres enriqueceriam.</feedback>
						<feedback>Não foi desta vez! Algumas tribos indígenas tinham costume de comer carne humana, mas isso era visto como um problema. Os portugueses pensavam que, no Brasil, haveria trabalho para todos e os pobres enriqueceriam.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Alguns portugueses estão muito satisfeitos com o achamento do Brasil porque dizem que vão mandar para lá todos os degredados. De quem eles estão falando? </enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Dos nobres</alternativa>
						<alternativa>Dos estrangeiros</alternativa>
						<alternativa>Das mulheres</alternativa>
						<alternativa>Dos criminosos</alternativa>
						<alternativa>Dos padres</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Os degredados eram aqueles que haviam infringido alguma norma política ou religiosa.</feedback>
						<feedback>Não foi desta vez! Os degredados eram aqueles que haviam infringido alguma norma política ou religiosa.</feedback>
						<feedback>Não foi desta vez! Os degredados eram aqueles que haviam infringido alguma norma política ou religiosa.</feedback>
						<feedback>Muito bem! Os degredados eram aqueles que haviam infringido alguma norma política ou religiosa.</feedback>
						<feedback>Não foi desta vez! Os degredados eram aqueles que haviam infringido alguma norma política ou religiosa.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>3</respcorreta>
				</questao>
				
				<questao>
					<enunciado>O descobrimento do Brasil tem sido muito comentado por toda a Europa. Os portugueses têm uma ideia curiosa sobre isso. Tu sabes como os portugueses veem o achamento da nova terra?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Como um presente de Deus devido à ausência de perigos e à abundância de riquezas.</alternativa>
						<alternativa>Como um castigo de Deus devido à pobreza da terra e à abundância de insetos.</alternativa>
						<alternativa>Como um castigo de Deus devido às tempestades tropicais e à abundância de feras.</alternativa>
						<alternativa>Como um presente de Deus devido à nudez das mulheres e abundância de frutos.</alternativa>
						<alternativa>Como um presente de Deus devido à possibilidade de enriquecimento e de ampliação do número de fiéis.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Os portugueses sabiam que, na nova terra, existiam muitos perigos, como a presença de índios antropófagos e tempestades, por exemplo. Entretanto, viam o achamento do Brasil como um presente de Deus devido à possibilidade de enriquecimento e de ampliação do número de fiéis.</feedback>
						<feedback>Não foi desta vez! Os portugueses viam os insetos como um inconveniente, mas logo perceberam que a terra era rica. Eles viam o achamento do Brasil como um presente de Deus devido à possibilidade de enriquecimento e de ampliação do número de fiéis.</feedback>
						<feedback>Não foi desta vez! Os portugueses sabiam que, na nova terra, existiam muitos inconvenientes como as tempestades e as feras. Entretanto, viam o achamento do Brasil como um presente de Deus devido à possibilidade de enriquecimento e de ampliação do número de fiéis.</feedback>
						<feedback>Não foi desta vez! Embora os portugueses apreciassem a nudez das índias e percebessem a abundância da terra, o que os levava a acreditar que a nova terra era um presente de Deus era a possibilidade de enriquecimento e de ampliação do número de fiéis.</feedback>
						<feedback>Muito bem! Muitos portugueses pensavam que o achamento da nova terra era um presente de Deus para permitir que eles enriquecessem, explorando a natureza, e ampliassem o número de fiéis, convertendo os índios para a fé católica.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>4</respcorreta>
				</questao>
				
			</questoes>
			]]> ).toString();
			
			questoesEpisodio[2] = (<![CDATA[
			<questoes>
				<questao>
					<enunciado>Ouvi falar que Pero Vaz de Caminha fez muitos comentários sobre os índios numa carta que escreveu para o Rei. Ninguém viu essa carta ainda, mas, como tu vieste do futuro, tu deves conhecer o conteúdo dela. O que Caminha escreveu sobre os índios?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Ele teve uma imagem positiva dos índios, elogiou sua aparência física e sua inocência.  </alternativa>
						<alternativa>Ele teve uma má impressão dos índios, reclamou de sua fraqueza e do fato de não trabalharem.</alternativa>
						<alternativa>Ele teve uma boa impressão apenas das índias, já que elas andavam nuas e não tinham vergonha disso.</alternativa>
						<alternativa>Ele teve uma má impressão dos índios, sobretudo das índias, que foram tidas como desavergonhadas por andarem nuas.</alternativa>
						<alternativa>Ele não falou muito sobre os índios, por isso não é possível saber se teve uma imagem positiva ou negativa.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Muito bem! Caminha descreveu positivamente os índios na carta que enviou para o rei de Portugal.</feedback>
						<feedback>Não foi desta vez! Uma das características dos índios, que impressionou Caminha, foi sua força. Na carta, ele descreveu positivamente os índios.</feedback>
						<feedback>Não foi desta vez! Caminha efetivamente comentou o fato de as índias andarem nuas e não terem vergonha disso, mas ele teve impressão positiva tanto delas, quanto dos índios, admirando sua força e inocência.</feedback>
						<feedback>Não foi desta vez! Uma das características dos índios, que impressionou positivamente Caminha, foi sua inocência: andavam nus e não viam nenhum mal nisso. Na carta, ele descreveu positivamente os índios.</feedback>
						<feedback>Não foi desta vez! Na carta, Caminha apresentou muitas descrições dos indígenas e apresentou uma imagem positiva deles.</feedback>
					</feedbacks>
					<dica>#img:dica1_persC.jpg#</dica>
					<valorpontos>120</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
			
				<questao>
					<enunciado>Ouvi dizer que, na carta escrita por Pero Vaz de Caminha, ao chegar ao Brasil, ele mostra ter tido boa impressão dos índios. Os viajantes que escreveram depois dele mantiveram a mesma opinião? Como tu vieste do futuro, tu deves saber isso...</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Sim. A opinião sobre os índios se manteve a mesma ao longo do tempo, pois os europeus continuaram pensando que os nativos eram inocentes e admirando seus costumes.</alternativa>
						<alternativa>Não. A opinião sobre os índios se transformou ao longo dos relatos, que começaram a apontar, nesses povos, características consideradas negativas, como o incesto e a antropofagia.</alternativa>
						<alternativa>Não. A opinião sobre os índios se transformou ao longo dos relatos. Os europeus perceberam que os índios acreditavam em vários deuses e desistiram de convertê-los para a fé Católica.</alternativa>
						<alternativa>Sim. A opinião sobre os índios se manteve a mesma ao longo do tempo. Os europeus continuaram pensando que os índios eram puros e aceitaram costumes desses povos, como o incesto e a antropofagia.</alternativa>
						<alternativa>Não. A opinião sobre os índios se transformou ao longo dos relatos porque, na medida em que conviviam com os nativos, os portugueses perceberam que tinham muitos costumes em comum com eles.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! A opinião sobre os índios se modificou, na medida em que os viajantes conheceram outras características consideradas negativas, como a antropofagia e o incesto.</feedback>
						<feedback>Muito bem! Os relatos escritos sobre os índios não conservaram a mesma ideia de Caminha. Com o passar do tempo, a opinião dos viajantes se alterou, na medida em que eles conheceram características dos indígenas que não apreciavam.</feedback>
						<feedback>Não foi desta vez! Os portugueses nunca desistiram de converter os índios, embora a opinião sobre eles tenha se modificado, na medida em que conheceram outras características consideradas negativas, como a antropofagia e o incesto.</feedback>
						<feedback>Não foi desta vez! A opinião sobre os índios se modificou, na medida em que os europeus conheceram outras características consideradas negativas, como o incesto e a antropofagia. Eles nunca aceitaram esses costumes.</feedback>
						<feedback>Não foi desta vez! A opinião sobre os índios se modificou, na medida em que os viajantes conheceram práticas consideradas negativas, como o incesto e a antropofagia. Os portugueses rejeitavam costumes indígenas e buscavam alterar seu comportamento, pela conversão ao catolicismo. </feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Já ouvi muitas histórias que comentam o costume indígena de comer carne humana. O que os viajantes que estiveram no Brasil pensam da antropofagia?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Os viajantes veem a antropofagia como selvageria, mas respeitam esse costume indígena e não tentam reprimir os nativos. </alternativa>
						<alternativa>A maioria dos viajantes respeita o costume de comer carne humana e mostra pouco estranhamento com relação a  esta prática.</alternativa>
						<alternativa>A maioria dos viajantes vê a antropofagia como selvageria ou como um ato de vingança entre grupos indígenas.</alternativa>
						<alternativa>Os viajantes afirmam que se trata de uma lenda, pois nunca encontraram índios que se comportassem dessa maneira.</alternativa>
						<alternativa>Os viajantes dizem que os índios devoram-se entre si, mas nunca comem europeus.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Os viajantes viam a antropofagia como selvageria ou como um ato de vingança entre os grupos e recriminavam os índios por isso. Em seus relatos, é perceptível o estranhamento dos autores diante dessa prática.</feedback>
						<feedback>Não foi desta vez! Os viajantes viam a antropofagia como selvageria ou como um ato de vingança entre os grupos e recriminavam os índios por isso. Em seus relatos, é perceptível o estranhamento dos autores diante dessa prática.</feedback>
						<feedback>Muito bem! A prática da antropofagia causava muito estranhamento nos viajantes. Alguns a viam como selvageria, outros como um ato de vingança.</feedback>
						<feedback>Não foi desta vez! Em seus relatos, os viajantes escrevem muito sobre a existência de índios antropófagos e narram cenas de ingestão de carne humana. Eles viam essa prática como selvageria ou como um ato de vingança entre grupos indígenas.</feedback>
						<feedback>Não foi desta vez! Há vários relatos de viajantes que narram a história de europeus capturados pelos índios e devorados em rituais de antropofagia. Um exemplo é o alemão Hans Staden, que viveu algum tempo entre os índios sob a ameaça de ser devorado, mas conseguiu escapar. Os viajantes viam a antropofagia como selvageria ou como um ato de vingança entre grupos indígenas.</feedback>
					</feedbacks>
					<dica>#img:dica3_persC.jpg#</dica>
					<valorpontos>120</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Tenho ouvido muita conversa sobre o que os viajantes escreveram, mas acho que nem tudo é verdade. Tu me ajudas a descobrir o que é mentira?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Os viajantes veem os índios como seres demoníacos, piores que os animais, por comerem seres de sua própria espécie.</alternativa>
						<alternativa>Os viajantes veem índios de como seres ingênuos, pois não se envergonham de andarem nus. </alternativa>
						<alternativa>Os viajantes veem os índios como povos sem crença e, portanto, passíveis de serem convertidos para a fé católica. </alternativa>
						<alternativa>Os viajantes veem os índios de forma predominantemente positiva e admiram todos os seus costumes.</alternativa>
						<alternativa>Os viajantes veem os índios como seres inocentes, pois andam nus como Adão e Eva no Paraíso.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Muitos viajantes viam os índios como demônios, descrevendo-os de forma negativa em seus relatos.</feedback>
						<feedback>Não foi desta vez! Muitos viajantes viam os índios como demônios, descrevendo-os de forma negativa em seus relatos.</feedback>
						<feedback>Não foi desta vez! Muitos achavam que eles não tinham nenhuma crença e que, por isso, seriam facilmente convertidos à fé católica.</feedback>
						<feedback>Muito bem! A opinião dos europeus sobre os índios variou, mas foi predominantemente negativa, principalmente devido ao seu costume de ingerir carne humana.</feedback>
						<feedback>Não foi desta vez! O costume dos índios de andarem nus foi interpretado como sinal de sua inocência.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>3</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Ouvi dizer que viajantes de toda a Europa estão escrevendo sobre os índios do Brasil. Tu, que dizes ter vindo do futuro, sabes o que eles disseram?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Os viajantes admiravam os índios por sua relação harmônica com a natureza e pela ausência de costumes civilizados.</alternativa>
						<alternativa>Os viajantes viram os índios de forma predominantemente positiva, admirando todos os seus costumes.</alternativa>
						<alternativa>Os viajantes viram os índios de forma predominantemente negativa, apesar de respeitarem seus costumes.</alternativa>
						<alternativa>Os viajantes viram os índios de forma predominantemente negativa e desistiram de catequizá-los.</alternativa>
						<alternativa>Os viajantes viram os índios de forma predominantemente negativa, pois atribuíam a eles características animalescas e demoníacas.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! A ideia do “bom selvagem” vivendo em harmonia com a natureza e longe da civilização surgiu apenas no século XVIII. Na época dos primeiros contatos, a imagem que os viajantes tiveram dos índios foi predominantemente negativa.</feedback>
						<feedback>Não foi desta vez! A ideia do “bom selvagem” vivendo em harmonia com a natureza e longe da civilização surgiu apenas no século XVIII. Na época dos primeiros contatos, a imagem que os viajantes tiveram dos índios foi predominantemente negativa.</feedback>
						<feedback>Não foi desta vez! Os viajantes efetivamente viram os índios de forma predominantemente negativa, mas, justamente por isso, não respeitaram seus costumes, procurando fazer com que eles se comportassem como os europeus.</feedback>
						<feedback>Não foi desta vez! Os viajantes efetivamente viram os índios de forma predominantemente negativa, mas um dos principais objetivos dos europeus que chegavam ao Brasil era converter os índios à fé católica.</feedback>
						<feedback>Muito bem! Os viajantes rejeitavam os costumes indígenas e procuravam fazer com que os índios se comportassem como os europeus.</feedback>
					</feedbacks>
					<dica>#img:dica5_persC.jpg#</dica>
					<valorpontos>120</valorpontos>
					<respcorreta>4</respcorreta>
				</questao>
				
			</questoes>
			]]> ).toString();
			
			questoesEpisodio[3] = (<![CDATA[
			<questoes>
				<questao>
					<enunciado>Gosto de poesias, mas acho difícil escrevê-las. Tu sabes o que é preciso saber para compor um bom poema?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>É preciso ter dom, conhecimento da tradição e das técnicas.</alternativa>
						<alternativa>É preciso concentração para que o artista seja criativo.</alternativa>
						<alternativa>É preciso inspiração para que o texto expresse o pensamento do poeta.</alternativa>
						<alternativa>É preciso sensibilidade para que o texto expresse os sentimentos do poeta.</alternativa>
						<alternativa>É preciso originalidade para não plagiar o texto de ninguém.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Muito bem! Era preciso dominar as regras formais dos diferentes gêneros (métrica, rima, etc), saber que tipo de conteúdo era adequado para cada forma poética e conhecer as melhores realizações em cada gênero.</feedback>
						<feedback>Não foi desta vez! A criatividade não era um conceito fundamental para se compor um poema, pois se pretendia imitar os modelos já consagrados, procurando superá-los. Era preciso dominar as regras formais (métrica, rima, etc), saber que tipo de conteúdo era adequado para cada forma poética e conhecer as melhores realizações em cada gênero.</feedback>
						<feedback>Não foi desta vez! Na época de Camões, não se pensava que um texto fosse exclusivamente fruto da inspiração de um poeta, mas proveniente de seu trabalho e de seu estudo. Era preciso dominar as regras formais (métrica, rima, etc), saber que tipo de conteúdo era adequado para cada forma poética e conhecer as melhores realizações em cada gênero.</feedback>
						<feedback>Não foi desta vez! Na época de Camões, não se pensava que um texto deveria expressar os sentimentos de um poeta, pois a poesia era fruto da observação de regras poéticas e de modelos consagrados. Era preciso dominar as regras formais (métrica, rima, etc), saber que tipo de conteúdo era adequado para cada forma poética e conhecer as melhores realizações em cada gênero. A poesia era fruto do trabalho e do estudo.</feedback>
						<feedback>Não foi desta vez! Na época de Camões, não se valorizava a idéia de originalidade. Pelo contrário, um bom poema deveria ser muito parecido com as melhores produções. A idéia era imitar os modelos já consagrados, procurando superá-los. Era preciso dominar as regras formais (métrica, rima, etc), saber que tipo de conteúdo era adequado para cada forma poética e conhecer as melhores realizações em cada gênero. </feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
			
				<questao>
					<enunciado>Quero começar a escrever poemas... Como os poetas fazem?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Os poetas procuram utilizar elementos diferentes daqueles que circulam na sua própria época, buscando ser sempre originais.</alternativa>
						<alternativa>Os poetas seguem regras poéticas, imitam os modelos clássicos e os escritores de sua própria época que tenham se destacado.</alternativa>
						<alternativa>Os poetas acreditam que é preciso ter um dom específico, de nada adiantando o estudo ou o trabalho árduo.</alternativa>
						<alternativa>Os poetas tentam fugir dos padrões já existentes e improvisam os seus versos a fim de criarem novos modelos.</alternativa>
						<alternativa>Os poetas buscam o domínio perfeito da técnica, pois sabem que ter talento é desnecessário.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! A criatividade não era um conceito fundamental, pois se pretendia imitar os modelos já consagrados, procurando superá-los. Além disso, eles também podiam imitar versos de seus contemporâneos que tivessem produzido bons poemas.</feedback>
						<feedback>Muito bem! Na época de Camões, um bom poeta era aquele capaz de imitar os grandes modelos que se encontravam na poesia da Antiguidade e nas artes poéticas. Além disso, eles também podiam imitar versos de seus contemporâneos que tivessem produzido bons poemas.</feedback>
						<feedback>Não foi desta vez! Na época de Camões, não se pensava que um texto fosse exclusivamente fruto da inspiração de um poeta, mas proveniente de seu trabalho e de seu estudo. Um bom poeta era aquele capaz de imitar os grandes modelos que se encontravam na poesia da Antiguidade e nas artes poéticas. Além disso, eles também podiam imitar versos de seus contemporâneos que tivessem produzido bons poemas.</feedback>
						<feedback>Não foi desta vez! Na época de Camões, havia improviso sim, mas um bom poeta era aquele capaz de imitar os grandes modelos que se encontravam na poesia da Antiguidade e nas artes poéticas. Além disso, eles também podiam imitar versos de seus contemporâneos que tivessem produzido bons poemas.</feedback>
						<feedback>Não foi desta vez! Na época de Camões, pensava-se que um bom texto era fruto do trabalho e do estudo, mas não exclusivamente. Acreditava-se que o poeta, além domínio da técnica (arte), precisava possuir talento (engenho).</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Os poetas chegam aqui e dizem que para escrever é preciso engenho e arte. Eu nunca entendo o que eles querem dizer... Tu sabes o que é engenho?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Engenho é o sentimento de um poeta. </alternativa>
						<alternativa>Engenho é o trabalho de um poeta. </alternativa>
						<alternativa>Engenho é o talento de um poeta. </alternativa>
						<alternativa>Engenho é a capacidade de improvisação de um poeta.</alternativa>
						<alternativa>Engenho é o domínio da técnica que possui um poeta.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Engenho significa talento. Na época de Camões, acreditava-se que o poeta deveria ter talento (engenho) e domínio da técnica (arte).</feedback>
						<feedback>Não foi desta vez! Engenho significa talento. Na época de Camões, acreditava-se que o poeta deveria ter talento (engenho) e domínio da técnica (arte).</feedback>
						<feedback>Muito bem! Na época de Camões, acreditava-se que o poeta deveria ter talento (engenho) e domínio da técnica (arte).</feedback>
						<feedback>Não foi desta vez! Engenho significa talento. Na época de Camões, acreditava-se que o poeta deveria ter talento (engenho) e domínio da técnica (arte).</feedback>
						<feedback>Não foi desta vez! O domínio da técnica era conhecido como arte. Engenho era o mesmo que talento. Na época de Camões, acreditava-se que o poeta deveria ter talento (engenho) e domínio da técnica (arte).</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Os poetas chegam aqui e dizem que para escrever é preciso engenho e arte. Eu nunca entendo o que eles querem dizer... Tu sabes o que é arte?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Arte é a inspiração.</alternativa>
						<alternativa>Arte é a originalidade.</alternativa>
						<alternativa>Arte é o talento.</alternativa>
						<alternativa>Arte é o domínio da técnica.</alternativa>
						<alternativa>Arte é o sentimento.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Possuir o domínio da técnica é que era conhecido como arte. Na época de Camões, acreditava-se que o poeta deveria ter talento (engenho) e domínio da técnica (arte).</feedback>
						<feedback>Não foi desta vez! Possuir o domínio da técnica é que era conhecido como arte. Na época de Camões, acreditava-se que o poeta deveria ter talento (engenho) e domínio da técnica (arte). Não se dava importância à originalidade.</feedback>
						<feedback>Não foi desta vez! Possuir o domínio da técnica é que era conhecido como arte. Na época de Camões, acreditava-se que o poeta deveria ter talento, mas isso era conhecido como engenho.</feedback>
						<feedback>Muito bem! Na época de Camões, acreditava-se que o poeta deveria ter domínio da técnica (arte) e talento (engenho).</feedback>
						<feedback>Não foi desta vez! Possuir o domínio da técnica é que era conhecido como arte. Na época de Camões, acreditava-se que o poeta deveria ter talento (engenho) e domínio da técnica (arte). Não se pensava que a poesia exprimisse sentimentos.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>3</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Tenho um amigo que gastou anos estudando as artes poéticas para compor seus textos. Por que é preciso conhecer as artes poéticas?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Porque nas artes poéticas é possível encontrar conselhos sobre como desenvolver a criatividade e inovar em um poema.</alternativa>
						<alternativa>Porque a partir da leitura das artes poéticas é possível saber o que já foi utilizado para não haver repetições.</alternativa>
						<alternativa>Porque nas artes poéticas há conselhos sobre como os poetas podem fazer improvisações.</alternativa>
						<alternativa>Porque nas artes poéticas há listas de questões e temas considerados bons para composição de poemas.</alternativa>
						<alternativa>Porque nelas se encontram normas que regem a criação poética e se estabelecem as características necessárias para uma boa composição.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! A criatividade e a originalidade eram defeitos, pois um bom poeta era aquele capaz de imitar os grandes modelos do passado. A composição poética era intensamente regulada. Um poeta deveria dominar as regras formais e saber que tipo de conteúdo era adequado para cada gênero, o que era apresentado nas poéticas.</feedback>
						<feedback>Não foi desta vez! Não havia preocupação com repetiçoes, pois um bom poema era aquele considerado o mais parecido possível com as grandes produções do passado. A composição poética era intensamente regulada. Um poeta deveria dominar as regras formais e saber que tipo de conteúdo era adequado para cada gênero, o que era apresentado nas poéticas.</feedback>
						<feedback>Não foi desta vez! Apesar de haver improvisação no tempo de Camões, como por exemplo, na composição de glosas a partir de um mote, essa não era a característica mais valorizada no fazer poético. A composição poética era intensamente regulada. Um poeta deveria dominar as regras formais e saber que tipo de conteúdo era adequado para cada gênero, o que era apresentado nas poéticas.</feedback>
						<feedback>Não foi desta vez! Embora as artes poéticas apresentem alguns temas e questões que podem servir para a composição de poesias, elas não se limitam a isso. Elas apresentam também a relação entre tema e forma, assim como comentam os melhores poemas já produzidos.</feedback>
						<feedback>Muito bem! A composição poética era intensamente regulada. Um poeta deveria dominar as regras formais e saber que tipo de conteúdo era adequado para cada gênero, o que era apresentado nas poéticas.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>4</respcorreta>
				</questao>
				
			</questoes>
			]]> ).toString();
			
			questoesEpisodio[4] = (<![CDATA[
			<questoes>
				<questao>
					<enunciado>Camões faz poemas o tempo todo! Não sei como consegue escrever tanto sobre um único tema: amor, amor, amor. Ele só trata disso em seus poemas?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Não! Suas poesias tratam de todo tipo de assunto, como por exemplo, cobrar dívidas ou ajuda para sair da prisão.</alternativa>
						<alternativa>Não! A maioria de suas poesias trata de temas elevados, como, por exemplo, a relação do homem com o divino.</alternativa>
						<alternativa>Sim! Suas poesias têm como único tema o amor, pois ele utiliza os poemas para atrair muitas mulheres.</alternativa>
						<alternativa>Sim! Suas poesias têm como único tema o amor, mas elas tratam tanto do amor a Deus quanto do amor carnal. </alternativa>
						<alternativa>Não! A maioria de suas poesias trata de assuntos referentes à vida da nobreza, pois ele as utiliza para pedir dinheiro aos nobres. </alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Muito bem! Além de tratar de temas complexos como o amor, a poesia, no século XVI, podia ter uma finalidade bastante prática, respondendo a necessidades do cotidiano dos poetas e sendo produzida a partir de questões do dia-a-dia.</feedback>
						<feedback>Não foi desta vez! No século XVI, embora a poesia pudesse tratar de assuntos complexos, como a relação com o divino ou o amor, os poetas também versavam sobre outros temas. A poesia podia ter uma finalidade bastante prática, respondendo a necessidades do cotidiano e sendo produzida a partir de questões do dia-a-dia.</feedback>
						<feedback>Não foi desta vez! Embora muitos poemas de Camões tivessem como tema o amor, no século XVI, a poesia também podia ter uma finalidade bastante prática, respondendo a necessidades do cotidiano dos poetas e sendo produzida a partir de questões do dia-a-dia.</feedback>
						<feedback>Não foi desta vez! Embora os poetas do tempo de Camões escrevessem muito sobre o amor (inclusive a Deus), no século XVI, a poesia podia ter uma finalidade bastante prática, respondendo a necessidades do cotidiano e sendo produzida a partir de questões do dia-a-dia.</feedback>
						<feedback>Não foi desta vez! No século XVI, embora se pudesse destinar um poema a algum membro da nobreza, a fim de obter recursos, este não era o principal tema das poesias. Ela podia ter uma finalidade bastante prática, respondendo a necessidades do cotidiano dos poetas e sendo produzida a partir de questões do dia-a-dia, além de tratar de temas complexos como o amor. </feedback>
					</feedbacks>
					<dica>#img:dica1_persE.jpg#</dica>
					<valorpontos>120</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
			
				<questao>
					<enunciado>Camões é engraçado! A partir de qualquer coisa que eu falo ele faz uma glosa. Tu sabes o que é uma glosa, não é?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Glosas são frases, versos ou textos inteiros, a partir dos quais é feito um novo poema.</alternativa>
						<alternativa>Glosas são poemas desenvolvidos a partir de um tema contido em frases, versos ou outros textos. </alternativa>
						<alternativa>Glosas são poemas formados por versos decassílabos e terminam com uma chave de ouro.</alternativa>
						<alternativa>Glosas são poemas compostos para serem cantados, cujos versos tratam de assunto elevado. </alternativa>
						<alternativa>Glosas são poemas pastorais geralmente na forma de monólogo ou de diálogos entre pastores.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Frases, versos ou textos inteiros a partir dos quais se desenvolve um novo poema são motes e não glosas. Glosas são os poemas desenvolvidos a partir de um tema contido nessas frases, versos ou outros textos.</feedback>
						<feedback>Muito bem! Um poema que desenvolve um tema encontrado em frases, versos ou mesmo textos inteiros é uma glosa. </feedback>
						<feedback>Não foi desta vez! Poemas compostos por versos decassílabos e que terminam com uma chave de ouro são conhecidos como sonetos. Glosas são os poemas desenvolvidos a partir de um tema contido em frases, versos ou outros textos. </feedback>
						<feedback>Não foi desta vez! Versos que tratam de algum assunto elevado e são compostos para serem cantados são uma forma poética conhecida como ode. Glosas são os poemas desenvolvidos a partir de um tema contido em frases, versos ou outros textos. </feedback>
						<feedback>Não foi desta vez! Versos pastorais geralmente na forma de monólogo ou de diálogos entre pastores são poemas conhecidos como éclogas. Glosas são os poemas desenvolvidos a partir de um tema contido em frases, versos ou outros textos.</feedback>
					</feedbacks>
					<dica>#img:dica2_persE.jpg#</dica>
					<valorpontos>120</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Eu me divirto com Camões. Eu tentei insultá-lo, chamando-o de “cara-sem-olhos”, e ele tomou isso como um mote! Tu sabes o que é mote, não é?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Motes são poemas desenvolvidos a partir de um tema contido em frases, versos ou outros textos.</alternativa>
						<alternativa>Motes são poemas formados por versos decassílabos e terminam com uma chave de ouro na qual é feita uma reflexão.</alternativa>
						<alternativa>Motes são palavras, versos ou poemas inteiros, a partir dos quais é feito um novo poema.</alternativa>
						<alternativa>Motes são poemas compostos para serem cantados, cujos versos tratam de assunto elevado.</alternativa>
						<alternativa>Motes são poemas pastorais geralmente na forma de monólogo ou de diálogos entre pastores.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Poemas desenvolvidos a partir de um tema contido em frases, versos ou outros textos são conhecidos como glosas. Motes são palavras, versos ou mesmo poemas inteiros, a partir dos quais são criados novos poemas, que devem tomá-los por tema e incorporá-los à nova criação. </feedback>
						<feedback>Não foi desta vez! Poemas compostos por versos decassílabos e que terminam com uma chave de ouro são conhecidos como sonetos. Motes são palavras, versos ou mesmo poemas inteiros, a partir dos quais são criados novos poemas, que devem tomá-los por tema e incorporá-los à nova criação. </feedback>
						<feedback>Muito bem! Motes são palavras, versos ou mesmo poemas inteiros, a partir dos quais são criados novos poemas, que devem tomá-los por tema e incorporá-los à nova criação.</feedback>
						<feedback>Não foi desta vez! Versos que tratam de algum assunto elevado e são compostos para serem cantados são uma forma poética conhecida como ode. Motes são palavras, versos ou mesmo poemas inteiros, a partir dos quais são criados novos poemas, que devem tomá-los por tema e incorporá-los à nova criação. </feedback>
						<feedback>Não foi desta vez! Versos pastorais geralmente na forma de monólogo ou de diálogos entre pastores são poemas conhecidos como éclogas. Motes são palavras, versos ou mesmo poemas inteiros, a partir dos quais são criados novos poemas, que devem tomá-los por tema e incorporá-los à nova criação. </feedback>
					</feedbacks>
					<dica>#img:dica3_persE.jpg#</dica>
					<valorpontos>120</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Camões faz poemas o tempo todo, mas tem somente um livro publicado. Tu sabes por quê?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Porque a dificuldade de publicar livros fez com que Camões perdesse o interesse de imprimir suas poesias.</alternativa>
						<alternativa>Porque as poesias de Camões foram proibidas pela censura, ele só as apresenta oralmente.</alternativa>
						<alternativa>Porque é muito caro publicar um livro e Luís de Camões tem preguiça de procurar um patrocinador.</alternativa>
						<alternativa>Porque é muito difícil publicar livros, por isso suas poesias são recitadas e circulam em manuscritos.</alternativa>
						<alternativa>Porque Camões só escreve endechas destinadas a gente baixa, que não tem condições de comprar livros.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Embora na época de Camões não fosse comum a publicação de livros, ele pretendia publicar outro livro além de "Os Lusíadas". Ele iria se chamar "Parnaso de Luís de Camões", mas foi roubado.</feedback>
						<feedback>Não foi desta vez! Camões submeteu à censura apenas Os Lusíadas, que obteve aprovação do censor. Ele teve somente um livro publicado porque a publicação de livros era rara. O mais comum era ouvir poemas recitados em voz alta ou lê-los em folhas e cadernos manuscritos.</feedback>
						<feedback>Não foi desta vez! Era realmente muito caro publicar um livro, mas Camões não tinha preguiça, não. Dizem que ele procurou vários mecenas para financiar "Os Lusíadas", seu único livro publicado. Como a publicação de livros era rara, o mais comum era ouvir poemas recitados em voz alta ou lê-los em folhas e cadernos manuscritos.</feedback>
						<feedback>Muito bem! A publicação de livros de poesia era rara. O mais comum era ouvir poemas recitados em voz alta ou lê-los em folhas e cadernos manuscritos.</feedback>
						<feedback>Não foi desta vez! Camões escrevia diversas espécies de poesia, mas não as publicava, pois a publicação de livros era rara. O mais comum era ouvir poemas recitados em voz alta ou lê-los em folhas e cadernos manuscritos.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>3</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Eu não entendo por que Camões e os outros poetas perdem tanto tempo fazendo versos. Para que serve isso?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Os versos são usados somente para o entretenimento, já que as pessoas não têm muitas opções de diversão.</alternativa>
						<alternativa>Os versos são usados somente para finalidades práticas como ser trocados por roupas, utensílios ou mesmo alimentos.</alternativa>
						<alternativa>Os versos são usados somente para discutir assuntos elevados e apenas as pessoas cultas têm o costume de recitá-los.</alternativa>
						<alternativa>Os versos são usados para reflexões pessoais e lidos em silêncio, normalmente de forma individual. </alternativa>
						<alternativa>Os versos são usados para discutir assuntos elevados, para finalidades práticas ou mesmo para entreter as pessoas.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Embora os versos fossem usados para o entretenimento, isso não era sua única finalidade. Podia-se utilizar um poema também para refletir sobre assuntos complexos e para finalidades práticas, como trocá-los por roupas, utensílios ou mesmo alimentos.</feedback>
						<feedback>Não foi desta vez! Embora os versos fossem usados com finalidades práticas, essa não era sua única serventia. Podia-se utilizar um poema também para refletir sobre assuntos complexos ou como passatempo para entreter as pessoas.</feedback>
						<feedback>Não foi desta vez! Embora os versos fossem usados para discutir assuntos elevados, essa não era sua única finalidade. Podia-se utilizar um poema também para finalidades práticas, como trocá-los por roupas, utensílios ou mesmo alimentos, ou como passatempo para entreter as pessoas. Pessoas de todas as classes tinham o costume de recitar versos.</feedback>
						<feedback>Não foi desta vez! Na época de Camões, o mais comum era ouvir poemas recitados ou lê-los em folhas e cadernos manuscritos, muitas vezes em voz alta. Os versos não eram usados somente para reflexões pessoais. Ao contrário, podia-se utilizar os poemas para muitos fins: para refletir sobre assuntos complexos, para entreter as pessoas, para trocá-los por roupas, utensílios ou mesmo alimentos.</feedback>
						<feedback>Muito bem! Os versos eram usados nas mais variadas situações. Podia-se utilizar um poema para refletir sobre assuntos complexos, para finalidades práticas (como trocá-los por roupas, utensílios ou mesmo alimentos) ou como passatempo para entreter as pessoas.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>4</respcorreta>
				</questao>
				
			</questoes>
			]]> ).toString();
			
			questoesEpisodio[5] = (<![CDATA[
			<questoes>
				<questao>
					<enunciado>Ouvi dizer que Camões pretende organizar um livro com suas poesias líricas. Dizem que os sonetos, sem dúvida, virão em primeiro lugar. Tu sabes por quê?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Porque o soneto é a espécie lírica mais valorizada.</alternativa>
						<alternativa>Porque o soneto é tido como uma forma poética fácil.</alternativa>
						<alternativa>Porque o soneto trata de assuntos corriqueiros.</alternativa>
						<alternativa>Porque o soneto é a espécie lírica mais comum.</alternativa>
						<alternativa>Porque o soneto é a única forma fixa que existe.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Muito bem! O soneto era considerado a espécie lírica mais elevada. Na primeira edição das obras líricas de Camões, intitulada "Rhytmas" e organizada por Fernão Rodrigues Soropita, os sonetos vêm em primeiro lugar.</feedback>
						<feedback>Não foi desta vez! O soneto é considerado uma forma poética complexa e, na época de Camões, era concebido como a espécie lírica mais elevada. Na primeira edição das obras líricas de Camões, intitulada "Rhytmas" e organizada por Fernão Rodrigues Soropita, os sonetos vêm em primeiro lugar.</feedback>
						<feedback>Não foi desta vez! No tempo de Camões, os sonetos tratavam, sobretudo, de temas complexos. O soneto era considerado a espécie lírica mais elevada. Na primeira edição das obras líricas de Camões, intitulada "Rhytmas" e organizada por Fernão Rodrigues Soropita, os sonetos vêm em primeiro lugar.</feedback>
						<feedback>Não foi desta vez! O soneto era considerado a espécie lírica mais elevada e não a mais comum. Na primeira edição das obras líricas de Camões, intitulada "Rhytmas" e organizada por Fernão Rodrigues Soropita, os sonetos vêm em primeiro lugar.</feedback>
						<feedback>Não foi desta vez! No tempo de Camões todas as espécies líricas tinham forma fixa. O soneto foi escolhido para abrir o livro de poesias porque era a espécie lírica considerada mais elevada. Na primeira edição das obras líricas de Camões, intitulada "Rhytmas" e organizada por Fernão Rodrigues Soropita, os sonetos vêm em primeiro lugar.</feedback>
					</feedbacks>
					<dica>#img:dica1_persF.jpg#</dica>
					<valorpontos>120</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
			
				<questao>
					<enunciado>Muita gente vem aqui e recita poemas parecidos. Nós raramente sabemos quem é o autor dos versos. Tu sabes por quê?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Porque os autores não costumam assinar os poemas que compõem devido ao medo da censura.</alternativa>
						<alternativa>Porque os poemas circulam oralmente ou em manuscritos, possuindo diversas versões.</alternativa>
						<alternativa>Porque os motes são sempre os mesmos e, por isso, não é fácil distinguir os autores dos versos.</alternativa>
						<alternativa>Porque a maioria dos autores não é original e costuma copiar os versos uns dos outros.</alternativa>
						<alternativa>Porque os autores escrevem exatamente como os poetas da Antiguidade.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Embora os autores não costumassem assinar seus poemas, não era o medo da censura que os levava a isso. As dificuldades de estabelecer a autoria dos poemas deviam-se às condições de produção e recepção desses textos, que, em geral, circulavam oralmente ou em manuscritos e possuíam muitas versões. </feedback>
						<feedback>Muito bem! Não se sabe ao certo quem são os autores de muitos poemas do século XVI, pois, em geral, esses textos circulavam oralmente ou em manuscritos e possuíam diferentes versões.</feedback>
						<feedback>Não foi desta vez! Mais de um autor poderia utilizar o mesmo mote para compor um poema, mas os motes nem sempre eram os mesmos. Não se sabe ao certo quem são os autores de muitos poemas do século XVI, pois, em geral, esses textos circulavam oralmente ou em manuscritos e possuíam diferentes versões.</feedback>
						<feedback>Não foi desta vez! No século XVI não havia a noção de originalidade como temos em nossos dias. Acreditava-se que imitar poemas bem realizados era uma boa forma de compor poesia. Não se sabe ao certo quem são os autores de muitos poemas do século XVI, pois, em geral, esses textos circulavam oralmente ou em manuscritos e possuíam diferentes versões. </feedback>
						<feedback>Não foi desta vez! Embora os autores seguissem os padrões poéticos da Antiguidade, eles não escreviam exatamente como eles. Não se sabe ao certo quem são os autores de muitos poemas do século XVI, pois, em geral, esses textos circulavam oralmente ou em manuscritos e possuíam diferentes versões. </feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Outro dia, escutei uma discussão no Mal-Cozinhado entre dois nobres porque um deles tinha um cancioneiro com 50 poesias líricas de Camões e o outro um cancioneiro com 55 poemas líricos camonianos. Por que existe essa variação?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Porque os autores não costumam assinar os poemas que compõem devido ao medo da censura.</alternativa>
						<alternativa>Porque os poemas circulam oralmente ou em manuscritos, possuindo diversas versões.</alternativa>
						<alternativa>Porque os motes são sempre os mesmos e, por isso, não é fácil distinguir os autores dos versos.</alternativa>
						<alternativa>Porque a maioria dos autores não é original e costuma copiar os versos uns dos outros.</alternativa>
						<alternativa>Porque os autores escrevem exatamente como os poetas da Antiguidade.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! Embora os autores não costumassem assinar seus poemas, não era o medo da censura que os levava a isso. As dificuldades de estabelecer a autoria dos poemas deviam-se às condições de produção e recepção desses textos, que, em geral, circulavam oralmente ou em manuscritos e possuíam muitas versões.</feedback>
						<feedback>Muito bem! Não se sabe ao certo quem são os autores de muitos poemas do século XVI, pois, em geral, esses textos circulavam oralmente ou em manuscritos e possuíam diferentes versões.</feedback>
						<feedback>Não foi desta vez! Mais de um autor poderia utilizar o mesmo mote para compor um poema, mas os motes nem sempre eram os mesmos. Não se sabe ao certo quem são os autores de muitos poemas do século XVI, pois, em geral, esses textos circulavam oralmente ou em manuscritos e possuíam diferentes versões.</feedback>
						<feedback>Não foi desta vez! No século XVI não havia a noção de originalidade como temos em nossos dias. Acreditava-se que imitar poemas bem realizados era uma boa forma de compor poesia. Não se sabe ao certo quem são os autores de muitos poemas do século XVI, pois, em geral, esses textos circulavam oralmente ou em manuscritos e possuíam diferentes versões.</feedback>
						<feedback>Não foi desta vez! Embora os autores seguissem os padrões poéticos da Antiguidade, eles não escreviam exatamente como eles. Não se sabe ao certo quem são os autores de muitos poemas do século XVI, pois, em geral, esses textos circulavam oralmente ou em manuscritos e possuíam diferentes versões.</feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>120</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Ouvi um poema de Camões muito bonito e me disseram que era um soneto. O que é um soneto?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>É um poema de forma fixa destinado a celebrar os feitos guerreiros de um povo.</alternativa>
						<alternativa>É um poema que varia quanto ao número e  à distribuição dos versos e não possui esquema fixo de rimas.</alternativa>
						<alternativa>É um poema que causa emoção no leitor por ser destinado exclusivamente a temas amorosos.</alternativa>
						<alternativa>É um poema composto por 14 versos decassílabos que são distribuídos em dois quartetos e dois tercetos.</alternativa>
						<alternativa>É um poema com oito versos decassílabos e com um esquema de rimas em  ABABABCC.</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! O poema destinado a celebrar os feitos guerreiros de um povo é a epopéia. Um soneto é composto de 14 versos de 10 ou 12 sílabas, distribuídos em dois quartetos e dois tercetos. Essa era a forma lírica mais valorizada na época de Camões.</feedback>
						<feedback>Não foi desta vez! Um soneto não varia quanto ao número e à distribuição dos versos e apresenta esquema regular de rimas. É sempre composto por 14 versos de 10 ou 12 sílabas, distribuídos em dois quartetos e dois tercetos. Essa era a forma lírica mais valorizada na época de Camões..</feedback>
						<feedback>Não foi desta vez! Um soneto não trata exclusivamente de assuntos amorosos, abrangendo uma grande variedade de temas elevados. Um soneto é composto de 14 versos de 10 ou 12 sílabas, distribuídos em dois quartetos e dois tercetos. Essa era a forma lírica mais valorizada na época de Camões.</feedback>
						<feedback>Muito bem! Um poema composto de 14 versos, com 10 ou 12 sílabas cada, distribuídos em dois quartetos e dois tercetos é um soneto. Essa era a forma lírica mais valorizada na época de Camões. </feedback>
						<feedback>Não foi desta vez! Um poema com oito versos decassílabos e com esquema de rimas ABABABCC é uma oitava rima. Um soneto é composto de 14 versos de 10 ou 12 sílabas, distribuídos em dois quartetos e dois tercetos. Essa era a forma lírica mais valorizada na época de Camões.</feedback>
					</feedbacks>
					<dica>#img:dica4_persF.jpg#</dica>
					<valorpontos>120</valorpontos>
					<respcorreta>3</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Outro dia, ouvi uma discussão no Mal-Cozinhado sobre qual é a espécie lírica mais elevada. Tu sabes qual é?</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>Canção</alternativa>
						<alternativa>Epopéia</alternativa>
						<alternativa>Teatro</alternativa>
						<alternativa>Endecha</alternativa>
						<alternativa>Soneto</alternativa>
					</alternativas>
					<feedbacks>
						<feedback>Não foi desta vez! A canção não é a espécie lírica tida como mais elevada no tempo de Camões. Esse lugar cabe ao  soneto, considerado a espécie mais elevada devido ao seu caráter complexo e à sua estrutura fixa.</feedback>
						<feedback>Não foi desta vez! A epopeia não é uma espécie lírica e sim um gênero poético (épico), destinado a celebrar os feitos guerreiros de um povo. O soneto é considerado a espécie lírica mais elevada devido ao seu caráter complexo e à sua estrutura fixa. </feedback>
						<feedback>Não foi desta vez! O teatro não é uma espécie lírica. O soneto é considerado a espécie lírica mais elevada devido ao seu caráter complexo e à sua estrutura fixa.</feedback>
						<feedback>Não foi desta vez! A endecha não é uma espécie poética elevada, tanto que Camões a usou para fazer um poema para uma escrava. O soneto é considerado a espécie lírica mais elevada devido ao seu caráter complexo e à sua estrutura fixa.</feedback>
						<feedback>Muito bem! O soneto é considerado a espécie lírica mais elevada devido ao seu caráter complexo e à sua estrutura fixa. Por isso, quando Fernão Rodrigues Soropita organizou a poesia lírica de Camões, colocou os sonetos em primeiro lugar. </feedback>
					</feedbacks>
					<dica>#img:dica5_persF.jpg#</dica>
					<valorpontos>120</valorpontos>
					<respcorreta>4</respcorreta>
				</questao>
				
			</questoes>
			]]> ).toString();
	}

		
	}
}