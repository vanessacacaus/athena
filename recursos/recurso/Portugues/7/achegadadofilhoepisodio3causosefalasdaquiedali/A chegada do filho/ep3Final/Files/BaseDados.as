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
		<enunciado>Mas o que é literatura?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Não há consenso sobre o que é literatura; cada grupo cultural tem uma ideia sobre o que define um texto literário.</alternativa>
			<alternativa>É um conjunto de obras escritas por homens geniais, superiores aos homens comuns.</alternativa>
			<alternativa>Os teóricos e críticos literários são as únicas pessoas capazes de saber o que é literatura.</alternativa>
			<alternativa>É um conjunto de narrativas e poesias escritas, interpretadas por críticos literários.</alternativa>
			<alternativa>São os livros escritos com interesse de vender muito e agradar o grande público.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! Para apreciar uma obra literária é preciso conhecer a convenção na qual ela foi produzida.</feedback>
			<feedback>Tente outra vez! A ideia de que os artistas são pessoas geniais surgiu no século XVIII e não corresponde aos fatos. Gente comum também produz obras espetaculares! Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional. É preciso ser inteligente para apreciar qualquer tipo de produção cultural e não apenas a literatura erudita.</feedback>
			<feedback>Tente outra vez! Os teóricos e críticos literários sabem muito sobre a produção literária, especialmente a erudita, mas não são os únicos capazes de definir literatura. Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional. A maior parte dos teóricos e críticos literários rejeita os livros mais vendidos e muito anunciados na imprensa.</feedback>
			<feedback>Tente outra vez! A literatura é composta também por produções orais e não apenas por textos escritos. Para ser literária, uma obra não precisa necessariamente ser objeto de análise dos críticos. Tampouco precisa ser estudada na escola ou estar presente em exames vestibulares. Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional.</feedback>
			<feedback>Tente outra vez! Os livros escritos com interesse de vender muito e agradar o grande público são os #i#best-sellers#!i#. Mas os escritores eruditos também se importam com a venda e com a avaliação dos leitores, que precisam ser inteligentes para apreciar qualquer tipo de produção cultural.</feedback>
		</feedbacks>
		<dica></dica>
		<premio>sala</premio>
		<valorpontos>120</valorpontos>
		<respcorreta>0</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
			<dialogo pers="Nico" contra="Zita">A cantoria é bonita, mas é muito elementar. Coisas simples assim não podem ser chamadas de literatura.</dialogo>
		</dialogos>
	</questao>

	<questao>
		<enunciado>Mas o que é literatura?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>É um conjunto de obras escritas por homens geniais, superiores aos homens comuns.</alternativa>
			<alternativa>Não há consenso sobre o que é literatura; cada grupo cultural tem uma ideia sobre o que define um texto literário.</alternativa>
			<alternativa>Os teóricos e críticos literários são as únicas pessoas capazes de saber o que é literatura.</alternativa>
			<alternativa>É um conjunto de narrativas e poesias escritas, interpretadas por críticos literários.</alternativa>
			<alternativa>São os livros escritos com interesse de vender muito e agradar o grande público.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A ideia de que os artistas são pessoas geniais surgiu no século XVIII e não corresponde aos fatos. Gente comum também produz obras espetaculares! Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional. É preciso ser inteligente para apreciar qualquer tipo de produção cultural e não apenas a literatura erudita.</feedback>
			<feedback>Muito bem! Para apreciar uma obra literária é preciso conhecer a convenção na qual ela foi produzida.</feedback> 
			<feedback>Tente outra vez! Os teóricos e críticos literários sabem muito sobre a produção literária, especialmente a erudita, mas não são os únicos capazes de definir literatura. Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional. A maior parte dos teóricos e críticos literários rejeita os livros mais vendidos e muito anunciados na imprensa.</feedback>
			<feedback>Tente outra vez! A literatura é composta também por produções orais e não apenas por textos escritos. Para ser literária, uma obra não precisa necessariamente ser objeto de análise dos críticos. Tampouco precisa ser estudada na escola ou estar presente em exames vestibulares. Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional.</feedback>
			<feedback>Tente outra vez! Os livros escritos com interesse de vender muito e agradar o grande público são os #i#best-sellers#!i#. Mas os escritores eruditos também se importam com a venda e com a avaliação dos leitores, que precisam ser inteligentes para apreciar qualquer tipo de produção cultural. </feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>varanda</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
		 	<quantidade>1</quantidade>
		   <dialogo pers="Nico" contra="Zita">Os folhetos de cordel são legais, mas são muito elementares. Coisas simples assim não podem ser chamadas de literatura.</dialogo>;
		</dialogos>
	</questao>

	<questao>
		<enunciado>Mas o que é literatura?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>É um conjunto de obras escritas por homens geniais, superiores aos homens comuns.</alternativa>
			<alternativa>Os teóricos e críticos literários são as únicas pessoas capazes de saber o que é literatura.</alternativa>
			<alternativa>Não há consenso sobre o que é literatura; cada grupo cultural tem uma ideia sobre o que define um texto literário.</alternativa>
			<alternativa>É um conjunto de narrativas e poesias escritas, interpretadas por críticos literários.</alternativa>
			<alternativa>São os livros escritos com interesse de vender muito e agradar o grande público.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A ideia de que os artistas são pessoas geniais surgiu no século XVIII e não corresponde aos fatos. Gente comum também produz obras espetaculares! Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional. É preciso ser inteligente para apreciar qualquer tipo de produção cultural e não apenas a literatura erudita.</feedback>
			<feedback>Tente outra vez! Os teóricos e críticos literários sabem muito sobre a produção literária, especialmente a erudita, mas não são os únicos capazes de definir literatura. Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional. A maior parte dos teóricos e críticos literários rejeita os livros mais vendidos e muito anunciados na imprensa.</feedback>
			<feedback>Muito bem! Para apreciar uma obra literária é preciso conhecer a convenção na qual ela foi produzida.</feedback>
			<feedback>Tente outra vez! A literatura é composta também por produções orais e não apenas por textos escritos. Para ser literária, uma obra não precisa necessariamente ser objeto de análise dos críticos. Tampouco precisa ser estudada na escola ou estar presente em exames vestibulares. Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional.</feedback>
			<feedback>Tente outra vez! Os livros escritos com interesse de vender muito e agradar o grande público são os #i#best-sellers#!i#. Mas os escritores eruditos também se importam com a venda e com a avaliação dos leitores, que precisam ser inteligentes para apreciar qualquer tipo de produção cultural.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>terreiro</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
		 			<quantidade>1</quantidade>
		   <dialogo pers="Nico" contra="Zita">Essas histórias que as antigas escravas da fazenda contam são muito elementares. Coisas simples assim não podem ser chamadas de literatura.</dialogo>;
		</dialogos>
	</questao>

	<questao>
		<enunciado>Mas o que é literatura?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>É um conjunto de obras escritas por homens geniais, superiores aos homens comuns.</alternativa>
			<alternativa>Os teóricos e críticos literários são as únicas pessoas capazes de saber o que é literatura.</alternativa>
			<alternativa>É um conjunto de narrativas e poesias escritas, interpretadas por críticos literários.</alternativa>
			<alternativa>Não há consenso sobre o que é literatura; cada grupo cultural tem uma ideia sobre o que define um texto literário.</alternativa>
			<alternativa>São os livros escritos com interesse de vender muito e agradar o grande público.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A ideia de que os artistas são pessoas geniais surgiu no século XVIII e não corresponde aos fatos. Gente comum também produz obras espetaculares! Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional. É preciso ser inteligente para apreciar qualquer tipo de produção cultural e não apenas a literatura erudita.</feedback>
			<feedback>Tente outra vez! Os teóricos e críticos literários sabem muito sobre a produção literária, especialmente a erudita, mas não são os únicos capazes de definir literatura. Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional. A maior parte dos teóricos e críticos literários rejeita os livros mais vendidos e muito anunciados na imprensa.</feedback>
			<feedback>Tente outra vez! A literatura é composta também por produções orais e não apenas por textos escritos. Para ser literária, uma obra não precisa necessariamente ser objeto de análise dos críticos. Tampouco precisa ser estudada na escola ou estar presente em exames vestibulares. Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional.</feedback>
			<feedback>Muito bem! Para apreciar uma obra literária é preciso conhecer a convenção na qual ela foi produzida.</feedback>
			<feedback>Tente outra vez! Os livros escritos com interesse de vender muito e agradar o grande público são os #i#best-sellers#!i#. Mas os escritores eruditos também se importam com a venda e com a avaliação dos leitores, que precisam ser inteligentes para apreciar qualquer tipo de produção cultural.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>cozinha</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
		 			<quantidade>1</quantidade>
			<dialogo pers="Nico" contra="Zita">Esses causos contados por Seo Antonio são interessantes, mas são muito elementares. Coisas simples assim não podem ser chamadas de literatura.</dialogo>;
		</dialogos>
	</questao>

	<questao>
		<enunciado>Mas o que é literatura?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>É um conjunto de obras escritas por homens geniais, superiores aos homens comuns.</alternativa>
			<alternativa>Os teóricos e críticos literários são as únicas pessoas capazes de saber o que é literatura.</alternativa>
			<alternativa>É um conjunto de narrativas e poesias escritas, interpretadas por críticos literários.</alternativa>
			<alternativa>São os livros escritos com interesse de vender muito e agradar o grande público.</alternativa>
			<alternativa>Não há consenso sobre o que é literatura; cada grupo cultural tem uma ideia sobre o que define um texto literário.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A ideia de que os artistas são pessoas geniais surgiu no século XVIII e não corresponde aos fatos. Gente comum também produz obras espetaculares! Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional. É preciso ser inteligente para apreciar qualquer tipo de produção cultural e não apenas a literatura erudita.</feedback>
			<feedback>Tente outra vez! Os teóricos e críticos literários sabem muito sobre a produção literária, especialmente a erudita, mas não são os únicos capazes de definir literatura. Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional. A maior parte dos teóricos e críticos literários rejeita os livros mais vendidos e muito anunciados na imprensa.</feedback>
			<feedback>Tente outra vez! A literatura é composta também por produções orais e não apenas por textos escritos. Para ser literária, uma obra não precisa necessariamente ser objeto de análise dos críticos. Tampouco precisa ser estudada na escola ou estar presente em exames vestibulares. Cada grupo cultural tem uma definição do que seja uma boa produção poética ou ficcional.</feedback>
			<feedback>Tente outra vez! Os livros escritos com interesse de vender muito e agradar o grande público são os #i#best-sellers#!i#. Mas os escritores eruditos também se importam com a venda e com a avaliação dos leitores, que precisam ser inteligentes para apreciar qualquer tipo de produção cultural.</feedback>
			<feedback>Muito bem! Para apreciar uma obra literária é preciso conhecer a convenção na qual ela foi produzida.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>quarto</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
		 			<quantidade>1</quantidade>
			<dialogo pers="Nico" contra="Zita">As histórias contadas pelos índios da família do Joaquim Bugre são muito elementares. Coisas simples assim não podem ser chamadas de literatura.</dialogo>;
		</dialogos>
	</questao>
</questoes>
			]]> ).toString();
	
	
			questoesEpisodio[1] = (<![CDATA[
<questoes>
	<questao>
		<enunciado>Das Dores falou #i#diacho#!i#. Você sabe que palavra é essa?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>É uma forma alterada de #i#diabo#!i#, usada para evitar essa palavra.</alternativa>
			<alternativa>É uma palavra de outra língua, provavelmente do espanhol.</alternativa>
			<alternativa>Não existe essa palavra, é uma forma inventada pela empregada.</alternativa>
			<alternativa>É a palavra #i#diabo#!i# mal pronunciada – saiu assim sem querer.</alternativa>
			<alternativa>É igual a #i#diabo#!i#, tanto faz dizer uma palavra ou outra.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! É uma maneira de evitar falar #i#diabo#!i#, que é um tabu linguístico para muitas pessoas.</feedback>
			<feedback>Tente outra vez! #i#Diacho#!i# é uma palavra do português, que significa #i#diabo#!i#. É usada para evitar o termo #i#diabo#!i#, que é um tabu linguístico para muitas pessoas.</feedback>
			<feedback>Tente outra vez! É possível criar palavras novas na língua – são os neologismos -, mas não é esse o caso. O termo #i#diacho#!i# existe sim e significa #i#diabo#!i#. É usado para evitar a palavra #i#diabo#!i#, que é um tabu linguístico para muitas pessoas.</feedback>
			<feedback>Tente outra vez! Das Dores falou assim de propósito. O termo #i#diacho#!i# é uma forma alterada de #i#diabo#!i#. É uma maneira de evitar falar #i#diabo#!i#, que é um tabu linguístico para muitas pessoas.</feedback>
			<feedback>Tente outra vez! Faz diferença falar #i#diacho#!i# no lugar de #i#diabo. Diacho#!i# é uma forma alterada de #i#diabo#!i#. É uma maneira de evitar falar #i#diabo#!i#, que é um tabu linguístico para muitas pessoas.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<respcorreta>0</respcorreta>
		<premio>seoraimundo</premio>
		 <dialogos>
		 <quantidade>1</quantidade>
			<dialogo pers="Das_Dores" contra="Dona_Socorro">Diacho, caiu tudo!</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Por que ela não falou de uma vez que Lampião #i#morreu#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque ela é uma empregada e não conhece a expressão adequada.</alternativa>
			<alternativa>Porque preferiu usar uma expressão mais amena para dar a notícia.</alternativa>
			<alternativa>Porque os baianos não usam a expressão adequada.</alternativa>
			<alternativa>Porque ela é analfabeta e não conhece a expressão adequada.</alternativa>
			<alternativa>Porque as mulheres não sabem falar de modo objetivo.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Achar que ela não sabe a expressão porque é uma empregada é preconceito. A expressão que ela usou é adequada e poderia ser usada por qualquer falante. É uma forma mais amena de dizer que alguém morreu. Muitas pessoas consideram que #i#morrer, morte#!i# são palavras chocantes e procuram evitá-las. Isso é o que se chama de tabu linguístico.</feedback>
			<feedback>Muito bem! A empregada quis evitar a palavra #i#morreu#!i# e usou uma expressão mais amena com o mesmo significado. Muitas pessoas consideram que #i#morrer, morte#!i# são palavras chocantes e procuram evitá-las. Isso é o que se chama de tabu linguístico.</feedback>
			<feedback>Tente outra vez! Pensar que os baianos não sabem se expressar adequadamente é preconceito. Essa expressão é adequada e poderia ser usada por qualquer brasileiro. É uma forma mais amena de dizer que alguém morreu. Muitas pessoas consideram que #i#morrer, morte#!i# são palavras chocantes e procuram evitá-las. Isso é o que se chama de tabu linguístico.</feedback>
			<feedback>Tente outra vez! Pensar que os analfabetos não sabem se expressar adequadamente é preconceito. A expressão que ela usou é adequada e poderia ser usada por qualquer falante. É uma forma mais amena de dizer que alguém morreu. Muitas pessoas consideram que #i#morrer, morte#!i# são palavras chocantes e procuram evitá-las. Isso é o que se chama de tabu linguístico.</feedback>
			<feedback>Tente outra vez! Pensar que as mulheres não sabem se expressar objetivamente é preconceito. Tanto homens como mulheres poderiam usar essa expressão. É uma forma mais amena de dizer que alguém morreu. Muitas pessoas consideram que #i#morrer, morte#!i# são palavras chocantes e procuram evitá-las. Isso é o que se chama de tabu linguístico.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>chiquinha</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
		 <quantidade>1</quantidade>
			<dialogo pers="Das_Dores" contra="Dona_Socorro">Lampião passou desta para melhor.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Sabe por que eu mandei ela #i#virar a boca pra lá#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque a senhora queria que Das Dores repetisse o que tinha acabado de dizer.</alternativa>
			<alternativa>Porque a senhora é uma empregada e não sabe se expressar direito.</alternativa>
			<alternativa>Porque a senhora tem medo de que aconteça o que acabou de ser dito.</alternativa>
			<alternativa>Porque a senhora é uma mulher e as mulheres não sabem falar de modo objetivo.</alternativa>
			<alternativa>Porque a senhora é analfabeta e não sabe se expressar direito.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Dona Socorro queria justamente o contrário. #i#Vire essa boca pra lá#!i# é uma expressão informal que se usa quando alguém menciona algo indesejável. Isso revela o poder atribuído às palavras – acredita-se que basta dizer uma coisa para acontecer.</feedback>
			<feedback>Tente outra vez! Achar que ela não sabe se expressar direito porque é uma empregada é preconceito. A frase que ela usou é adequada e poderia ser usada por qualquer falante. #i#Vire essa boca pra lá#!i# é uma expressão informal que se usa quando alguém menciona algo indesejável. Isso revela o poder atribuído às palavras – acredita-se que basta dizer uma coisa para acontecer.</feedback>
			<feedback>Muito bem! #i#Vire essa boca pra lá#!i# é uma expressão informal que se usa quando alguém menciona algo indesejável. Isso revela o poder atribuído às palavras – acredita-se que basta dizer uma coisa para acontecer.</feedback>
			<feedback>Tente outra vez! Pensar que as mulheres não sabem se expressar objetivamente é preconceito. Tanto homens como mulheres poderiam usar essa frase. #i#Vire essa boca pra lá#!i# é uma expressão informal que se usa quando alguém menciona algo indesejável. Isso revela o poder atribuído às palavras – acredita-se que basta dizer uma coisa para ela acontecer.</feedback>
			<feedback>Tente outra vez! Pensar que os analfabetos não sabem se expressar adequadamente é preconceito. A frase que D. Socorro usou é adequada e poderia ser usada por qualquer falante. #i#Vire essa boca pra lá#!i# é uma expressão informal que se usa quando alguém menciona algo indesejável. Isso revela o poder atribuído às palavras – acredita-se que basta dizer uma coisa para ela se tornar realidade.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>padre</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
		 <quantidade>1</quantidade>
			<dialogo pers="Das_Dores" contra="Dona_Socorro">Eu falei que o bebê da Chiquinha podia estar com o cordão enrolado no pescoço. Na hora a D. Socorro falou: Vire essa boca pra lá!</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Sabe por que eu mandei ela #i#bater na boca#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque a senhora é uma empregada e não sabe se expressar direito.</alternativa>
			<alternativa>Porque a senhora acha que somente uma parteira poderia falar desse assunto.</alternativa>
			<alternativa>Porque a senhora é mulher e as mulheres não sabem falar de modo objetivo.</alternativa>
			<alternativa>Porque a senhora tem medo de que aconteça o que acabou de ser dito.</alternativa>
			<alternativa>Porque a senhora é analfabeta e não sabe se expressar direito.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Achar que D. Socorro não sabe se expressar direito porque é uma empregada é preconceito. A frase que ela usou é adequada e poderia ser usada por qualquer falante. #i#Bata na boca#!i# é uma expressão informal que se usa quando alguém menciona algo indesejável. Isso revela o poder atribuído às palavras – acredita-se que basta dizer uma coisa para acontecer.</feedback>
			<feedback>Tente outra vez! Dona Socorro acha que ninguém deveria falar o que Das Dores disse, porque considera que a frase traz mau agouro. #i#Bata na boca#!i# é justamente uma expressão informal que se usa quando alguém menciona algo indesejável. Isso revela o poder atribuído às palavras – acredita-se que basta dizer uma coisa para acontecer.</feedback>
			<feedback>Tente outra vez! Pensar que as mulheres não sabem se expressar objetivamente é preconceito. Tanto homens como mulheres poderiam usar essa frase. #i#Bata na boca#!i# é uma expressão informal que se usa quando alguém menciona algo indesejável. Isso revela o poder atribuído às palavras – acredita-se que basta dizer uma coisa para acontecer.</feedback>
			<feedback>Muito bem! #i#Bata na boca#!i# é uma expressão informal que se usa quando alguém menciona algo indesejável. Isso revela o poder atribuído às palavras – acredita-se que basta dizer para acontecer.</feedback>
			<feedback>Tente outra vez! Pensar que os analfabetos não sabem se expressar adequadamente é preconceito. A frase que D. Socorro usou é adequada e poderia ser usada por qualquer falante. #i#Bata na boca#!i# é uma expressão informal que se usa quando alguém menciona algo indesejável. Isso revela o poder atribuído às palavras – acredita-se que basta dizer uma coisa para acontecer.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>cegoaderaldo</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
		 <quantidade>1</quantidade>
			<dialogo pers="Das_Dores" contra="Dona_Socorro">Eu falei que o bebê da Chiquinha podia estar sentado, por isso não nasce. Na hora a D. Socorro falou: Bata na boca!</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Por que ela não falou de uma vez que Belinha #i#vomitou#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque ela é uma empregada e não conhece a expressão adequada.</alternativa>
			<alternativa>Porque as mulheres não sabem falar de modo objetivo.</alternativa>
			<alternativa>Porque ela é baiana e os baianos não usam a expressão adequada.</alternativa>
			<alternativa>Porque ela é analfabeta e não conhece a expressão adequada.</alternativa>
			<alternativa>Porque ela preferiu usar uma expressão mais amena.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Achar que ela não sabe a expressão porque é uma empregada é preconceito. A expressão é adequada e poderia ser usada por qualquer falante em situações informais - é uma forma mais amena de dizer que alguém #i#vomitou#!i#. Muitas pessoas consideram desagradáveis as palavras relacionadas a excreção e por isso as evitam. São tabus linguísticos.</feedback>
			<feedback>Tente outra vez! Pensar que as mulheres não sabem se expressar objetivamente é preconceito. Tanto homens como mulheres poderiam usar essa expressão – trata-se de uma forma mais amena de dizer que alguém #i#vomitou#!i#. Muitas pessoas consideram desagradáveis as palavras relacionadas a excreção e por isso as evitam. São tabus linguísticos.</feedback>
			<feedback>Tente outra vez! Pensar que os baianos não sabem se expressar adequadamente é preconceito. A expressão é adequada e poderia ser usada por qualquer brasileiro - é uma forma mais amena de dizer que alguém #i#vomitou#!i#. Muitas pessoas consideram desagradáveis as palavras relacionadas a excreção e por isso as evitam. São tabus linguísticos.</feedback>
			<feedback>Tente outra vez! Pensar que os analfabetos não sabem se expressar adequadamente é preconceito. A expressão que ela usou é adequada e poderia ser usada por qualquer falante - é uma forma mais amena de dizer que alguém #i#vomitou#!i#. Muitas pessoas consideram desagradáveis as palavras relacionadas a excreção e por isso as evitam. São tabus linguísticos.</feedback>
			<feedback>Muito bem! A empregada quis evitar a palavra #i#vomitou#!i# e usou uma expressão mais amena com o mesmo significado. Muitas pessoas consideram desagradáveis as palavras relacionadas a excreção e por isso as evitam. São tabus linguísticos.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>donamaria</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
			<dialogo pers="Das_Dores" contra="Dona_Socorro">Belinha abusou na festa e depois #i#devolveu#!i# tudo o que comeu.</dialogo>
		</dialogos>
	</questao>
</questoes>
			
			]]> ).toString();
			
			questoesEpisodio[2] = (<![CDATA[
<questoes>
	<questao>
		<enunciado>Você acha que não é português mesmo?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>A palavra #i#caju#!i# é de origem indígena, mas faz parte do português pois nossa língua incorporou vários termos indígenas.</alternativa>
			<alternativa>A palavra #i#caju#!i# é de origem indígena e por isso não faz parte do português – nossa língua só tem palavras de origem europeia.</alternativa>
			<alternativa>A palavra #i#caju#!i# é de origem indígena e faz parte do português, mas só é usada por descendentes de índios.</alternativa>
			<alternativa>A palavra #i#caju#!i# é de origem indígena e faz parte do português, mas deve ser evitada em situações formais.</alternativa>
			<alternativa>A palavra #i#caju#!i# é de origem indígena e não faz parte do português – uma língua nunca recebe palavras de outra.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! A presença de palavras de origem indígena é um dos aspectos que diferenciam o português falado no Brasil do que é falado em Portugal. Em nossa língua, é notável, por exemplo, a quantidade de termos ligados à fauna e à flora que são de origem indígena como é o caso de #i#caju#!i#.</feedback>
			<feedback>Tente outra vez! O português falado no Brasil é resultado do contato da língua portuguesa europeia com diversos grupos lingüísticos. Indígenas, africanos, europeus e asiáticos tiveram algum tipo de influência na formação de nossa língua. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à flora e à fauna que são de origem indígena, como é o caso de #i#caju#!i#.</feedback>
			<feedback>Tente outra vez! Todas as palavras da língua, independentemente de sua procedência, podem ser usadas por todos os falantes. Uma vez incorporadas à língua, como é o caso de #i#caju#!i#, de origem indígena, palavras de qualquer origem podem ser utilizadas por pessoas de qualquer ascendência.</feedback>
			<feedback>Tente outra vez! O que determina o grau de formalidade de uma palavra não é sua origem, mas sim seu contexto de uso habitual. #i#Caju#!i#, por exemplo, palavra de origem indígena, pode ser usada tanto em situações formais quanto em situações coloquiais. Já a expressão #i#ficar uma arara#!i#, que também tem o elemento de origem indígena #i#arara#!i#, costuma ser usada em situações informais.</feedback>
			<feedback>Tente outra vez! Todas as línguas recebem empréstimos de outras. O português falado no Brasil é resultado do contato da língua portuguesa europeia com diversos grupos lingüísticos. Indígenas, africanos, europeus e asiáticos tiveram algum tipo de influência na formação do português que utilizamos. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à fauna e à flora que são de origem indígena, como é o caso de #i#caju#!i#.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>mundinho</premio>
		<respcorreta>0</respcorreta>
		 <dialogos>
			<quantidade>2</quantidade>
			<dialogo pers="Chiquinha" contra="Joaquim_Bugre">Estou com vontade de comer #i#caju#!i#.</dialogo>
			<dialogo pers="Joaquim_Bugre">#i#Caju#!i# é uma palavra de língua indígena. Não é português.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Você acha que não é português mesmo?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>A palavra #i#pitanga#!i# é de origem indígena e por isso não faz parte do português – nossa língua só tem palavras de origem europeia.</alternativa>
			<alternativa>A palavra #i#pitanga#!i# é de origem indígena, mas faz parte do português, pois nossa língua incorporou vários termos indígenas.</alternativa>
			<alternativa>A palavra #i#pitanga#!i# é de origem indígena e faz parte do português, mas só é usada por descendentes de índios.</alternativa>
			<alternativa>A palavra #i#pitanga#!i# é de origem indígena e faz parte do português, mas deve ser evitada em situações formais.</alternativa>
			<alternativa>A palavra #i#pitanga#!i# é de origem indígena e não faz parte do português – uma língua nunca recebe palavras de outra.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! O português falado no Brasil é resultado do contato da língua portuguesa europeia com diversos grupos lingüísticos. Indígenas, africanos, europeus e asiáticos tiveram algum tipo de influência na formação de nossa língua. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à flora e à fauna que são de origem indígena, como é o caso de #i#pitanga#!i#.</feedback>
			<feedback>Muito bem! A presença de palavras de origem indígena é um dos aspectos que diferenciam o português falado no Brasil do que é falado em Portugal. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à fauna e à flora que são de origem indígena como é o caso de #i#pitanga#!i#.</feedback>
			<feedback>Tente outra vez! Todas as palavras da língua, independentemente de sua procedência, podem ser usadas por todos os falantes. Uma vez incorporadas à língua, como é o caso de  #i#pitanga#!i#, de origem indígena, palavras de qualquer origem podem ser utilizadas por pessoas de qualquer ascendência.</feedback>
			<feedback>Tente outra vez! O que determina o grau de formalidade de uma palavra não é sua origem, mas sim seu contexto de uso habitual. #i#Pitanga#!i#, por exemplo, palavra de origem indígena, pode ser usada tanto em situações formais quanto em situações coloquiais. Já a expressão #i#ficar uma arara#!i#, que também tem o elemento de origem indígena #i#arara#!i#, costuma ser usada em situações informais.</feedback>
			<feedback>Tente outra vez! Todas as línguas recebem empréstimos de outras. O português falado no Brasil é resultado do contato da língua portuguesa europeia com diversos grupos lingüísticos. Indígenas, africanos, europeus e asiáticos tiveram algum tipo de influência na formação do português que utilizamos. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à fauna e à flora que são de origem indígena, como é o caso de #i#pitanga#!i#.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>joaquimbugre</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
		 <quantidade>2</quantidade>
			<dialogo pers="Chiquinha" contra="Joaquim_Bugre">Que delícia de #i#pitanga#!i#!</dialogo>
			<dialogo pers="Joaquim_Bugre">#i#Pitanga#!i# é palavra de língua indígena, não é da língua portuguesa.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Você acha que não é português mesmo?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>A palavra #i#jabuticaba#!i# é de origem indígena e faz parte do português, mas só é usada por descendentes de índios.</alternativa>
			<alternativa>A palavra #i#jabuticaba#!i# é de origem indígena e por isso não faz parte do português – nossa língua só tem palavras de origem europeia.</alternativa>
			<alternativa>A palavra #i#jabuticaba#!i# é de origem indígena, mas faz parte do português, pois nossa língua incorporou vários termos indígenas.</alternativa>
			<alternativa>A palavra #i#jabuticaba#!i# é de origem indígena e faz parte do português, mas deve ser evitada em situações formais.</alternativa>
			<alternativa>A palavra #i#jabuticaba#!i# é de origem indígena e não faz parte do português – uma língua nunca recebe palavras de outra.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Todas as palavras da língua, independentemente de sua procedência, podem ser usadas por todos os falantes. Uma vez incorporadas à língua, como é o caso de #i#jabuticaba#!i#, de origem indígena, palavras de qualquer origem podem ser utilizadas por pessoas de qualquer ascendência.</feedback>
			<feedback>Tente outra vez! O português falado no Brasil é resultado do contato da língua portuguesa europeia com diversos grupos lingüísticos. Indígenas, africanos, europeus e asiáticos tiveram algum tipo de influência na formação de nossa língua. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à flora e à fauna que são de origem indígena, como é o caso de #i#jabuticaba#!i#.</feedback>
			<feedback>Muito bem! A presença de palavras de origem indígena é um dos aspectos que diferenciam o português falado no Brasil do que é falado em Portugal. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à fauna e à flora que são de origem indígena como é o caso de #i#jabuticaba#!i#.</feedback>
			<feedback>Tente outra vez! O que determina o grau de formalidade de uma palavra não é sua origem, mas sim seu contexto de uso habitual. #i#Jabuticaba#!i#, por exemplo, palavra de origem indígena, pode ser usada tanto em situações formais quanto em situações coloquiais. Já a expressão #i#ficar uma arara#!i#, que também tem o elemento de origem indígena #i#arara#!i#, costuma ser usada em situações informais.</feedback>
			<feedback>Tente outra vez! Todas as línguas recebem empréstimos de outras. O português falado no Brasil é resultado do contato da língua portuguesa europeia com diversos grupos lingüísticos. Indígenas, africanos, europeus e asiáticos tiveram algum tipo de influência na formação do português que utilizamos. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à fauna e à flora que são de origem indígena, como é o caso de #i#jabuticaba#!i#.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>zita</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
		 <quantidade>2</quantidade>
			<dialogo pers="Chiquinha" contra="Joaquim_Bugre">Eu detesto #i#jabuticaba#!i#!</dialogo>
			<dialogo pers="Joaquim_Bugre">Ué, você deu para falar palavra de língua indígena agora? #i#Jabuticaba#!i# é palavra da minha língua. Não é português.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Você acha que não é português mesmo?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>A palavra #i#abacaxi#!i# é de origem indígena e faz parte do português, mas deve ser evitada em situações formais.</alternativa>
			<alternativa>A palavra #i#abacaxi#!i# é de origem indígena e por isso não faz parte do português – nossa língua só tem palavras de origem europeia.</alternativa>
			<alternativa>A palavra #i#abacaxi#!i# é de origem indígena e faz parte do português, mas só é usada por descendentes de índios.</alternativa>
			<alternativa>A palavra #i#abacaxi#!i# é de origem indígena, mas faz parte do português, pois nossa língua incorporou vários termos indígenas.</alternativa>
			<alternativa>A palavra #i#abacaxi#!i# é de origem indígena e não faz parte do português – uma língua nunca recebe palavras de outra.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! O que determina o grau de formalidade de uma palavra não é sua origem, mas sim seu contexto de uso habitual. #i#Abacaxi#!i#, por exemplo, palavra de origem indígena, pode ser usada tanto em situações formais quanto em situações coloquiais. Já a expressão #i#descascar um abacaxi#!i#, que também tem o elemento de origem indígena, costuma ser usada em situações informais.</feedback>
			<feedback>Tente outra vez! O português falado no Brasil é resultado do contato da língua portuguesa europeia com diversos grupos lingüísticos. Indígenas, africanos, europeus e asiáticos tiveram algum tipo de influência na formação de nossa língua. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à flora e à fauna que são de origem indígena, como é o caso de #i#abacaxi#!i#.</feedback>
			<feedback>Tente outra vez! Todas as palavras da língua, independentemente de sua procedência, podem ser usadas por todos os falantes. Uma vez incorporadas à língua, como é o caso de #i#abacaxi#!i#, de origem indígena, palavras de qualquer origem podem ser utilizadas por pessoas de qualquer ascendência.</feedback>
			<feedback>Muito bem! A presença de palavras de origem indígena é um dos aspectos que diferenciam o português falado no Brasil do que é falado em Portugal. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à fauna e à flora que são de origem indígena, como é o caso de #i#abacaxi#!i#.</feedback>
			<feedback>Tente outra vez! Todas as línguas recebem empréstimos de outras. O português falado no Brasil é resultado do contato da língua portuguesa europeia com diversos grupos lingüísticos. Indígenas, africanos, europeus e asiáticos tiveram algum tipo de influência na formação do português que utilizamos. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à fauna e à flora que são de origem indígena, como é o caso de #i#abacaxi#!i#.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>donajosefa</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
		 	<quantidade>2</quantidade>
			<dialogo pers="Chiquinha" contra="Joaquim_Bugre">Humm, desde que nosso filho nasceu, estou com vontade de comer #i#abacaxi#!i#!</dialogo>
			<dialogo pers="Joaquim_Bugre">#i#Abacaxi#!i# é uma palavra de língua indígena, então não é português.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Você acha que não é português mesmo?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>A palavra #i#mandioca#!i# é de origem indígena e não faz parte do português – uma língua nunca recebe palavras de outra.</alternativa>
			<alternativa>A palavra #i#mandioca#!i# é de origem indígena e por isso não faz parte do português – nossa língua só tem palavras de origem europeia.</alternativa>
			<alternativa>A palavra #i#mandioca#!i# é de origem indígena e faz parte do português, mas só é usada por descendentes de índios.</alternativa>
			<alternativa>A palavra #i#mandioca#!i# é de origem indígena e faz parte do português, mas deve ser evitada em situações formais.</alternativa>
			<alternativa>A palavra #i#mandioca#!i# é de origem indígena, mas faz parte do português, pois nossa língua incorporou vários termos indígenas.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Todas as línguas recebem empréstimos de outras. O português falado no Brasil é resultado do contato da língua portuguesa europeia com diversos grupos linguísticos. Indígenas, africanos, europeus e asiáticos tiveram algum tipo de influência na formação do português que utilizamos. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à fauna e à flora que são de origem indígena, como é o caso de #i#mandioca#!i#.</feedback>
			<feedback>Tente outra vez! O português falado no Brasil é resultado do contato da língua portuguesa europeia com diversos grupos linguísticos. Indígenas, africanos, europeus e asiáticos tiveram algum tipo de influência na formação de nossa língua. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à flora e à fauna que são de origem indígena, como é o caso de #i#mandioca#!i#.</feedback>
			<feedback>Tente outra vez! Todas as palavras da língua, independentemente de sua procedência, podem ser usadas por todos os falantes. Uma vez incorporadas à língua, como é o caso de #i#mandioca#!i#, de origem indígena, palavras de qualquer origem podem ser utilizadas por pessoas de qualquer ascendência.</feedback>
			<feedback>Tente outra vez! O que determina o grau de formalidade de uma palavra não é sua origem, mas sim seu contexto de uso habitual. #i#Mandioca#!i#, por exemplo, palavra de origem indígena, pode ser usada tanto em situações formais quanto em situações coloquiais. Já a expressão #i#descascar um abacaxi#!i#, que também tem o elemento de origem indígena #i#abacaxi#!i#, costuma ser usada em situações informais.</feedback>
			<feedback>Muito bem! A presença de palavras de origem indígena é um dos aspectos que diferenciam o português falado no Brasil do que é falado em Portugal. Em nosso vocabulário, por exemplo, é notável a quantidade de termos ligados à fauna e à flora que são de origem indígena como é o caso de #i#mandioca#!i#.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>zepretinho</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
			<quantidade>2</quantidade>
			<dialogo pers="Chiquinha" contra="Joaquim_Bugre">Já é tempo da colheita de #i#mandioca#!i#!</dialogo>
			<dialogo pers="Joaquim_Bugre">#i#Mandioca#!i# é muito gostosa mesmo, e essa palavra é de língua indígena, não é português.</dialogo>
		</dialogos>
	</questao>
</questoes>
			]]> ).toString();
			
			questoesEpisodio[3] = (<![CDATA[
<questoes>
	<questao>
		<enunciado>Nossa! Como o Miguel falou complicado! Por que ele disse #i#humilde lar#!i# em vez de dizer #i#casa humilde#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque, como era uma cerimônia, Miguel usou uma linguagem mais formal.</alternativa>
			<alternativa>Porque Miguel é um bom falante de português e sempre usa linguagem formal.</alternativa>
			<alternativa>Porque Miguel falava a pessoas mais velhas e com elas só se usa linguagem formal.</alternativa>
			<alternativa>Porque era um agradecimento e as pessoas são sempre formais nessas situações. </alternativa>
			<alternativa>Porque Miguel estudou mais então sempre usa a linguagem de maneira formal.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! O emprego da expressão #i#humilde lar#!i# tornou a fala de Miguel mais formal do que se ele usasse a expressão #i#casa humilde#!i#. Mesmo tendo significados semelhantes, a palavra #i#lar#!i# tem um uso mais formal que a palavra #i#casa#!i#. A inversão entre adjetivo e substantivo (humilde lar X lar humilde) também deu um tom mais formal à fala. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial.</feedback>
			<feedback>Tente outra vez! Apesar de haver pessoas que sejam mais formais em sua linguagem, “o bom falante” de uma língua é aquele que consegue adequar seu uso à situação de fala. O agradecimento era um momento cerimonioso da festa e o emprego da expressão #i#humilde lar#!i# tornou a fala de Miguel mais formal do que se ele usasse a expressão #i#casa humilde#!i#. Mesmo tendo significados semelhantes, a palavra #i#lar#!i# tem um uso mais formal que a palavra #i#casa#!i#. A inversão entre adjetivo e substantivo (humilde lar X lar humilde) também deu um tom mais formal à fala. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial.</feedback>
			<feedback>Tente outra vez! Apesar de haver pessoas que sejam mais formais em sua linguagem, “o bom falante” de uma língua é aquele que consegue adequar seu uso à situação de fala. O agradecimento era um momento cerimonioso da festa e o emprego da expressão #i#humilde lar#!i# tornou a fala de Miguel mais formal do que se ele usasse a expressão #i#casa humilde#!i#. Mesmo tendo significados semelhantes, a palavra #i#lar#!i# tem um uso mais formal que a palavra #i#casa#!i#. A inversão entre adjetivo e substantivo (humilde lar X lar humilde) também deu um tom mais formal à fala. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial.</feedback>
			<feedback>Tente outra vez! Os agradecimentos podem ser formais ou informais: é a situação que vai indicar o uso mais adequado. O agradecimento era um momento cerimonioso da festa e o emprego da expressão #i#humilde lar#!i# tornou a fala de Miguel mais formal, portanto mais adequada, do que se ele usasse a expressão #i#casa humilde#!i#. Mesmo tendo significados semelhantes, a palavra #i#lar#!i# tem um uso mais formal que a palavra #i#casa#!i#. A inversão entre adjetivo e substantivo (humilde lar X lar humilde) também deu um tom mais formal à fala. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial.</feedback>
			<feedback>Tente outra vez! As pessoas mais escolarizadas podem utilizar a linguagem de maneira mais formal, mas não o fazem em todas as situações. O agradecimento era um momento cerimonioso da festa e o emprego da expressão #i#humilde lar#!i# tornou a fala de Miguel mais formal do que se ele usasse a expressão #i#casa humilde#!i#. Mesmo tendo significados semelhantes, a palavra #i#lar#!i# tem um uso mais formal que a palavra #i#casa#!i#. A inversão entre adjetivo e substantivo (humilde lar X lar humilde) também deu um tom mais formal à fala. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>bau</premio>
		<respcorreta>0</respcorreta>
		 <dialogos>
		 	<quantidade>1</quantidade>
			<dialogo pers="Zeca" contra="Seo_Raimundo">O Pedro gravou no Ipod o agradecimento do Miguel, quer ouvir?
“Caríssimos amigos,
Nesta data tão especial, temos a honra de receber vossas senhorias em nosso humilde lar para comemorar mais uma primavera dessa afortunada união que gerou tantos frutos ao longo de 40 anos! Em nome de meus pais, Seo Raimundo e Dona Josefa, gostaria de agradecer imensamente a presença de todos que muito nos honra! Muito agradecido!”</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Nossa! Como o Miguel falou complicado! Por que ele disse #i#afortunada união#!i# em vez de dizer #i#união feliz#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque Miguel é um bom falante de português e sempre usa linguagem formal.</alternativa>
			<alternativa>Porque, como era uma cerimônia, Miguel usou uma linguagem formal.</alternativa>
			<alternativa>Porque Miguel falava a pessoas mais velhas e com elas só se usa linguagem formal.</alternativa>
			<alternativa>Porque era um agradecimento e as pessoas são sempre formais nessas situações. </alternativa>
			<alternativa>Porque Miguel estudou mais então sempre usa a linguagem de maneira formal.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Apesar de haver pessoas que sejam mais formais em sua linguagem, “o bom falante” de uma língua é aquele que consegue adequar seu uso à situação de fala. O agradecimento era um momento cerimonioso da festa e o emprego da expressão #i#afortunada união#!i# tornou a fala de Miguel mais formal do que se ele usasse a expressão #i#união feliz#!i#. Mesmo tendo significados semelhantes, a palavra #i#afortunada#!i# tem um uso mais formal que a palavra #i#feliz#!i#. A inversão entre adjetivo e substantivo (afortunada união X união afortunada) também deu um tom mais formal à fala. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial.</feedback>
			<feedback>Muito bem! O emprego da expressão #i#afortunada união#!i# tornou a fala de Miguel mais formal do que se ele usasse a expressão #i#união feliz#!i#. Mesmo tendo significados semelhantes, a palavra #i#afortunada#!i# tem um uso mais formal que a palavra #i#feliz#!i#. A inversão entre adjetivo e substantivo (afortunada união X união afortunada) também deu um tom mais formal à fala. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial.</feedback>
			<feedback>Tente outra vez! O fato de haver pessoas mais velhas em uma situação comunicativa pode tornar a fala mais respeitosa, mas não necessariamente mais formal. O agradecimento era um momento cerimonioso da festa e o emprego da expressão #i#afortunada união#!i# tornou a fala de Miguel mais formal do que se ele usasse a expressão #i#união feliz#!i#. Mesmo tendo significados semelhantes, a palavra #i#afortunada#!i# tem um uso mais formal que a palavra #i#feliz#!i#. A inversão entre adjetivo e substantivo (afortunada união X união afortunada) também deu um tom mais formal à fala. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial.</feedback>
			<feedback>Tente outra vez! Os agradecimentos podem ser formais ou informais: é a situação que vai indicar o uso mais adequado. O agradecimento era um momento cerimonioso da festa e o emprego da expressão #i#afortunada união#!i# tornou a fala de Miguel mais formal, portanto mais adequada, do que se ele usasse a expressão #i#união feliz#!i#. Mesmo tendo significados semelhantes, a palavra #i#afortunada#!i# tem um uso mais formal que a palavra #i#feliz#!i#. A inversão entre adjetivo e substantivo (afortunada união X união afortunada) também deu um tom mais formal à fala. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial.</feedback>
			<feedback>Tente outra vez! As pessoas mais escolarizadas podem utilizar a linguagem de maneira mais formal, mas não o fazem em todas as situações. O emprego da expressão #i#afortunada união#!i# tornou a fala de Miguel mais formal do que se ele usasse a expressão #i#união feliz#!i#. Mesmo tendo significados semelhantes, a palavra #i#afortunada#!i# tem um uso mais formal que a palavra #i#feliz#!i#. A inversão entre adjetivo e substantivo (afortunada união X união afortunada) também deu um tom mais formal à fala. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>envelope</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Zeca" contra="Seo_Raimundo">O Pedro gravou no Ipod o agradecimento do Miguel, quer ouvir?
“Caríssimos amigos,
Nesta data tão especial, temos a honra de receber vossas senhorias em nosso humilde lar para comemorar mais uma primavera dessa afortunada união que gerou tantos frutos ao longo de 40 anos! Em nome de meus pais, Seo Raimundo e Dona Josefa, gostaria de agradecer imensamente a presença de todos que muito nos honra! Muito agradecido!”</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Nossa! Como o padre Osório falou complicado! Por que ele disse #i#no seio desta digníssima família#!i# em vez de dizer #i#nesta casa#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque os padres sempre usam linguagem formal em todas as situações.</alternativa>
			<alternativa>Porque o padre falava para pessoas mais velhas e com elas só se usa linguagem formal.</alternativa>
			<alternativa>Porque era uma cerimônia, então o padre usou uma linguagem formal.</alternativa>
			<alternativa>Porque o padre é um bom falante de português e sempre usa linguagem formal.</alternativa>
			<alternativa>Porque as pessoas que estudaram mais sempre usam a linguagem de modo formal.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Os padres, assim como qualquer falante, não utilizam linguagem formal em todas as situações, mas em cerimônias como a do exemplo, sim. O emprego da expressão #i#no seio desta digníssima família#!i# tornou a fala do padre mais formal do que se ele usasse a expressão #i#nesta casa#!i#. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial. O falante vai utilizar esses recursos de acordo com a situação.</feedback>
			<feedback>Tente outra vez! O fato de haver pessoas mais velhas em uma situação comunicativa pode tornar a fala mais respeitosa, mas não necessariamente mais formal. O padre usou a expressão #i#no seio desta digníssima família#!i#, mais formal que a expressão #i#nesta casa#!i#, porque se tratava de uma cerimônia. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial. O falante vai utilizar esses recursos de acordo com a situação.</feedback>
			<feedback>Muito bem! O emprego da expressão #i#no seio desta digníssima família#!i# tornou a fala do padre mais formal do que se ele usasse a expressão #i#nesta casa#!i#. Deste modo, a fala do padre ficou adequada à situação cerimoniosa. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial. O falante utiliza esses recursos de acordo com a situação.</feedback>
			<feedback>Tente outra vez! Apesar de haver pessoas que sejam mais formais em sua linguagem, “o bom falante” de uma língua é aquele que consegue adequar seu uso à situação de fala. O padre usou a expressão #i#no seio desta digníssima família#!i#, mais formal que a expressão #i#nesta casa#!i#, porque se tratava de uma cerimônia. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial.</feedback>
			<feedback>Tente outra vez! As pessoas mais escolarizadas não utilizam linguagem formal o tempo todo. O padre usou a expressão #i#no seio desta digníssima família#!i#, mais formal que a expressão #i#nesta casa#!i#, porque se tratava de uma cerimônia. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial. O falante vai utilizar esses recursos de acordo com a situação.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>presente</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Zeca" contra="Seo_Raimundo">O Pedro gravou no Ipod a bênção do Padre Osório, quer ouvir?
“Caríssimos irmãos, estamos aqui reunidos, no seio desta digníssima família, para celebrar as bodas de esmeralda deste distinto casal que tanto honra a nossa comunidade barreirense. Muitos de vós vão me perguntar o que manteria um matrimônio feliz durante 40 anos e eu vos responderei, caríssimos: é o incontestável amor entre os cônjuges! Que esta união perdure feliz e harmoniosa, com a bênção de Deus. Amém”.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Nossa! Como o padre Osório falou complicado! Por que ele disse #i#matrimônio#!i#, em vez de dizer #i#casamento#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque os padres sempre usam linguagem formal, em qualquer situação.</alternativa>
			<alternativa>Porque o padre falava para pessoas mais velhas e com elas só se usa linguagem formal.</alternativa>
			<alternativa>Porque o padre é um bom falante de português e sempre usa linguagem formal.</alternativa>
			<alternativa>Porque era uma cerimônia, então o padre usou uma linguagem formal.</alternativa>
			<alternativa>Porque as pessoas que estudaram mais sempre usam a linguagem de modo formal.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Os padres, assim como qualquer falante, não utilizam linguagem formal em todas as situações, mas em cerimônias como a do exemplo, sim. O emprego do termo #i#matrimônio#!i# tornou a fala do padre mais formal do que se ele usasse o termo #i#casamento#!i#. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial. O falante vai utilizar esses recursos de acordo com a situação.</feedback>
			<feedback>Tente outra vez! O fato de haver pessoas mais velhas em uma situação comunicativa pode tornar a fala mais respeitosa, mas não necessariamente mais formal. O padre usou o termo #i#matrimônio#!i#, mais formal que o termo #i#casamento#!i#, porque se tratava de uma cerimônia. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial. O falante vai utilizar esses recursos de acordo com a situação.</feedback>
			<feedback>Tente outra vez! Apesar de haver pessoas que sejam mais formais em sua linguagem, “o bom falante” de uma língua é aquele que consegue adequar seu uso à situação de fala. O padre usou o termo #i#matrimônio#!i#, mais formal que o termo #i#casamento#!i#, porque se tratava de uma cerimônia. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial.</feedback>
			<feedback>Muito bem! O emprego do termo #i#matrimônio#!i# tornou a fala do padre mais formal do que se ele usasse o termo #i#casamento#!i#. Deste modo, a fala do padre ficou adequada à situação, uma cerimônia. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial. O falante vai utilizar esses recursos de acordo com a situação.</feedback>
			<feedback>Tente outra vez! As pessoas mais escolarizadas não utilizam linguagem formal o tempo todo. O padre usou o termo #i#matrimônio#!i#, mais formal que o termo #i#casamento#!i#, porque se tratava de uma cerimônia. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial. O falante vai utilizar esses recursos de acordo com a situação.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>pasta</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Zeca" contra="Seo_Raimundo">O Pedro gravou no Ipod a bênção do Padre Osório, quer ouvir?
“Caríssimos irmãos, estamos aqui reunidos, no seio desta digníssima família, para celebrar as bodas de esmeralda deste distinto casal que tanto honra a nossa comunidade barreirense. Muitos de vós vão me perguntar o que manteria um matrimônio feliz durante 40 anos e eu vos responderei, caríssimos: é o incontestável amor entre os cônjuges! Que esta união perdure feliz e harmoniosa, com a bênção de Deus. Amém”.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Nossa! Como o padre Osório falou complicado! Por que ele disse #i#amor entre os cônjuges#!i#, em vez de dizer #i#amor entre marido e mulher#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque os padres sempre usam linguagem formal, em qualquer situação.</alternativa>
			<alternativa>Porque o padre falava para pessoas mais velhas e com elas só se usa linguagem formal.</alternativa>
			<alternativa>Porque o padre é um bom falante de português e sempre usa linguagem formal.</alternativa>
			<alternativa>Porque as pessoas que estudaram mais sempre usam a linguagem de modo formal.</alternativa>
			<alternativa>Porque era uma cerimônia, então o padre usou uma linguagem formal.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Os padres, assim como qualquer falante, não utilizam linguagem formal em todas as situações, mas em cerimônias como a do exemplo, sim. O emprego da expressão #i#amor entre os cônjuges#!i# tornou a fala do padre mais formal do que se ele usasse a expressão #i#amor entre marido e mulher#!i#. Toda língua tem recursos para deixar a fala ou a escrita mais formal ou mais coloquial. O falante vai utilizar esses recursos de acordo com a situação.</feedback>
			<feedback>Tente outra vez! O fato de haver pessoas mais velhas em uma situação comunicativa pode tornar a fala mais respeitosa, mas não necessariamente mais formal. O padre usou a expressão #i#amor entre os cônjuges#!i#, mais formal que a expressão #i#amor entre marido e mulher#!i#, porque se tratava de uma cerimônia. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial. O falante vai utilizar esses recursos de acordo com a situação.</feedback>
			<feedback>Tente outra vez! Apesar de haver pessoas que sejam mais formais em sua linguagem, “o bom falante” de uma língua é aquele que consegue adequar seu uso à situação de fala. O padre usou a expressão #i#amor entre os cônjuges#!i#, mais formal que a expressão #i#amor entre marido e mulher#!i#, porque se tratava de uma cerimônia. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial.</feedback>
			<feedback>Tente outra vez! As pessoas mais escolarizadas não utilizam linguagem formal o tempo todo. O padre usou a expressão #i#amor entre os cônjuges#!i#, mais formal que a expressão #i#amor entre marido e mulher#!i#, porque se tratava de uma cerimônia. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial. O falante vai utilizar esses recursos de acordo com a situação.</feedback>
			<feedback>Muito bem! O emprego da expressão #i#amor entre os cônjuges#!i# tornou a fala do padre mais formal do que se ele usasse a expressão #i#amor entre marido e mulher#!i#. Deste modo, a fala do padre ficou adequada à situação, uma cerimônia. Toda língua tem recursos para tornar a fala ou a escrita mais formal ou mais coloquial. O falante vai utilizar esses recursos de acordo com a situação.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>ipod</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Zeca" contra="Seo_Raimundo">O Pedro gravou no Ipod a bênção do Padre Osório, quer ouvir?
“Caríssimos irmãos, estamos aqui reunidos, no seio desta digníssima família, para celebrar as bodas de esmeralda deste distinto casal que tanto honra a nossa comunidade barreirense. Muitos de vós vão me perguntar o que manteria um matrimônio feliz durante 40 anos e eu vos responderei, caríssimos: é o incontestável amor entre os cônjuges! Que esta união perdure feliz e harmoniosa, com a bênção de Deus. Amém”.</dialogo>
		</dialogos>
	</questao>
</questoes>
			]]> ).toString();
			
			questoesEpisodio[4] = (<![CDATA[
<questoes>
	<questao>
		<enunciado>Só pela manchete já dá para perceber se a notícia vai falar mal ou bem de Lampião, concorda?</enunciado> 
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim! As palavras empregadas nessa manchete revelam um ponto de vista negativo sobre Lampião.</alternativa>
			<alternativa>Não! As palavras empregadas são neutras e não revelam nenhum ponto de vista sobre Lampião.</alternativa>
			<alternativa>Não! A manchete é excessivamente curta, por isso o leitor não percebe um ponto de vista sobre Lampião.</alternativa>
			<alternativa>Sim! As palavras empregadas tornam a manchete imparcial e revelam um ponto de vista neutro sobre Lampião.</alternativa>
			<alternativa>Sim! A elaboração da manchete permite perceber um ponto de vista favorável a Lampião.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! Nessa manchete, o uso conjunto das palavras #i#famigerado, bando, atacam#!i# revela um ponto de vista negativo em relação a Lampião e seu grupo. #i#Famigerado#!i# é usado com sentido de #i#mal afamado; bando#!i# remete a um grupo de mal feitores; #i#atacam#!i# indica uma ação agressiva.</feedback>
			<feedback>Tente outra vez! Embora seja possível conceber enunciados informativos que não revelem um ponto de vista específico, não é esse o caso. Nessa manchete, o uso conjunto das palavras #i#famigerado, bando, atacam#!i# revela um ponto de vista negativo em relação a Lampião e seu grupo. #i#Famigerado#!i# é usado com sentido de #i#mal afamado; bando#!i# remete a um grupo de mal feitores; #i#atacam#!i# indica uma ação agressiva.</feedback>
			<feedback>Tente outra vez! O tamanho de um texto não é um elemento decisivo para a expressão um ponto de vista. Mesmo sendo curta, essa manchete expressa um ponto de vista negativo em relação a Lampião e seu grupo pelo uso conjunto das palavras #i#famigerado, bando, atacam. Famigerado#!i# é usado com sentido de #i#mal afamado; bando#!i# remete a um grupo de mal feitores; #i#atacam#!i# indica uma ação agressiva.</feedback>
			<feedback>Tente outra vez! Embora seja possível conceber enunciados informativos que não revelem um ponto de vista específico, não é esse o caso aqui. Nessa manchete, o uso conjunto das palavras #i#famigerado, bando, atacam#!i# revela um ponto de vista negativo em relação a Lampião e seu grupo. #i#Famigerado#!i# é usado com sentido de #i#mal afamado; bando#!i# remete a um grupo de mal feitores; #i#atacam#!i# indica uma ação agressiva.</feedback>
			<feedback>Tente outra vez! Nessa manchete, o uso conjunto das palavras #i#famigerado, bando, atacam#!i# revela um ponto de vista negativo em relação a Lampião e seu grupo. #i#Famigerado#!i# é usado com sentido de #i#mal afamado; bando#!i# remete a um grupo de mal feitores; #i#atacam#!i# indica uma ação agressiva.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>falaBalao</premio>
		<respcorreta>0</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
			<dialogo pers="Ze_Pretinho" contra="Cego_Aderaldo">Preste atenção na manchete do jornal:
#b#"O famigerado Lampião e seu bando atacam a cidade de Mossoró.#!b#</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Pela chamada, já dá para saber se o locutor vai falar bem ou mal de Lampião, concorda?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Não! As palavras empregadas na chamada são neutras e não revelam nenhum ponto de vista sobre Lampião.</alternativa>
			<alternativa>Sim! As palavras empregadas nessa chamada revelam um ponto de vista negativo sobre Lampião.</alternativa>
			<alternativa>Não! A chamada é excessivamente curta, por isso o ouvinte não percebe um ponto de vista sobre Lampião.</alternativa>
			<alternativa>Sim! As palavras empregadas tornam a chamada imparcial e revelam um ponto de vista neutro sobre Lampião.</alternativa>
			<alternativa>Sim! A elaboração da chamada permite perceber um ponto de vista favorável a Lampião.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Embora seja possível conceber enunciados informativos que não revelem um ponto de vista específico, não é esse o caso. Nessa chamada, o uso conjunto das palavras #i#sanguinário, corja, saqueiam#!i# revela um ponto de vista negativo em relação a Lampião e seu grupo. #i#Sanguinário#!i# é usado com sentido de #i#cruel, malvado; corja#!i# remete a um grupo de indivíduos grosseiros ou de má índole; #i#saqueiam#!i# indica uma ação violenta, um roubo. </feedback>
			<feedback>Muito bem! Muitas vezes as chamadas em programas de TV e rádio permitem antecipar o ponto de vista sobre o que vai ser noticiado. Nessa chamada, o uso conjunto das palavras #i#sanguinário, corja, saqueiam#!i# revela um ponto de vista negativo em relação a Lampião e seu grupo. #i#Sanguinário#!i# é usado com sentido de #i#cruel, malvado; corja#!i# remete a um grupo de indivíduos grosseiros ou de má índole; #i#saqueiam#!i# indica uma ação violenta, um roubo. </feedback>
			<feedback>Tente outra vez! O tamanho de um texto não é um elemento decisivo para a expressão um ponto de vista. Mesmo sendo curta, essa chamada expressa um ponto de vista negativo em relação a Lampião e seu grupo pelo uso conjunto das palavras #i#sanguinário, corja, saqueiam. Sanguinário#!i# é usado com sentido de #i#cruel, malvado; corja#!i# remete a um grupo de indivíduos grosseiros ou de má índole; #i#saqueiam#!i# indica uma ação violenta, um roubo. </feedback>
			<feedback>Tente outra vez! Embora seja possível conceber enunciados informativos que não revelem um ponto de vista específico, não é esse o caso. Nessa chamada, o uso conjunto das palavras #i#sanguinário, corja, saqueiam#!i# revelam um ponto de vista negativo em relação a Lampião e seu grupo. #i#Sanguinário#!i# é usado com sentido de #i#cruel, malvado; corja#!i# remete a um grupo de indivíduos grosseiros ou de má índole; #i#saqueiam#!i# indica uma ação violenta, um roubo. </feedback>
			<feedback>Tente outra vez! Nessa chamada, o uso conjunto das palavras #i#sanguinário, corja, saqueiam#!i# revela um ponto de vista negativo em relação a Lampião e seu grupo. #i#Sanguinário#!i# é usado com sentido de #i#cruel, malvado; corja#!i# remete a um grupo de indivíduos grosseiros ou de má índole; #i#saqueiam#!i# indica uma ação violenta, um roubo. </feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>narradorBalao</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Ze_Pretinho" contra="Cego_Aderaldo">Hoje pela manhã ouvi no rádio essa chamada:
#b#O sanguinário Lampião e sua corja saqueiam a vila de Cabrobó.#!b#</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Nesse trecho de jornal já dá para perceber um ponto de vista sobre Lampião, concorda?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Não! As palavras empregadas no trecho são neutras e não revelam nenhum ponto de vista sobre Lampião.</alternativa>
			<alternativa>Não! O trecho é excessivamente curto, por isso o leitor não percebe um ponto de vista sobre Lampião.</alternativa>
			<alternativa>Sim! As palavras empregadas nesse trecho revelam um ponto de vista positivo sobre Lampião.</alternativa>
			<alternativa>Sim! As palavras empregadas tornam o trecho imparcial e revelam um ponto de vista neutro sobre Lampião.</alternativa>
			<alternativa>Sim! A elaboração do trecho permite perceber um ponto de vista desfavorável a Lampião.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Embora seja possível conceber enunciados informativos que não revelem um ponto de vista específico, não é esse o caso. O tom do texto é de elogio à inteligência e à capacidade de liderança de Lampião. O uso conjunto das expressões #i#astúcia singular, enorme resistência, capacidade de comando#!i# ajuda a construir essa imagem. #i#Astúcia singular#!i# significa #i#habilidade para não se deixar enganar#!i#, ou seja, esperteza. #i#Enorme resistência, capacidade de comando#!i# são qualidades ou características que identificam um líder. </feedback>
			<feedback>Tente outra vez! O tamanho de um texto não é um elemento decisivo para a expressão de um ponto de vista. Mesmo sendo curto, o tom do texto é de elogio à inteligência e à capacidade de liderança de Lampião. O uso conjunto das expressões #i#astúcia singular, enorme resistência, capacidade de comando#!i# ajuda a construir essa imagem. #i#Astúcia singular#!i# significa #i#habilidade para não se deixar enganar#!i#, ou seja, esperteza. #i#Enorme resistência, capacidade de comando#!i# são qualidades ou características que identificam um líder. </feedback>
			<feedback>Muito bem! O tom do texto é de elogio à inteligência e à capacidade de liderança de Lampião. O uso conjunto das expressões #i#astúcia singular, enorme resistência, capacidade de comando#!i# ajuda a construir essa imagem. #i#Astúcia singular#!i# significa #i#habilidade para não se deixar enganar#!i#, ou seja, esperteza. #i#Enorme resistência, capacidade de comando#!i# são qualidades ou características que identificam um líder. </feedback>
			<feedback>Tente outra vez! Embora seja possível conceber enunciados informativos que não revelem um ponto de vista específico, não é esse o caso. O tom do texto é de elogio à inteligência e à capacidade de liderança de Lampião. O uso conjunto das expressões #i#astúcia singular, enorme resistência, capacidade de comando#!i# ajuda a construir essa imagem. #i#Astúcia singular#!i# significa #i#habilidade para não se deixar enganar#!i#, ou seja, esperteza. #i#Enorme resistência, capacidade de comando#!i# são qualidades ou características que identificam um líder. </feedback>
			<feedback>Tente outra vez! O tom do texto é de elogio à inteligência e à capacidade de liderança de Lampião. O uso conjunto das expressões #i#astúcia singular, enorme resistência, capacidade de comando#!i# ajuda a construir essa imagem. #i#Astúcia singular#!i# significa #i#habilidade para não se deixar enganar#!i#, ou seja, esperteza. #i#Enorme resistência, capacidade de comando#!i# são qualidades ou características que identificam um líder. </feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>pensamentoBalao</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Ze_Pretinho" contra="Cego_Aderaldo">Cego, preste atenção nesse trecho de jornal:
“Dotado de astúcia singular, enorme resistência, capacidade de comando em relação à gente de sua laia e de conhecimento perfeito das terras que percorria e a cujos habitantes castigava, o fantasma nordestino sempre conseguiu iludir as vinganças particulares que uma por outra vez o perseguiam e a polícia.” (extraído do jornal #i#A Noite Ilustrada#!i#, 2/8/1938)</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Puxa, nessa propaganda, dá para perceber um ponto de vista sobre Lampião, concorda?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim! As palavras empregadas na propaganda revelam um ponto de vista positivo sobre Lampião.</alternativa>
			<alternativa>Não! As palavras empregadas na propaganda são neutras e não revelam nenhum ponto de vista sobre Lampião.</alternativa>
			<alternativa>Não! O texto é uma propaganda, por isso o leitor não consegue perceber um ponto de vista sobre Lampião.</alternativa>
			<alternativa>Sim! O texto da propaganda permite perceber um ponto de vista desfavorável sobre Lampião.</alternativa>
			<alternativa>Sim! O texto é uma propaganda, por isso o ponto de vista sobre Lampião é ambíguo.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A propaganda critica as ações de Lampião e enaltece o produto. O uso conjunto de expressões como #i#o pavor dos sertanejos#!i# e de palavras como #i#bandido, invade, sofrimento, morte#!i#, entre outras, constrói uma imagem negativa de Lampião. Além disso, comparar os males causados pelo cangaceiro com os males causados pela prisão de ventre não é nenhum elogio a Lampião, e cria também um efeito de humor no texto!</feedback>
			<feedback>Tente outra vez! Embora seja possível conceber enunciados informativos que não revelem um ponto de vista específico, não é esse o caso. A propaganda critica as ações de Lampião e enaltece o produto. O uso conjunto de expressões como #i#o pavor dos sertanejos#!i# e de palavras como #i#bandido, invade, sofrimento, morte#!i#, entre outras, constrói uma imagem negativa de Lampião. Além disso, comparar os males causados pelo cangaceiro com os males causados pela prisão de ventre não é nenhum elogio a Lampião, e cria também um efeito de humor no texto!</feedback>
			<feedback>Tente outra vez! Os textos publicitários, ao exaltarem qualidades de produtos, muitas vezes veiculam opiniões sim. A propaganda critica as ações de Lampião e enaltece o produto. O uso conjunto de expressões como #i#o pavor dos sertanejos#!i# e de palavras como #i#bandido, invade, sofrimento, morte#!i#, entre outras, constrói uma imagem negativa de Lampião. Além disso, comparar os males causados pelo cangaceiro com os males causados pela prisão de ventre não é nenhum elogio a Lampião, e cria também um efeito de humor no texto!</feedback>
			<feedback>Muito bem! A propaganda critica as ações de Lampião e enaltece o produto. O uso conjunto de expressões como #i#o pavor dos sertanejos#!i# e de palavras como #i#bandido, invade, sofrimento, morte#!i#, entre outras, constrói uma imagem negativa de Lampião. Além disso, comparar os males causados pelo cangaceiro com os males causados pela prisão de ventre não é nenhum elogio a Lampião, e cria também um efeito de humor no texto!</feedback>
			<feedback>Tente outra vez! Os textos publicitários, ao exaltarem qualidades de produtos, muitas vezes veiculam opiniões sim. A propaganda não é ambígua, pois claramente critica as ações de Lampião e enaltece o produto. O uso conjunto de expressões como #i#o pavor dos sertanejos#!i# e de palavras como #i#bandido, invade, sofrimento, morte#!i#, entre outras, constrói uma imagem negativa de Lampião. Além disso, comparar os males causados pelo cangaceiro com os males causados pela prisão de ventre não é nenhum elogio a Lampião, e cria também um efeito de humor no texto!</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>gritoBalao</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Ze_Pretinho" contra="Cego_Aderaldo">Cego, escuta só essa propaganda:
“Lampião, pelo terror de seus crimes, é o pavor dos sertanejos. O bandido que invade os lares, levando a toda parte o sofrimento e a morte, não ataca de frente, jogando a sua vida na luta leal. Esconde-se nas trevas, acoita-se nos barrancos. (...) Também a prisão de ventre, aninhando-se sorrateiramente no corpo humano, provoca a explosão de males infinitos, pelos relaxamentos do intestino. Para o combate ao banditismo de Lampião o país arma os seus soldados adestrados. Para combater a prisão de ventre, as PÍLULAS DE VIDA DO DR. ROSS, na dose de uma ou duas por noite, são as armas seguras, de efeitos infalíveis.”(Propaganda das #i#Pílulas de Vida do Dr. Ross#!i#, publicada na #i#Revista Boa Nova#!i#, 1933)</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Só de ler esse trecho de jornal, já dá para perceber um ponto de vista sobre Lampião, concorda?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim! Nesse trecho, o ponto de vista é favorável a Lampião.</alternativa>
			<alternativa>Sim! Nesse trecho, o ponto de vista é desfavorável a Lampião.</alternativa>
			<alternativa>Não! Nesse trecho, o autor só ressalta a atitude das pessoas que ajudavam Lampião.</alternativa>
			<alternativa>Não! Esse trecho é muito curto para se analisar o ponto de vista sobre Lampião.</alternativa>
			<alternativa>Sim! Nesse trecho, o ponto de vista sobre Lampião é ambíguo.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Esse trecho de jornal explora dois lados da figura de Lampião: de um lado a esperteza – que pode ser uma qualidade favorável -  e, de outro, a criminalidade. Isso pode ser observado em diversas passagens, entre elas na afirmação de que Lampião tanto sabia amedrontar quanto seduzir aqueles que lhe pudessem ser úteis. Ou seja, segundo o texto, Lampião causava medo e fascinação. Outro elemento que indica essa dualidade é o uso do vocábulo #i#matreiro#!i#, que tanto pode ser empregado com o sentido de não se deixar pegar facilmente (diz-se de animal) quanto da pessoa esperta, ardilosa, que usa de má-fé.</feedback>
			<feedback>Tente outra vez! Esse trecho de jornal explora dois lados da figura de Lampião: de um lado a esperteza e, de outro, a criminalidade. Isso pode ser observado em diversas passagens, entre elas na afirmação de que Lampião tanto sabia amedrontar quanto seduzir aqueles que lhe pudessem ser úteis. Ou seja, segundo o texto, Lampião causava medo e fascinação. Outro elemento que indica essa dualidade é o uso do vocábulo #i#matreiro#!i#, que tanto pode ser empregado com o sentido de não se deixar pegar facilmente (diz-se de animal) quanto da pessoa esperta, ardilosa, que usa de má-fé.</feedback>
			<feedback>Tente outra vez! Apesar de se referir ao fato de pessoas ajudarem o cangaceiro, esse trecho de jornal explora dois lados da figura de Lampião: de um lado a esperteza e, de outro, a criminalidade. Isso pode ser observado em diversas passagens, entre elas na afirmação de que Lampião tanto sabia amedrontar quanto seduzir aqueles que lhe pudessem ser úteis. Ou seja, segundo o texto, Lampião causava medo e fascinação. Outro elemento que indica essa dualidade é o uso do vocábulo #i#matreiro#!i#, que tanto pode ser empregado com o sentido de não se deixar pegar facilmente (diz-se de animal) quanto da pessoa esperta, ardilosa, que usa de má-fé.</feedback>
			<feedback>Tente outra vez! O tamanho de um texto não é um elemento decisivo para a expressão de um ponto de vista. Esse trecho de jornal explora dois lados da figura de Lampião: de um lado a esperteza e, de outro, a criminalidade. Isso pode ser observado em diversas passagens, entre elas na afirmação de que Lampião tanto sabia amedrontar quanto seduzir aqueles que lhe pudessem ser úteis. Ou seja, segundo o texto, Lampião causava medo e fascinação. Outro elemento que indica essa dualidade é o uso do vocábulo #i#matreiro#!i#, que tanto pode ser empregado com o sentido de não se deixar pegar facilmente (diz-se de animal) quanto da pessoa esperta, ardilosa, que usa de má-fé.</feedback>
			<feedback>Muito bem! Esse trecho de jornal explora dois lados da figura de Lampião: de um lado a esperteza e, de outro, a criminalidade. Isso pode ser observado em diversas passagens, entre elas na afirmação de que Lampião tanto sabia amedrontar quanto seduzir aqueles que lhe pudessem ser úteis. Ou seja, segundo o texto, Lampião causava medo e fascinação. Outro elemento que indica essa dualidade é o uso do vocábulo #i#matreiro#!i#, que tanto pode ser empregado com o sentido de alguém que não se deixar pegar facilmente (diz-se de animal) quanto da pessoa esperta, ardilosa, que usa de má-fé.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>musicaBalao</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Ze_Pretinho" contra="Cego_Aderaldo">Cego, preste atenção nessa reportagem:
Matreiro, precavido, com uma visão de felino para o assalto e para a retirada e sabendo amedrontar e seduzir os que lhe pudessem ser úteis, ao fim de algum tempo suas possíveis vítimas o ajudavam contra as perseguições preferindo antes a benevolência do bandoleiro sanguinário do que o cumprimento do dever em proveito da Lei. (extraído do jornal #i#A Noite Ilustrada#!i#, 2/8/1938)</dialogo>
		</dialogos>
	</questao>
</questoes>

			]]> ).toString();
			
			questoesEpisodio[5] = (<![CDATA[
<questoes>
	<questao>
		<enunciado>Por quê? É errado o meu jeito de falar?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Não. As pessoas riem por preconceito, porque estranham uma pronúncia diferente da que elas usam.</alternativa>
			<alternativa>Sim. Só há uma pronúncia correta do #i#r#!i#, em português: é a pronúncia dos cariocas.</alternativa>
			<alternativa>Não. Mas é melhor falar como se fala no Maranhão, o melhor português do Brasil.</alternativa>
			<alternativa>Sim. Porque somente as pessoas analfabetas pronunciam o #i#r#!i#, dessa maneira.</alternativa>
			<alternativa>Não. Mas é melhor falar como os portugueses, que trouxeram a língua para o Brasil.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! É puro preconceito zombar da pronúncia de outros falantes. Há várias maneiras de se pronunciar o #i#r#!i# no Brasil e todas elas são válidas, legítimas. Não há nenhuma razão para considerar uma pronúncia melhor ou pior que outra.</feedback>
			<feedback>Tente outra vez! Como o Rio de Janeiro era a capital do Brasil, muitos achavam que a pronúncia carioca era a melhor do país. Mas não há nenhuma razão para considerar uma pronúncia melhor ou pior que outra – isso é puro preconceito! Há várias maneiras de se pronunciar o #i#r#!i# no Brasil e todas elas são válidas, legítimas.</feedback>
			<feedback>Tente outra vez! Existe um mito de que o português do Maranhão é o melhor do Brasil, sobretudo porque lá se usa o #i#tu#!i#, com o verbo na flexão padrão (exemplo: tu vais). Isso é puro preconceito! Não há nenhuma razão para considerar o português de uma região melhor que o de outra. Isso se aplica ao caso do #i#r#!i#: há várias maneiras de se pronunciar o #i#r#!i# no Brasil e todas elas são válidas, legítimas.</feedback>
			<feedback>Tente outra vez! Essa pronúncia não depende do grau de instrução do falante – pode ser encontrada tanto na fala de analfabetos como de pessoas com escolaridade. Trata-se de uma pronúncia regional: há várias maneiras de se pronunciar o #i#r#!i# no Brasil e todas elas são válidas. Não há nenhuma razão para considerar uma pronúncia melhor ou pior que outra – isso é puro preconceito!</feedback>
			<feedback>Tente outra vez! Portugueses e brasileiros têm pronúncias diferentes, mas as duas maneiras de falar são válidas, legítimas. Não há nenhuma razão para considerar uma pronúncia melhor que outra – isso é puro preconceito!</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>fireworksBalao</premio>
		<respcorreta>0</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
			<dialogo pers="Matilde" contra="Vazio">Eu falei #i#carne#!i# e todo mundo deu risada. Acharam meu #i#r#!i# esquisito. Disseram que meu #i#r#!i# é caipira</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>É errado falar como os cariocas?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. A pronúncia correta é a de São Paulo, cidade mais importante do Brasil.</alternativa>
			<alternativa>Não. É diferente da sua pronúncia, mas as duas maneiras de falar são válidas.</alternativa>
			<alternativa>Não. Na verdade, essa é a pronúncia correta porque é parecida com a dos portugueses.</alternativa>
			<alternativa>Sim. Porque uma língua não pode ter mais de uma pronúncia correta.</alternativa>
			<alternativa>Não. Mas se for usada em outras regiões, as pessoas não vão entender nada.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! O fato de São Paulo ser uma cidade muito importante não é razão para se considerar a pronúncia paulistana a única correta. No Brasil, há mais de uma maneira de se pronunciar esse #i#s#!i# e todas as pronúncias são válidas, legítimas. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Muito bem! No Brasil há mais de uma maneira de se pronunciar o #i#s#!i# em final de sílaba, como em #i#festa#!i#, e não há nenhuma razão para considerar que só uma pronúncia é correta. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Tente outra vez! Essa é a pronúncia comum no Rio de Janeiro, mas não é a única encontrada no Brasil. A maneira de falar o #i#s#!i# em final de sílaba, como em #i#festa#!i#, varia conforme a região e não há nenhuma razão para considerar que só a pronúncia carioca é correta, por ser parecida com a dos portugueses – isso é puro preconceito.</feedback>
			<feedback>Tente outra vez! Uma língua pode comportar pronúncias diversas e corretas. No Brasil, por exemplo, há várias maneiras de se pronunciar o #i#s#!i# em final de sílaba, como em #i#festa#!i#, e todas elas são legítimas. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito. </feedback>
			<feedback>Tente outra vez! No Brasil há mais de uma maneira de se pronunciar o #i#s#!i# em final de sílaba, como em #i#festa#!i#. A pronúncia varia conforme a região, mas isso não impede a nossa comunicação. Também não há nenhuma razão para desvalorizar o jeito de falar de uma dada região - isso é puro preconceito.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>shitBalao</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Matilde" contra="Vazio">Eu falo #i#festa#!i#, mas tenho um amigo carioca que fala #i#fechta#!i#,.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>É errada essa pronúncia?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. A pronúncia correta é com #i#ô#!i# (fechado), como falam os paulistas.</alternativa>
			<alternativa>Não. Mas é melhor usar a pronúncia com #i#ô#!i# (fechado), comum no Rio de Janeiro.</alternativa>
			<alternativa>Não. Essa pronúncia é tão válida quanto a pronúncia com #i#ô#!i# (fechado).</alternativa>
			<alternativa>Sim. Porque somente as pessoas não alfabetizadas usam essa pronúncia.</alternativa>
			<alternativa>Sim. Porque uma língua não pode ter mais de uma pronúncia correta.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! As duas pronúncias são válidas, legítimas. Há brasileiros que pronumciam #i#coração#!i# com #i#ó#!i# (aberto) e outros com #i#ô#!i# (fechado) e não há nenhuma razão para considerar uma pronúncia melhor que a outra. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Tente outra vez! Como o Rio de Janeiro era a capital do Brasil, muitos achavam que a pronúncia carioca era a melhor do país. Mas não há nenhuma razão para considerar uma pronúncia melhor que a outra. Há brasileiros que pronumciam #i#coração#!i# com #i#ó#!i# (aberto) e outros com #i#ô#!i# (fechado). A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Muito bem! Há brasileiros que pronumciam #i#coração#!i# com #i#ó#!i# (aberto) e outros com #i#ô#!i# (fechado) e não há nenhuma razão para considerar uma pronúncia melhor que a outra. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Tente outra vez! Essa pronúncia não depende do grau de instrução do falante - há brasileiros que pronumciam #i#coração#!i# com #i#ó#!i# (aberto) e outros com #i#ô#!i# (fechado), conforme a região do país. E não há nenhuma razão para considerar uma pronúncia melhor que a outra - desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Tente outra vez! Uma língua pode comportar pronúncias diversas e corretas. No Brasil, por exemplo, há pessoas que pronumciam #i#coração#!i# com #i#ó#!i# (aberto) e outros com #i#ô#!i# (fechado) e as duas pronúncias são válidas. Não há nenhuma razão para considerar uma pronúncia melhor que a outra. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>bumBalao</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Matilde" contra="Vazio">A Dona Josefa, que é baiana, fala #i#coração#!i# com #i#ó#!i# (aberto).</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>É errada essa pronúncia?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. A pronúncia correta é com #i#ê#!i# (fechado), como falam os paulistas, por exemplo.</alternativa>
			<alternativa>Não. Mas é melhor usar a pronúncia com #i#ê#!i# (fechado), comum no Rio de Janeiro.</alternativa>
			<alternativa>Sim. Porque somente as pessoas não alfabetizadas usam essa pronúncia.</alternativa>
			<alternativa>Não. Essa pronúncia é tão válida quanto a pronúncia com #i#ê#!i# (fechado).</alternativa>
			<alternativa>Sim. Porque uma língua não pode ter mais de uma pronúncia correta.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! As duas pronúncias são válidas, legítimas. Há brasileiros que pronunciam #i#felicidade#!i# com #i#é#!i# (aberto) e outros com #i#ê#!i# (fechado) e não há nenhuma razão para considerar uma pronúncia melhor que a outra. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Tente outra vez! Como o Rio de Janeiro era a capital do Brasil, muitos achavam que a pronúncia carioca era a melhor do país. Mas não há nenhuma razão para considerar uma pronúncia melhor que a outra. Há brasileiros que pronunciam #i#felicidade#!i# com #i#é#!i# (aberto) e outros com #i#ê#!i# (fechado). A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Tente outra vez! Essa pronúncia não depende do grau de instrução do falante - há brasileiros que pronunciam #i#felicidade#!i# com #i#é#!i# (aberto) e outros com #i#ê#!i# (fechado), conforme a região do país. E não há nenhuma razão para considerar uma pronúncia melhor que a outra - desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Muito bem! Há brasileiros que pronunciam #i#felicidade#!i# com #i#é#!i# (aberto) e outros com #i#ê#!i# (fechado) e não há nenhuma razão para considerar uma pronúncia melhor que a outra. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Tente outra vez! Uma língua pode comportar pronúncias diversas e corretas. No Brasil, por exemplo, há pessoas que pronunciam #i#felicidade#!i# com #i#é#!i# (aberto) e outros com #i#ê#!i# (fechado) e as duas pronúncias são legítimas. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>powBalao</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Matilde" contra="Vazio">A Dona Josefa, que é baiana, fala #i#felicidade#!i# com #i#é#!i# (aberto).</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>É errado pronunciar #i#muitcho#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. Essa pronúncia é errada porque é só usada no Nordeste.</alternativa>
			<alternativa>Sim. A pronúncia correta é sem o chiado, como ouvimos em São Paulo.</alternativa>
			<alternativa>Sim. Porque não é essa a pronúncia usada no Rio de Janeiro, modelo para o Brasil.</alternativa>
			<alternativa>Não. Mas somente as pessoas analfabetas usam essa pronúncia.</alternativa>
			<alternativa>Não. As duas pronúncias são usadas no Brasil e ambas são válidas.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! O fato de ser usada no Nordeste não justifica qualquer discriminação. As duas pronúncias são encontradas no Brasil e não há nenhuma razão para considerar que uma delas é errada. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Tente outra vez! As duas pronúncias são encontradas no Brasil e não há nenhuma razão para considerar que uma delas é errada. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Tente outra vez! Como o Rio de Janeiro era a capital federal, muitos achavam que a pronúncia carioca era a melhor do país. Mas no Brasil há outra pronúncia e não há nenhuma razão para considerar uma melhor que a outra.  A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
			<feedback>Tente outra vez! Essa pronúncia não depende do grau de instrução do falante. Trata-se de uma pronúncia regional, de uso geral na região em que ocorre. O que se observa é que há brasileiros que falam #i#muito#!i# e outros que falam #i#muitcho#!i#, conforme a região do país. E não há nenhuma razão para considerar uma pronúncia melhor que outra - isso seria puro preconceito!</feedback>
			<feedback>Muito bem! As duas pronúncias são encontradas no Brasil e não há nenhuma razão para considerar que uma delas é errada. A pronúncia varia conforme a região e desvalorizar o jeito de falar de alguns brasileiros é puro preconceito.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>smackBalao</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Matilde" contra="Vazio">Eu, que sou paulista, falo #i#muito#!i# e Dona Josefa, que é baiana, fala #i#muitcho#!i#.</dialogo>
		</dialogos>
	</questao>
</questoes>

			]]> ).toString();
	}

		
	}
}