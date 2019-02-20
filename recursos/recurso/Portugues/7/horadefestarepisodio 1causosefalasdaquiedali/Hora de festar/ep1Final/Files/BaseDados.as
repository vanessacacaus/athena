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
	 * questoesEpisodio[1] = (<![CDATA [...
	 * questoesEpisodio[n] =(<![CDATA[...]]>).toString();
	 */
	public static function carregaQuestoes(){
			questoesEpisodio[0] = (<![CDATA[
<questoes>
	<questao>
		<enunciado>Dá para saber em que época se passa a narrativa?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim! A narrativa se passa em uma época indeterminada, pois principia com #i#era uma vez#!i# e termina com #i#felizes para sempre#!i#.</alternativa>
			<alternativa>Sim! A narrativa se passa no tempo passado, pois há personagens que são reis, rainhas e escravos.</alternativa>
			<alternativa>Sim! A narrativa se passa no futuro, pois a história mostra um tipo de comportamento que nunca existiu.</alternativa>
			<alternativa>Sim! A narrativa se passa no tempo passado, antes de 1880, pois uma das personagens é uma escrava.</alternativa>
			<alternativa>Sim! A narrativa se passa no presente, na Inglaterra, pois lá ainda há reis e rainhas, que têm esse tipo de comportamento.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! Em narrativas orais, é comum o contador referir-se a um tempo indeterminado, usando expressões como #i#era uma vez#!i# e #i#felizes para sempre#!i#. Isso é assim porque nos causos, a ação e a interação entre as personagens são mais importantes do que a precisão de tempo e as descrições minuciosas.</feedback>
			<feedback>Tente outra vez! Sabemos que a história aconteceu no passado pelo uso do tempo verbal. A existência de reis e rainhas não é marca de passado, pois ainda hoje há reis e rainhas em alguns países! A época em que se passa a história é indeterminada. Isso é assim porque nos causos, a ação e a interação entre as personagens são mais importantes do que a precisão de tempo e as descrições minuciosas.</feedback>
			<feedback>Tente outra vez! A história aconteceu no passado e não no futuro. Você pode perceber isso pelo uso do tempo verbal. A época em que se passa a história é indeterminada. Isso é assim porque nos causos, a ação e a interação entre as personagens são mais importantes do que a precisão de tempo e as descrições minuciosas.</feedback>
			<feedback>Tente outra vez! Sabemos que a história aconteceu no passado pelo uso do tempo verbal, mas a época em que se passam os eventos é indeterminada. Não há nenhum elemento que garanta que o rei e a rainha viviam no Brasil, por isso não é correto associar a referência à escrava à data da abolição da escravidão. A época em que se passam os eventos é indeterminada. Isso é assim porque nos causos, a ação e a interação entre as personagens são mais importantes do que a precisão de tempo e as descrições minuciosas.</feedback>
			<feedback>Tente outra vez! Sabemos que a história aconteceu no passado pelo uso do tempo verbal, mas a época em que se passam os eventos é indeterminada. O local onde a história se passa também é indeterminado. Não há nenhum elemento que garanta que o rei e a rainha viviam na Inglaterra – e há reis e rainhas em vários países! A época em que se passam os eventos é indeterminada. Isso é assim porque nos causos, a ação e a interação entre as personagens são mais importantes do que a precisão de tempo e as descrições minuciosas.</feedback>
		</feedbacks>
		<dica></dica>
		<premio>bota</premio>
		<valorpontos>120</valorpontos>
		<respcorreta>0</respcorreta>
		 <dialogos>
			<quantidade>5</quantidade>
		   <dialogo pers="Seo_Antonio" contra="Vazio">Escute essa história...
"Era uma vez um rei viúvo, que morava diante da casa de um rei casado com uma moça bonita e séria. O rei viúvo tomou-se de amores pela moça, mas ela não correspondeu. O rei viúvo conversou com uma negra escrava do rei moço e lhe deu algumas moedas de ouro para que lhe fosse permitido ver a moça dormindo. A escrava, aproveitando uma viagem do rei moço, levou o rei viúvo até o quarto da moça que dormia. Encantado com tanta beleza, ele abriu o cortinado que cercava a cama e ficou olhando para a moça por muito tempo. Estava nesse jeito quando o rei moço voltou e a escrava deu o sinal. O rei viúvo, surpreendido, fugiu, mas, no arranco da correria, perdeu seu sapato. O rei moço achou o sapato e maldou da mulher, pensando que ela fosse infiel. Não lhe disse uma nem duas, mas não a procurou mais.</dialogo>
<dialogo pers="Seo_Antonio">A moça, depois de muito cismar e rezar, desconfiou de alguma coisa e resolveu certificar-se de tudo, pelo miúdo. Mandou preparar um jantar e pediu ao marido que convidasse o rei viúvo. Todos comeram muito bem até que, no fim do jantar, a moça levantou-se, pegou num copo cheio de vinho e disse, levantando uma saudação:
#i#Fui casada, hoje sou solteira.                                                                                                    Por que e por que não, não sei!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei moço entendeu o dito de sua mulher e por sua vez levantou o copo, dizendo:
#i#Em meus palácios entrei                                                                                                    Rasto de ladrão achei!                                                                                                    Se comeu ou não comeu                                                                                                    Não sei!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei viúvo compreendeu o que se passara e confessou, dizendo também com o copo na mão: 
#i#Nos vossos palácios entrei                                                                                                    Rasto de ladrão deixei!                                                                                                    Lindo cortinado abri,                                                                                                    que linda uva eu vi!                                                                                                    Mas juro por c’roa minha                                                                                                    Que em tal uva não buli!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei moço ajoelhou-se nos pés da mulher, pedindo perdão pela suspeita. O rei viúvo e a escrava também pediram perdão e foram todos perdoados, vivendo felizes para sempre.”
[Adaptado de “O Chapim do Rei”, registrado por Luísa Freire, Ceará Mirim, Rio Grande do Norte. In: CASCUDO, Luís da Câmara. #i#Contos Tradicionais do Brasil (folclore)#!i#. Rio de Janeiro: Ediouro, s/d, p. 105.]</dialogo>
		</dialogos>
	</questao>

	<questao>
		<enunciado>Você acha que o espaço tem alguma importância nessa narrativa?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Não! O espaço não tem nenhuma importância, pois não há indicações precisas de onde ficam os castelos.</alternativa>
			<alternativa>Sim! O espaço tem importância, pois a proximidade dos castelos propicia o envolvimento amoroso e o afastamento do rei moço cria a intriga.</alternativa>
			<alternativa>Não! O espaço não tem nenhuma importância, pois o que interessa é a ação das personagens.</alternativa>
			<alternativa>Não! O espaço não tem nenhuma importância, pois a história se passa em um lugar que não existe no mundo real.</alternativa>
			<alternativa>Sim! O espaço tem importância, pois se a escrava fosse mais cuidadosa, teria percebido que o rei viúvo tinha perdido o sapato e o teria escondido, evitando todos os problemas.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! O local onde se passa a história é mesmo indeterminado, mas isso não significa que ele não tenha importância! Nas narrativas, a apresentação dos elementos que constituem o espaço costuma ser importante para determinar as condições de desenvolvimento da ação.</feedback>
			<feedback>Muito bem! Tanto nas narrativas orais, como nas escritas, a apresentação dos elementos que constituem o espaço costuma ser  importante para determinar as condições de desenvolvimento da ação.</feedback> 
			<feedback>Tente outra vez! A ação é, de fato, privilegiada nos contos populares, mas o espaço também tem relevância! A apresentação dos elementos que constituem o espaço costuma ser importante para determinar as condições de desenvolvimento da ação.</feedback>
			<feedback>Tente outra vez! Nas narrativas, não é necessário que o local onde se passa a história tenha correspondência com o mundo real. A apresentação dos elementos que constituem o espaço costuma ser importante para determinar as condições de desenvolvimento da ação.</feedback>
			<feedback>Tente outra vez! Não podemos fazer suposições de como as personagens poderiam ter agido. A apresentação dos elementos que constituem o espaço costuma ser importante para determinar as condições de desenvolvimento da ação.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>chinelodedo</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
		 	<quantidade>5</quantidade>
		   <dialogo pers="Seo_Antonio" contra="Vazio">Escute essa história...
"Era uma vez um rei viúvo, que morava diante da casa de um rei casado com uma moça bonita e séria. O rei viúvo tomou-se de amores pela moça, mas ela não correspondeu. O rei viúvo conversou com uma negra escrava do rei moço e lhe deu algumas moedas de ouro para que lhe fosse permitido ver a moça dormindo. A escrava, aproveitando uma viagem do rei moço, levou o rei viúvo até o quarto da moça que dormia. Encantado com tanta beleza, ele abriu o cortinado que cercava a cama e ficou olhando para a moça por muito tempo. Estava nesse jeito quando o rei moço voltou e a escrava deu o sinal. O rei viúvo, surpreendido, fugiu, mas, no arranco da correria, perdeu seu sapato. O rei moço achou o sapato e maldou da mulher, pensando que ela fosse infiel. Não lhe disse uma nem duas, mas não a procurou mais.</dialogo>
<dialogo pers="Seo_Antonio">A moça, depois de muito cismar e rezar, desconfiou de alguma coisa e resolveu certificar-se de tudo, pelo miúdo. Mandou preparar um jantar e pediu ao marido que convidasse o rei viúvo. Todos comeram muito bem até que, no fim do jantar, a moça levantou-se, pegou num copo cheio de vinho e disse, levantando uma saudação:
#i#Fui casada, hoje sou solteira.                                                                                                    Por que e por que não, não sei!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei moço entendeu o dito de sua mulher e por sua vez levantou o copo, dizendo:
#i#Em meus palácios entrei                                                                                                    Rasto de ladrão achei!                                                                                                    Se comeu ou não comeu                                                                                                    Não sei!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei viúvo compreendeu o que se passara e confessou, dizendo também com o copo na mão: 
#i#Nos vossos palácios entrei                                                                                                    Rasto de ladrão deixei!                                                                                                    Lindo cortinado abri,                                                                                                    que linda uva eu vi!                                                                                                    Mas juro por c’roa minha                                                                                                    Que em tal uva não buli!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei moço ajoelhou-se nos pés da mulher, pedindo perdão pela suspeita. O rei viúvo e a escrava também pediram perdão e foram todos perdoados, vivendo felizes para sempre.”
[Adaptado de “O Chapim do Rei”, registrado por Luísa Freire, Ceará Mirim, Rio Grande do Norte. In: CASCUDO, Luís da Câmara. #i#Contos Tradicionais do Brasil (folclore)#!i#. Rio de Janeiro: Ediouro, s/d, p. 105.]</dialogo></dialogos>
	</questao>

	<questao>
		<enunciado>Você percebeu quais são as personagens dessa narrativa?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim! São o rei viúvo, o rei moço, a rainha e os empregados.</alternativa>
			<alternativa>Sim! São o rei viúvo, o rei moço, a rainha e o autor.</alternativa>
			<alternativa>Sim! São o rei viúvo, o rei moço, a rainha e a escrava.</alternativa>
			<alternativa>Sim! São o rei viúvo, o rei moço, a rainha e o narrador.</alternativa>
			<alternativa>Sim! São o rei viúvo, o rei moço, a rainha e o contador do causo.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Embora seja possível que os reis tivessem empregados, eles não aparecem na história. As personagens desta narrativa são: o rei viúvo, o rei moço, a rainha e a escrava.</feedback>
			<feedback>Tente outra vez! O autor, de carne e osso, jamais pode ser personagem, pois ele não é ficcional. As personagens desta narrativa são: o rei viúvo, o rei moço, a rainha e a escrava.</feedback>
			<feedback>Muito bem! Nas narrativas orais, há, em geral, poucas personagens e elas têm função essencial no enredo.</feedback>
			<feedback>Tente outra vez! Essa é uma narrativa em 3ª pessoa, portanto o narrador não é personagem da história. As personagens desta narrativa são: o rei viúvo, o rei moço, a rainha e a escrava.</feedback>
			<feedback>Tente outra vez! O contador é uma pessoa de carne e osso. Ele jamais pode ser personagem, pois não é ficcional. As personagens desta narrativa são: o rei viúvo, o rei moço, a rainha e a escrava.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>sandalia</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
		 	<quantidade>5</quantidade>
		   <dialogo pers="Seo_Antonio" contra="Vazio">Escute essa história...
"Era uma vez um rei viúvo, que morava diante da casa de um rei casado com uma moça bonita e séria. O rei viúvo tomou-se de amores pela moça, mas ela não correspondeu. O rei viúvo conversou com uma negra escrava do rei moço e lhe deu algumas moedas de ouro para que lhe fosse permitido ver a moça dormindo. A escrava, aproveitando uma viagem do rei moço, levou o rei viúvo até o quarto da moça que dormia. Encantado com tanta beleza, ele abriu o cortinado que cercava a cama e ficou olhando para a moça por muito tempo. Estava nesse jeito quando o rei moço voltou e a escrava deu o sinal. O rei viúvo, surpreendido, fugiu, mas, no arranco da correria, perdeu seu sapato. O rei moço achou o sapato e maldou da mulher, pensando que ela fosse infiel. Não lhe disse uma nem duas, mas não a procurou mais.</dialogo>
<dialogo pers="Seo_Antonio">A moça, depois de muito cismar e rezar, desconfiou de alguma coisa e resolveu certificar-se de tudo, pelo miúdo. Mandou preparar um jantar e pediu ao marido que convidasse o rei viúvo. Todos comeram muito bem até que, no fim do jantar, a moça levantou-se, pegou num copo cheio de vinho e disse, levantando uma saudação:
#i#Fui casada, hoje sou solteira.                                                                                                    Por que e por que não, não sei!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei moço entendeu o dito de sua mulher e por sua vez levantou o copo, dizendo:
#i#Em meus palácios entrei                                                                                                    Rasto de ladrão achei!                                                                                                    Se comeu ou não comeu                                                                                                    Não sei!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei viúvo compreendeu o que se passara e confessou, dizendo também com o copo na mão: 
#i#Nos vossos palácios entrei                                                                                                    Rasto de ladrão deixei!                                                                                                    Lindo cortinado abri,                                                                                                    que linda uva eu vi!                                                                                                    Mas juro por c’roa minha                                                                                                    Que em tal uva não buli!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei moço ajoelhou-se nos pés da mulher, pedindo perdão pela suspeita. O rei viúvo e a escrava também pediram perdão e foram todos perdoados, vivendo felizes para sempre.”
[Adaptado de “O Chapim do Rei”, registrado por Luísa Freire, Ceará Mirim, Rio Grande do Norte. In: CASCUDO, Luís da Câmara. #i#Contos Tradicionais do Brasil (folclore)#!i#. Rio de Janeiro: Ediouro, s/d, p. 105.]</dialogo></dialogos>
	</questao>

	<questao>
		<enunciado>Você percebeu como é o narrador da história?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim! Ele é onisciente e a narrativa é feita em primeira pessoa.</alternativa>
			<alternativa>Sim! Ele é participante e a narrativa é feita em terceira pessoa.</alternativa>
			<alternativa>Sim! Ele é onisciente e a narrativa é feita em terceira pessoa.</alternativa>
			<alternativa>Sim! Ele é observador e a narrativa é feita em terceira pessoa.</alternativa>
			<alternativa>Sim! Ele é participante e a narrativa é feita em primeira pessoa.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A narrativa é feita em terceira pessoa e o narrador não é onisciente. Se fosse, ele seria capaz de conhecer as intenções, os pensamentos e os desejos das personagens. Ele apenas apresenta os fatos sem tomar parte neles e sem ter conhecimentos especiais.</feedback>
			<feedback>Tente outra vez! A narrativa é realmente feita em terceira pessoa, mas o narrador não participa dela. Ele apenas apresenta os fatos sem tomar parte neles e sem ter conhecimentos especiais.</feedback>
			<feedback>Tente outra vez! A narrativa é realmente feita em terceira pessoa, mas o narrador não é onisciente. Se fosse ele seria capaz de conhecer as intenções, os pensamentos e os desejos das personagens. Ele apenas apresenta os fatos sem tomar parte neles e sem ter conhecimentos especiais.</feedback>
			<feedback>Muito bem! O narrador apresenta os fatos sem tomar parte neles e sem ter conhecimentos especiais.</feedback>
			<feedback>Tente outra vez! A narrativa é feita em terceira pessoa e o narrador não é participante. Se fosse ele tomaria parte na ação. Ele apenas apresenta os fatos sem tomar parte neles e sem ter conhecimentos especiais.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>sandaliadedo</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
		 	<quantidade>5</quantidade>
		   <dialogo pers="Seo_Antonio" contra="Vazio">Escute essa história...
"Era uma vez um rei viúvo, que morava diante da casa de um rei casado com uma moça bonita e séria. O rei viúvo tomou-se de amores pela moça, mas ela não correspondeu. O rei viúvo conversou com uma negra escrava do rei moço e lhe deu algumas moedas de ouro para que lhe fosse permitido ver a moça dormindo. A escrava, aproveitando uma viagem do rei moço, levou o rei viúvo até o quarto da moça que dormia. Encantado com tanta beleza, ele abriu o cortinado que cercava a cama e ficou olhando para a moça por muito tempo. Estava nesse jeito quando o rei moço voltou e a escrava deu o sinal. O rei viúvo, surpreendido, fugiu, mas, no arranco da correria, perdeu seu sapato. O rei moço achou o sapato e maldou da mulher, pensando que ela fosse infiel. Não lhe disse uma nem duas, mas não a procurou mais.</dialogo>
<dialogo pers="Seo_Antonio">A moça, depois de muito cismar e rezar, desconfiou de alguma coisa e resolveu certificar-se de tudo, pelo miúdo. Mandou preparar um jantar e pediu ao marido que convidasse o rei viúvo. Todos comeram muito bem até que, no fim do jantar, a moça levantou-se, pegou num copo cheio de vinho e disse, levantando uma saudação:
#i#Fui casada, hoje sou solteira.                                                                                                    Por que e por que não, não sei!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei moço entendeu o dito de sua mulher e por sua vez levantou o copo, dizendo:
#i#Em meus palácios entrei                                                                                                    Rasto de ladrão achei!                                                                                                    Se comeu ou não comeu                                                                                                    Não sei!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei viúvo compreendeu o que se passara e confessou, dizendo também com o copo na mão: 
#i#Nos vossos palácios entrei                                                                                                    Rasto de ladrão deixei!                                                                                                    Lindo cortinado abri,                                                                                                    que linda uva eu vi!                                                                                                    Mas juro por c’roa minha                                                                                                    Que em tal uva não buli!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei moço ajoelhou-se nos pés da mulher, pedindo perdão pela suspeita. O rei viúvo e a escrava também pediram perdão e foram todos perdoados, vivendo felizes para sempre.”
[Adaptado de “O Chapim do Rei”, registrado por Luísa Freire, Ceará Mirim, Rio Grande do Norte. In: CASCUDO, Luís da Câmara. #i#Contos Tradicionais do Brasil (folclore)#!i#. Rio de Janeiro: Ediouro, s/d, p. 105.]</dialogo></dialogos>
	</questao>

	<questao>
		<enunciado>Você reparou como é apresentado o diálogo entre as personagens?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim! É apresentado na forma de discurso não verbal.</alternativa>
			<alternativa>Sim! É apresentado na forma de discurso indireto.</alternativa>
			<alternativa>Sim! É apresentado na forma de discurso oficial.</alternativa>
			<alternativa>Sim! É apresentado na forma de discurso indireto livre.</alternativa>
			<alternativa>Sim! É apresentado na forma de discurso direto.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Discurso não verbal é o que utiliza imagens ou gestos como forma de expressão. Nos diálogos dessa narrativa são reproduzidas as palavras tais como elas teriam sido ditas pelas personagens. Quando isso acontece, dizemos que se trata de discurso direto.</feedback>
			<feedback>Tente outra vez! No discurso indireto, o narrador recria, com suas palavras, o que teria sido dito pelas personagens. Nos diálogos dessa narrativa são reproduzidas as palavras tais como elas teriam sido ditas pelas personagens. Quando isso acontece, dizemos que se trata de discurso direto.</feedback>
			<feedback>Tente outra vez! Discurso oficial é aquele produzido por autoridades, como representantes do governo, por exemplo. Nos diálogos dessa narrativa são reproduzidas as palavras tais como elas teriam sido ditas pelas personagens. Quando isso acontece, dizemos que se trata de discurso direto.</feedback>
			<feedback>Tente outra vez! No discurso indireto livre, o narrador recria, com suas palavras, as falas das personagens e faz com que elas se misturem ao fluxo da narração. Nos diálogos dessa narrativa são reproduzidas as palavras tais como elas teriam sido ditas pelas personagens. Quando isso acontece, dizemos que se trata de discurso direto.</feedback>
			<feedback>Muito bem! Nos diálogos são reproduzidas as palavras tais como elas teriam sido ditas pelas personagens.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>sapato</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
		 <quantidade>5</quantidade>
		   <dialogo pers="Seo_Antonio" contra="Vazio">Escute essa história...
"Era uma vez um rei viúvo, que morava diante da casa de um rei casado com uma moça bonita e séria. O rei viúvo tomou-se de amores pela moça, mas ela não correspondeu. O rei viúvo conversou com uma negra escrava do rei moço e lhe deu algumas moedas de ouro para que lhe fosse permitido ver a moça dormindo. A escrava, aproveitando uma viagem do rei moço, levou o rei viúvo até o quarto da moça que dormia. Encantado com tanta beleza, ele abriu o cortinado que cercava a cama e ficou olhando para a moça por muito tempo. Estava nesse jeito quando o rei moço voltou e a escrava deu o sinal. O rei viúvo, surpreendido, fugiu, mas, no arranco da correria, perdeu seu sapato. O rei moço achou o sapato e maldou da mulher, pensando que ela fosse infiel. Não lhe disse uma nem duas, mas não a procurou mais.</dialogo>
<dialogo pers="Seo_Antonio">A moça, depois de muito cismar e rezar, desconfiou de alguma coisa e resolveu certificar-se de tudo, pelo miúdo. Mandou preparar um jantar e pediu ao marido que convidasse o rei viúvo. Todos comeram muito bem até que, no fim do jantar, a moça levantou-se, pegou num copo cheio de vinho e disse, levantando uma saudação:
#i#Fui casada, hoje sou solteira.                                                                                                    Por que e por que não, não sei!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei moço entendeu o dito de sua mulher e por sua vez levantou o copo, dizendo:
#i#Em meus palácios entrei                                                                                                    Rasto de ladrão achei!                                                                                                    Se comeu ou não comeu                                                                                                    Não sei!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei viúvo compreendeu o que se passara e confessou, dizendo também com o copo na mão: 
#i#Nos vossos palácios entrei                                                                                                    Rasto de ladrão deixei!                                                                                                    Lindo cortinado abri,                                                                                                    que linda uva eu vi!                                                                                                    Mas juro por c’roa minha                                                                                                    Que em tal uva não buli!#!i#</dialogo>
<dialogo pers="Seo_Antonio">O rei moço ajoelhou-se nos pés da mulher, pedindo perdão pela suspeita. O rei viúvo e a escrava também pediram perdão e foram todos perdoados, vivendo felizes para sempre.”
[Adaptado de “O Chapim do Rei”, registrado por Luísa Freire, Ceará Mirim, Rio Grande do Norte. In: CASCUDO, Luís da Câmara. #i#Contos Tradicionais do Brasil (folclore)#!i#. Rio de Janeiro: Ediouro, s/d, p. 105.]</dialogo></dialogos>
	</questao>
</questoes>
			]]> ).toString();
	
	
			questoesEpisodio[1] = (<![CDATA[
<questoes>
	<questao>
		<enunciado>A história é boa... mas você achou que isso é verossímil?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Claro que sim, pois em fábulas os animais têm comportamentos semelhantes aos dos humanos.</alternativa>
			<alternativa>Claro que não, pois as cigarras se comportam como seres humanos e não como insetos.</alternativa>
			<alternativa>Claro que sim, pois cigarras cantam mesmo até rebentar.</alternativa>
			<alternativa>Claro que não, pois cigarras não conversam nem cantam em bailes.</alternativa>
			<alternativa>Claro que sim, pois foi publicada em um boletim de folclore.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! A verossimilhança diz respeito à lógica interna do enredo. Na ficção os fatos não precisam ser verdadeiros nem é necessário que venham a acontecer no mundo real.</feedback>
			<feedback>Tente outra vez! A verossimilhança diz respeito à lógica interna do enredo. Por isso, em uma fábula é verossímil que os animais falem e ajam como seres humanos. Na ficção os fatos não precisam ser verdadeiros nem é necessário que venham a acontecer no mundo real.</feedback>
			<feedback>Tente outra vez! Cigarras cantam até arrebentar a própria casca, mas a verossimilhança não está ligada à realidade. A verossimilhança diz respeito à lógica interna do enredo. Na ficção os fatos não precisam ser verdadeiros nem é necessário que venham a acontecer no mundo real.</feedback>
			<feedback>Tente outra vez! A verossimilhança não está associada ao que pode acontecer no mundo real. A verossimilhança diz respeito à lógica interna do enredo.</feedback>
			<feedback>Tente outra vez! A publicação de uma história em um veículo de informação não garante a sua verossimilhança, tampouco garante que ela seja verdadeira. Na ficção os fatos não precisam ser verdadeiros nem é necessário que venham a acontecer no mundo real. A verossimilhança diz respeito à lógica interna do enredo.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<respcorreta>0</respcorreta>
		<premio>blusa2</premio>
		 <dialogos>
		 <quantidade>2</quantidade>
			<dialogo pers="Seo_Raimundo" contra="Vazio">                              A cigarra
“Diz o nosso povo que a cigarra é um animalzinho amaldiçoado, pois carrega tremenda praga. Aconteceu que estando a mãe dela gravemente doente e desacompanhada, mandou-lhe um recado para que viesse fazer-lhe companhia e servir-lhe de enfermeira. A cigarra, muito foliona que era, não se condoeu da pobre senhora e mandou dizer-lhe que não podia atendê-la, pois estava comprometida a cantar num baile.</dialogo>
<dialogo pers="Seo_Raimundo" contra="Vazio">A mãe, diante da resposta da filha ingrata, ajoelhou-se, pôs-se de os olhos no céu e rogou-lhe terrível praga: ‘Deus permita que arrebentes de tanto cantar!’                                                            E é por isso que a cigarra tanto se estofa no canto que acaba rebentando pelas costas.”
BOITEUX, Lucas A. Achegas à poranduba catarinense. #i#Boletim trimestral da Comissão catarinense de folclore#!i#. Florianópolis, ano II, nº5, set. 1950.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>A história é boa... mas você achou que isso é verossímil?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Claro que não, pois lobisomens não existem no mundo real.</alternativa>
			<alternativa>Claro que sim, pois em causos pode haver esse tipo de transformação.</alternativa>
			<alternativa>Claro que sim, pois foi publicada em um boletim de folclore.</alternativa>
			<alternativa>Claro que sim, pois muita gente já viu lobisomem em noite de lua cheia.</alternativa>
			<alternativa>Claro que não, pois pessoas não se transformam em seres sobrenaturais.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A verossimilhança não está associada ao que pode acontecer no mundo real. A verossimilhança diz respeito à lógica interna do enredo. Um causo de terror é verossímil quando parece possível que seres sobrenaturais, como o lobisomem, existam.</feedback>
			<feedback>Muito bem! A verossimilhança diz respeito à lógica interna do enredo. Um causo de terror é verossímil quando parece possível que seres sobrenaturais, como o lobisomem, existam. Os fatos não precisam ser verdadeiros, nem é necessário que venham a acontecer no mundo real, mas devem criar um efeito de verdade.</feedback>
			<feedback>Tente outra vez! A publicação de uma história em um veículo de informação não garante a sua verossimilhança, tampouco garante que ela seja verdadeira. A verossimilhança diz respeito à lógica interna do enredo. Um causo de terror é verossímil quando parece possível que seres sobrenaturais, como o lobisomem, existam.</feedback>
			<feedback>Tente outra vez! A verossimilhança não está associada ao que a maioria das pessoas acredita que seja a verdade. A verossimilhança diz respeito à lógica interna do enredo. Um causo de terror é verossímil quando parece possível que seres sobrenaturais, como o lobisomem, existam.</feedback>
			<feedback>Tente outra vez! A verossimilhança não está associada ao que pode acontecer no mundo real. A verossimilhança diz respeito à lógica interna do enredo. Um causo de terror é verossímil quando parece possível que seres sobrenaturais, como o lobisomem, existam.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>blusa</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
		 <quantidade>2</quantidade>
			<dialogo pers="Seo_Raimundo" contra="Vazio">                              Lobisomem
“Contaram-me praieiros de Canavieiras que existia no distrito de Ratones uma senhora casada que tinha um filho. Todos os dias, logo que o marido se ausentava, ia ela banhar a criança numa gamela. Ao fazê-lo, aproximava-se um bacorinho, (isto é, um porquinho) que tentava morder o menino. Ela o enxotava, mas o animal teimava em voltar. Certo dia, ela não se conteve e bateu no bicho que, enfurecido, avançou para ela e pôs-lhe em tiras a saia de baeta (ou seja, de um tecido grosso e felpudo).</dialogo>
<dialogo pers="Seo_Raimundo" contra="Vazio">Ao levantar-se, na manhã seguinte, viu com grande assombro os dentes do marido cheios de fiapos da referida fazenda. Foi assim que ele, sendo um lobisomem, perdeu o encantamento.”
BOITEUX, Lucas A. Achegas à poranduba catarinense. #i#Boletim trimestral da Comissão catarinense de folclore#!i#. Florianópolis, ano II, no 5, set. 1950.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>A história é boa... mas você achou que isso é verossímil?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Claro que não, pois em causos religiosos os mortos não conversam com os vivos.</alternativa>
			<alternativa>Claro que sim, pois foi publicada em um boletim de folclore.</alternativa>
			<alternativa>Claro que sim, pois em causos religiosos os mortos podem interagir com os vivos.</alternativa>
			<alternativa>Claro que não, pois o céu não tem porta nem porteiro.</alternativa>
			<alternativa>Claro que não, pois as mães sofrem muito quando seus filhos pequenos morrem.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A verossimilhança não está associada ao que pode acontecer no mundo real. A verossimilhança diz respeito à lógica interna do enredo. Um causo religioso é verossímil quando parece possível que seres sobrenaturais, como o menino morto, existam.</feedback>
			<feedback>Tente outra vez! A publicação de uma história em um veículo de informação não garante a sua verossimilhança, tampouco garante que ela seja verdadeira. A verossimilhança diz respeito à lógica interna do enredo. Um causo religioso é verossímil quando parece possível que seres sobrenaturais, como o menino morto, existam.</feedback>
			<feedback>Muito bem! A verossimilhança diz respeito à lógica interna do enredo. Um causo religioso é verossímil quando parece possível que seres sobrenaturais, como o menino morto, existam.</feedback>
			<feedback>Tente outra vez! A verossimilhança não está associada à crença religiosa. A verossimilhança diz respeito à lógica interna do enredo. Um causo religioso é verossímil quando parece possível que seres sobrenaturais, como o menino morto, existam.</feedback>
			<feedback>Tente outra vez! A verossimilhança não está associada aos sentimentos e atitudes mais comuns do mundo real. A verossimilhança diz respeito à lógica interna do enredo. Um causo religioso é verossímil quando parece possível que seres sobrenaturais, como o menino morto, existam.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>camisa</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
		 <quantidade>2</quantidade>
			<dialogo pers="Seo_Raimundo" contra="Vazio">                              A garrafinha
“Uma mãe perdera o filho pequenininho e, cheia de amargura e desespero, não cessava de pranteá-lo dia e noite. Vivia debulhada em lágrimas. Teve então um sonho em que lhe apareceu o filhotinho amado, muito triste e aflito. Ela perguntou-lhe a razão daquela mágoa. – “Minha mãezinha, - respondeu a criança - porque não alcancei ainda entrar no reino da glória!...” – “Mas, como, meu filho, se és um anjo, puro, sem pecado?” — “Sim, mãezinha, devido às tuas contínuas e copiosas lágrimas.”.</dialogo> 
<dialogo pers="Seo_Raimundo" contra="Vazio">“Eu te explico: Quando morre uma criança, ao chegar às portas do céu São Pedro entrega-lhe uma garrafinha para nela recolher as lágrimas de sua mãe: se estas forem tão abundantes que façam transvasar a garrafinha, não logrará gozar logo da bem aventurança eterna.”                                                                                 E é por isso que se aconselham às mães a se comedirem nas lágrimas aos filhos que morrem criancinhas.”
BOITEUX, Lucas A. Achegas à poranduba catarinense. #i#Boletim trimestral da Comissão catarinense de folclore#!i#. Florianópolis, ano II, no 5, set. de 1950.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>A história é boa... mas você achou que isso é verossímil?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Claro que sim, pois foi publicada em um boletim de folclore.</alternativa>
			<alternativa>Claro que não, pois pessoas não desaparecem no ar.</alternativa>
			<alternativa>Claro que sim, pois todo mundo tem medo de assombração.</alternativa>
			<alternativa>Claro que sim, pois em causos de assombração seres sobrenaturais podem se comunicar com os vivos.</alternativa>
			<alternativa>Claro que não, pois em causos de assombração os mortos não interagem com os vivos.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! A publicação de uma história em um veículo de informação não garante a sua verossimilhança, tampouco garante que ela seja verdadeira. A verossimilhança diz respeito à lógica interna do enredo. Em um causo de assombração é verossímil a existência de seres sobrenaturais.</feedback>
			<feedback>Tente outra vez! A verossimilhança não está associada ao que pode acontecer no mundo real. A verossimilhança diz respeito à lógica interna do enredo. Em um causo de assombração é verossímil a existência de seres sobrenaturais.</feedback>
			<feedback>Tente outra vez! A verossimilhança não está estritamente associada aos sentimentos e atitudes mais comuns do mundo real. A verossimilhança diz respeito à lógica interna do enredo. Em um causo de assombração é verossímil a existência de seres sobrenaturais.</feedback>
			<feedback>Muito bem! A verossimilhança diz respeito à lógica interna do enredo. Em um causo de assombração é verossímil a existência de seres sobrenaturais. Os fatos não precisam ser verdadeiros, nem é necessário que venham a acontecer no mundo real, mas devem criar um efeito de verdade.</feedback>
			<feedback>Tente outra vez! Não temos certeza de que o “Sete-cuias” seja um defunto. De qualquer forma, em causos de assombração é verossímil que os mortos conversem com os vivos, pois a verossimilhança diz respeito à lógica interna do enredo. Os fatos não precisam ser verdadeiros, nem é necessário que venham a acontecer no mundo real, mas devem criar um efeito de verdade.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>camisalonga</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
		 <quantidade>2</quantidade>
			<dialogo pers="Seo_Raimundo" contra="Vazio">                              O Sete-cuias
“Contaram-me pescadores de Sambaqui e Ponta Grossa que, no pontal dos Ratones, por eles considerado assombrado, noite velha, ouvem-se rufos de misteriosos tambores e que também costuma aparecer um vulto negro a pedir, por acenos, passagem aos canoeiros que se avizinham e perlongam aquela estirada língua de areia. Acontece que, ao embarcar a estranha e silenciosa figura, a canoa se torna de tal maneira sobrecarregada, que não mais avança apesar das fortes e continuadas remadas do tripulante: começa a encher-se d’água e a afundar.</dialogo>
<dialogo pers="Seo_Raimundo" contra="Vazio">Nessa ocasião o malvado negro, que é apelidado de “Sete-cuias” dá uma pavorosa risada e desaparece, deixando o mísero canoeiro a debater-se nas ondas.”
BOITEUX, Lucas A. Achegas à poranduba catarinense. #i#Boletim trimestral da Comissão catarinense de folclore#!i#. Florianópolis, ano II, no 5, set. 1950.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>A história é boa... mas você achou que isso é verossímil?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Claro que não, pois elementos da natureza não têm nenhuma relação com seres imaginários.</alternativa>
			<alternativa>Claro que não, pois cobras não têm cabelo nem têm amizade com negros.</alternativa>
			<alternativa>Claro que sim, pois todo mundo tem medo de monstros e de feiticeiros.</alternativa>
			<alternativa>Claro que sim, pois essa narrativa foi publicada em um boletim de folclore.</alternativa>
			<alternativa>Claro que sim, pois em narrativas míticas fenômenos da natureza podem ser explicados pela existência de seres imaginários.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! No mundo real, elementos da natureza são explicados cientificamente, mas em narrativas míticas eles podem sim ser explicados pela existência de seres imaginários, pois a verossimilhança diz respeito à lógica interna do enredo.</feedback>
			<feedback>Tente outra vez! A verossimilhança não está associada ao que pode acontecer no mundo real. A verossimilhança diz respeito à lógica interna do enredo.</feedback>
			<feedback>Tente outra vez! A verossimilhança não está estritamente associada aos sentimentos e atitudes mais comuns do mundo real. A verossimilhança diz respeito à lógica interna do enredo.</feedback>
			<feedback>Tente outra vez! A publicação de uma história em um veículo de informação não garante a sua verossimilhança, tampouco garante que ela seja verdadeira. A verossimilhança diz respeito à lógica interna do enredo.</feedback>
			<feedback>Muito bem! Em uma narrativa mítica, os fatos não precisam ser verdadeiros, nem é necessário que venham a acontecer no mundo real, mas devem criar um efeito de verdade.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>camiseta</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
			<quantidade>2</quantidade>
			<dialogo pers="Seo_Raimundo" contra="Vazio">                              O Cabeleira
“No penhascoso costão da enseada de Imbituba existe uma tenebrosa lapa a que dão o nome de “Buraco da Cobra”. Ali – segundo diziam os antigos – se aninhava enorme e horrível serpente, dotada de farta cabeleira e que, à noite, fazia grandes estragos na criação das redondezas. No tempo em que existia naquele porto uma Armação de Baleias, havia um negro, empregado nela, que aos domingos e dias santos fugia de ouvir a missa para meter-se naquela furna e ali entreter-se em pentear e fazer tramas na cabeleira do apavorante monstro.</dialogo>
<dialogo pers="Seo_Raimundo" contra="Vazio">Apontavam-no como feiticeiro e ter partes com o demônio, mascarado naquela horrenda e temível cobra. Um belo dia o negro e a serpente desapareceram sem deixar vestígios.”
BOITEUX, Lucas A. Achegas à poranduba catarinense. #i#Boletim trimestral da Comissão catarinense de folclore#!i#. Florianópolis, ano II, no 5, set. de 1950.</dialogo>
		</dialogos>
	</questao>
</questoes>
			
			]]> ).toString();
			
			questoesEpisodio[2] = (<![CDATA[
<questoes>
	<questao>
		<enunciado>Para dizer a mesma coisa, os homens falam de um jeito e as mulheres de outro? Será possível isso?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. Seria um caso de variação linguística relacionada com o sexo do falante.</alternativa>
			<alternativa>Não. Provavelmente há um engano nessa informação.</alternativa>
			<alternativa>Não. Em nenhuma língua as mulheres falam diferente dos homens.</alternativa>
			<alternativa>Sim. Mas isso só deve ocorrer na língua japonesa.</alternativa>
			<alternativa>Não. Deve ser indiferente para o falante dizer #i#sara#!i# ou #i#osara#!i#.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! No japonês, as mulheres incluem um #i#o#!i#, que indica respeito, na frente de alguns substantivos, como ocorre em #i#osara#!i# (#i#o#!i# + #i#sara#!i#). Essa variação linguística é correlacionada ao sexo do falante e na língua japonesa essa diferença é bem marcada.</feedback>
			<feedback>Tente outra vez! Não há nenhum engano. O caso pode parecer estranho para um falante de português porque em nossa língua esse tipo de variação não é muito observado. Mas em muitas línguas as mulheres falam diferente dos homens e no japonês essa diferença é bem marcada. Por exemplo, as mulheres incluem um #i#o#!i#, que indica respeito, na frente de alguns substantivos, como ocorre em #i#osara#!i# (#i#o#!i# + #i#sara#!i#).</feedback>
			<feedback>Tente outra vez! Em muitas línguas as mulheres falam diferente dos homens. No japonês, por exemplo, as mulheres incluem um #i#o#!i#, que indica respeito, na frente de alguns substantivos, como ocorre em #i#osara#!i# (#i#o#!i# + #i#sara#!i#). Essa é uma variação linguística correlacionada ao sexo do falante - na língua japonesa essa diferença é bem marcada.</feedback>
			<feedback>Tente outra vez! Em muitas línguas as mulheres falam diferente dos homens. Mesmo no português, em que essa diferença não é tão saliente, podemos notar, por exemplo, que na fala da mulher costuma ocorrer um uso mais acentuado de expressões afetivas, como os diminutivos. No japonês, esse tipo de variação é bem perceptível. Por exemplo: as mulheres incluem um #i#o#!i#, que indica respeito, na frente de alguns substantivos, como ocorre em #i#osara#!i# (#i#o#!i# + #i#sara#!i#).</feedback>
			<feedback>Tente outra vez! Há diferença entre usar uma forma ou a outra: #i#osara#!i# é uma forma mais respeitosa que #i#sara#!i#. No japonês, as mulheres incluem esse #i#o#!i#, que indica respeito, na frente de alguns substantivos. Essa variação linguística é correlacionada ao sexo do falante e na língua japonesa essa diferença é bem marcada.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>bermuda</premio>
		<respcorreta>0</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
			<dialogo pers="Belinha" contra="Dona_Josefa">O tal do Ipod do Pedro diz que, para uma mulher falar #i#prato#!i# em japonês, vai dizer #i#osara#!i#; se for homem, vai dizer #i#sara#!i#.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Está errado dizer #i#não se avexe#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. Só há um jeito de dizer isso: #i#não se aborreça#!i#.</alternativa>
			<alternativa>Não. É um caso de diferença regional no vocabulário.</alternativa>
			<alternativa>Não. Mas somente os mais velhos usam essa expressão.</alternativa>
			<alternativa>Não. Na verdade, esse é o único jeito de dizer isso.</alternativa>
			<alternativa>Sim. Uma língua não pode ter dois modos de dizer a mesma coisa.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Há brasileiros que dizem #i#não se avexe#!i# e outros que dizem #i#não se aborreça#!i#. É um caso de variação regional no uso da língua e não há nada de errado nisso!</feedback>
			<feedback>Muito bem! Há brasileiros que dizem #i#não se avexe#!i# e outros que dizem #i#não se aborreça#!i#. É um caso de variação regional no uso da língua.</feedback>
			<feedback>Tente outra vez! Existe variação linguística relacionada com a idade do falante, mas não é o caso aqui. Esse é um caso de variação regional no uso da língua: há brasileiros que dizem #i#não se avexe#!i# e outros que dizem #i#não se aborreça#!i#.</feedback>
			<feedback>Tente outra vez! Há brasileiros que dizem #i#não se avexe#!i# e outros que dizem #i#não se aborreça#!i#. É comum encontrarmos nas línguas palavras diferentes para dizer a mesma coisa. No caso em questão, temos uma variação regional no vocabulário.</feedback>
			<feedback>Tente outra vez! É comum encontrarmos nas línguas palavras diferentes para dizer a mesma coisa. No caso em questão, temos uma variação regional no vocabulário: há brasileiros que dizem #i#não se avexe#!i# e outros que dizem #i#não se aborreça#!i#.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>calça</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
		 <quantidade>1</quantidade>
			<dialogo pers="Belinha" contra="Dona_Josefa">Quando alguém fica nervoso, Iaiá fala #i#não se avexe#!i#, mas um paulista costuma dizer #i#não se aborreça#!i#.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Mas está errado falar assim?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Não. Mas só criança muito nova fala assim.</alternativa>
			<alternativa>Sim. Deve-se usar #i#padrinho#!i#, #i#mãezinha#!i# e #i#paizinho#!i#.</alternativa>
			<alternativa>Não. São diminutivos muito usados na Bahia.</alternativa>
			<alternativa>Sim. Porque não é assim que se faz o diminutivo.</alternativa>
			<alternativa>Sim. Porque pessoas da roça fazem muitos erros ao falar.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Não são só as crianças que falam assim. #i#Padim#!i#, #i#mainha#!i# e #i#painho#!i# são diminutivos de uso geral na Bahia. É um caso de variação regional no uso da língua.</feedback>
			<feedback>Tente outra vez! #i#Padim#!i#, #i#mainha#!i# e #i#painho#!i# também são formas do português - são diminutivos de uso geral na Bahia. É um caso de variação regional no uso da língua.</feedback>
			<feedback>Muito bem! #i#Padim#!i#, #i#mainha#!i# e #i#painho#!i# são diminutivos de uso geral na Bahia. É um caso de variação regional no uso da língua.</feedback>
			<feedback>Tente outra vez! #i#Padim#!i#, #i#mainha#!i# e #i#painho#!i# são diminutivos de uso geral na Bahia. É um caso de variação regional no uso da língua.</feedback>
			<feedback>Tente outra vez! Não há nenhum erro. #i#Padim#!i#, #i#mainha#!i# e #i#painho#!i# são diminutivos de uso geral na Bahia. É um caso de variação regional no uso da língua.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>saia2</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
		 <quantidade>1</quantidade>
			<dialogo pers="Dona_Josefa" contra="Belinha">Belinha chama seu padrinho de #i#padim#!i#. Também se ouve por aqui #i#mainha#!i#, #i#painho#!i# para mãe e pai.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>É errado falar #i#mungunzá#!i#?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. Só há um nome correto para esse alimento: é #i#canjica#!i#.</alternativa>
			<alternativa>Não. Mas Dona Josefa não sabe pronunciar o nome direito.</alternativa>
			<alternativa>Sim. Dona Josefa não sabe falar bem nossa língua.</alternativa>
			<alternativa>Não. É um caso de diferença regional no vocabulário.</alternativa>
			<alternativa>Sim. Uma língua não pode ter dois nomes para a mesma coisa.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Os dois nomes são corretos. Na Bahia se usa #i#munguzá#!i# ou #i#mungunzá#!i#, e em São Paulo se usa #i#canjica#!i#. É comum haver diferenças no uso da língua conforme a região do país.</feedback>
			<feedback>Tente outra vez! Existe a pronúncia #i#munguzá#!i#, mas também existe a pronúncia #i#mungunzá#!i#. Na Bahia se usam as duas formas; e em São Paulo se usa #i#canjica#!i#. É comum haver diferenças no uso da língua conforme a região do país.</feedback>
			<feedback>Tente outra vez! Ela sabe falar português e usou o nome que é usado em sua região. Na Bahia se usa #i#munguzá#!i# ou #i#mungunzá#!i#, e em São Paulo se usa #i#canjica#!i#. É comum haver diferenças no uso da língua conforme a região do país.</feedback>
			<feedback>Muito bem! É isso mesmo. Na Bahia se usa #i#munguzá#!i# ou #i#mungunzá#!i#; já em São Paulo o termo usado é #i#canjica#!i#. É comum haver diferenças no uso da língua conforme a região do país.</feedback>
			<feedback>Tente outra vez! É comum haver nomes diferentes para uma mesma coisa conforme a região em que a língua é falada. É o caso do nome dessa comida: na Bahia se chama #i#munguzá#!i# ou #i#mungunzá#!i#, e em São Paulo, #i#canjica#!i#.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>saia3</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
		 	<quantidade>1</quantidade>
			<dialogo pers="Belinha" contra="Dona_Josefa">Minha vó chama essa comida de #i#mungunzá#!i#, mas ouvi Carolina dizer #i#canjica#!i#.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Eu não falei #i#bênção#!i#. Está errado o jeito que eu falei?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. Belinha se atrapalhou e saiu #i#bença#!i# sem querer.</alternativa>
			<alternativa>Sim. Belinha precisa aprender a pronúncia certa: #i#bênção#!i#.</alternativa>
			<alternativa>Não. Mas só os baianos falam #i#bença#!i# em vez de #i#bênção#!i#.</alternativa>
			<alternativa>Sim. Só Belinha fala essa palavra desse jeito.</alternativa>
			<alternativa>Não. Essa é a pronúncia popular da palavra.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Às vezes nos atrapalhamos na pronúncia das palavras, mas Belinha não se enganou ao falar. É essa a maneira que ela está acostumada a ouvir e a usar. #i#Bença#!i# é a pronúncia popular para #i#bênção#!i#, uma forma respeitosa que se usava para cumprimentar os pais, tios, avós ou padrinhos ao encontrá-los, ao se despedir, ou na hora de ir dormir.</feedback>
			<feedback>Tente outra vez! A pronúncia de Belinha não está errada. Essa é a pronúncia popular para #i#bênção#!i#, uma forma respeitosa que se usava para cumprimentar os pais, tios, avós ou padrinhos ao encontrá-los, ao se despedir, ou na hora de ir dormir.</feedback>
			<feedback>Tente outra vez! Há muita variação regional no português, mas não é o caso aqui. #i#Bença#!i# é a pronúncia popular para #i#bênção#!i#, uma forma respeitosa que se usava para cumprimentar os pais, tios, avós ou padrinhos ao encontrá-los, ao se despedir, ou na hora de ir dormir.</feedback>
			<feedback>Tente outra vez! Não é só Belinha que fala assim. Essa é a pronúncia popular para #i#bênção#!i#, uma forma respeitosa que se usava para cumprimentar os pais, tios, avós ou padrinhos ao encontrá-los, ao se despedir, ou na hora de ir dormir.</feedback>
			<feedback>Muito bem! Essa é a pronúncia popular para #i#bênção#!i#, uma forma respeitosa que se usava para cumprimentar os pais, tios, avós ou padrinhos ao encontrá-los, ao se despedir, ou na hora de ir dormir.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>saia</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
			<dialogo pers="Belinha" contra="Dona_Josefa">A #i#bença#!i#.</dialogo>
		</dialogos>
	</questao>
</questoes>
			]]> ).toString();
			
			questoesEpisodio[3] = (<![CDATA[
<questoes>
	<questao>
		<enunciado>Por que cada um fala de um jeito?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque os nomes do brinquedo variam conforme a região.</alternativa>
			<alternativa>Porque somente as pessoas cultas falam #i#pipa#!i#.</alternativa>
			<alternativa>Porque só fala #i#papagaio#!i# quem é mais velho.</alternativa>
			<alternativa>Porque em algumas regiões se fala melhor o português.</alternativa>
			<alternativa>Porque algumas pessoas preferem usar termos difíceis.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! #i#Papagaio, pipa, pandorga, cafifa, raia#!i# ou #i#arraia#!i# são nomes diferentes dados para o brinquedo infantil e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez!  Realmente, pessoas cultas podem ter um vocabulário diferente, mas não é o caso aqui. O uso de #i#pipa#!i# ou #i#papagaio#!i# não está relacionado com o grau de escolaridade do falante. #i#Papagaio, pipa, pandorga, cafifa, raia#!i# ou #i#arraia#!i# são nomes diferentes dados para o brinquedo e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez! Realmente, pessoas mais velhas podem usar palavras diferentes, mais antigas, mas não é o caso aqui. O uso de #i#pipa#!i# ou #i#papagaio#!i# não está relacionado com a idade do falante. #i#Papagaio, pipa, pandorga, cafifa, raia#!i# ou #i#arraia#!i# são nomes diferentes dados para o brinquedo e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez! Realmente há esse mito, mas não há nenhuma razão para considerar que o português falado em uma região é melhor que o português de outra região. #i#Papagaio, pipa, pandorga, cafifa, raia#!i# ou #i#arraia#!i# são nomes diferentes dados para o brinquedo e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez! Não há por que considerar um desses nomes mais difícil que o outro: o falante aprende o que é utilizado na sua região. #i#Papagaio, pipa, pandorga, cafifa, raia#!i# ou #i#arraia#!i# são nomes diferentes dados para o brinquedo infantil e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>anel</premio>
		<respcorreta>0</respcorreta>
		 <dialogos>
		 	<quantidade>1</quantidade>
			<dialogo pers="Dona_Maria" contra="Vazio">Quando eu viajei, ouvi crianças dizendo que estavam empinando #i#pipa#!i#. Mas eu chamo aquele brinquedo de #i#papagaio#!i#.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Por que cada um fala de um jeito?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque somente as pessoas cultas falam #i#matuto#!i#.</alternativa>
			<alternativa>Porque as formas de se referir a alguém podem variar de região para região.</alternativa>
			<alternativa>Porque só fala #i#tabaréu#!i# quem é mais velho.</alternativa>
			<alternativa>Porque em algumas regiões se fala melhor o português.</alternativa>
			<alternativa>Porque algumas pessoas preferem usar termos difíceis.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Realmente, pessoas cultas podem ter um vocabulário diferente, mas não é esse o caso aqui. O uso de #i#tabaréu#!i# ou #i#matuto#!i# não está relacionado com o grau de escolaridade do falante. #i#Tabaréu, matuto, caipira#!i# são nomes diferentes usados para se referir à pessoa que vive no meio rural e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Muito bem! #i#Tabaréu, matuto, caipira#!i# são nomes diferentes para se referir à pessoa que vive no meio rural e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez! Realmente, pessoas mais velhas podem usar palavras diferentes, mais antigas, mas não é o caso aqui. O uso de #i#tabaréu#!i# ou #i#matuto#!i# não está relacionado com a idade do falante. #i#Tabaréu, matuto, caipira#!i# são nomes diferentes usados para se referir à pessoa que vive no meio rural e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez! Realmente há esse mito, mas não há nenhuma razão para considerar que o português falado em uma região é melhor que o português de outra região. #i#Tabaréu, matuto, caipira#!i# são nomes diferentes usados para se referir à pessoa que vive no meio rural e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez! Não há por que considerar um desses nomes mais difícil que o outro: o falante aprende o que é utilizado na sua região. #i#Tabaréu, matuto, caipira#!i# são nomes diferentes usados para se referir à pessoa que vive no meio rural e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>brincos</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
			<dialogo pers="Dona_Maria" contra="Vazio">Aqui na Bahia, quem vive no meio rural é chamado de #i#tabaréu#!i#. Mas quando eu viajei, ouvi dizerem #i#matuto#!i# para um morador do meio rural. </dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Por que cada um fala de um jeito?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque só fala #i#baladeira#!i# quem é mais velho.</alternativa>
			<alternativa>Porque somente as pessoas cultas falam #i#estilingue#!i#.</alternativa>
			<alternativa>Porque os nomes do brinquedo variam conforme a região.</alternativa>
			<alternativa>Porque em algumas regiões se fala melhor o português.</alternativa>
			<alternativa>Porque algumas pessoas preferem usar termos difíceis.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez!  Realmente, pessoas mais velhas podem usar palavras diferentes, mais antigas, mas não é o caso aqui. #i#Estilingue, atiradeira, baladeira, bodoque, setra, funda#!i# são nomes diferentes do brinquedo que as crianças utilizam para atirar pedras e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez!  Realmente, pessoas cultas podem ter um vocabulário diferente, mas não é esse o caso aqui. #i#Estilingue, atiradeira, baladeira, bodoque, setra, funda#!i# são nomes diferentes do brinquedo que as crianças utilizam para atirar pedras e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Muito bem! #i#Estilingue, atiradeira, baladeira, bodoque, setra, funda#!i# são nomes diferentes do brinquedo que as crianças utilizam para atirar pedras e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez! Realmente há esse mito, mas não há nenhuma razão para considerar que o português falado em uma região é melhor que o português de outra região. #i#Estilingue, atiradeira, baladeira, bodoque, setra, funda#!i# são nomes diferentes do brinquedo que as crianças utilizam para atirar pedras e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez! Não há por que considerar um desses nomes mais difícil que o outro: o falante aprende o que é utilizado na sua região. #i#Estilingue, atiradeira, baladeira, bodoque, setra, funda#!i# são nomes diferentes do brinquedo que as crianças utilizam para atirar pedras e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>oculos</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Dona_Maria" contra="Vazio">Quando viajei, ouvi as crianças dizendo que estavam brincando com um #i#estilingue#!i#. Pra mim, aquele brinquedo se chama #i#baladeira#!i#!</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Por que cada um fala de um jeito?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque em algumas regiões se fala melhor o português.</alternativa>
			<alternativa>Porque somente as pessoas cultas falam #i#carne seca#!i#.</alternativa>
			<alternativa>Porque só fala #i#jabá#!i# quem é mais velho.</alternativa>
			<alternativa>Porque o nome de um alimento pode variar de região para região.</alternativa>
			<alternativa>Porque algumas pessoas preferem usar termos difíceis.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Realmente há esse mito, mas não há nenhuma razão para considerar que o português falado em uma região é melhor que o português de outra região. #i#Jabá, carne seca#!i# ou #i#charque#!i# são nomes diferentes usados para se referir a um tipo de carne salgada muito consumido em diversas regiões do Brasil e ilustram a riqueza de nossa cultura e de nossa linguagem regional.</feedback>
			<feedback>Tente outra vez! Realmente, pessoas cultas podem ter um vocabulário diferente, mas não é esse o caso aqui. #i#Jabá, carne seca#!i# ou #i#charque#!i# são nomes diferentes usados para se referir a um tipo de carne salgada muito consumido em diversas regiões do Brasil e ilustram a riqueza de nossa cultura e de nossa linguagem regional.</feedback>
			<feedback>Tente outra vez!  Realmente, pessoas mais velhas podem usar palavras diferentes, mais antigas, mas não é o caso aqui. #i#Jabá, carne seca#!i# ou #i#charque#!i# são nomes diferentes usados para se referir a um tipo de carne salgada muito consumido em diversas regiões do Brasil e ilustram a riqueza de nossa cultura e de nossa linguagem regional.</feedback>
			<feedback>Muito bem! #i#Jabá, carne seca#!i# ou #i#charque#!i# são nomes diferentes usados para se referir a um tipo de carne salgada muito consumido em diversas regiões do Brasil e ilustram a riqueza de nossa cultura e de nossa linguagem regional.</feedback>
			<feedback>Tente outra vez! Não há por que considerar um desses nomes mais difícil que o outro: o falante aprende o que é utilizado na sua região. #i#Jabá, carne seca#!i# ou #i#charque#!i# são nomes diferentes usados para se referir a um tipo de carne salgada muito consumido em diversas regiões do Brasil e ilustram a riqueza de nossa cultura e de nossa linguagem regional.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>pulseira</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Dona_Maria" contra="Vazio">Quando eu viajei, ouvi o pessoal dizendo que estava comendo #i#carne seca#!i#. Mas aquilo era #i#jabá#!i#!</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Por que cada um fala de um jeito?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Porque algumas pessoas preferem usar termos difíceis.</alternativa>
			<alternativa>Porque somente as pessoas cultas falam #i#bolinha de gude#!i#.</alternativa>
			<alternativa>Porque só fala #i#bila#!i# quem é mais velho.</alternativa>
			<alternativa>Porque em algumas regiões se fala melhor o português.</alternativa>
			<alternativa>Porque os nomes do brinquedo variam conforme a região.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Não há por que considerar um desses nomes mais difícil que o outro: o falante aprende o que é utilizado na sua região. #i#Búrica, bolinha de gude, bolinha de vidro, marraio#!i# ou #i#bila#!i# são nomes diferentes do brinquedo infantil e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez! Realmente, pessoas cultas podem ter um vocabulário diferente, mas não é esse o caso aqui. #i#Búrica, bolinha de gude, bolinha de vidro, marraio#!i# ou #i#bila#!i# são nomes diferentes do brinquedo infantil e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez! Realmente, pessoas mais velhas podem usar palavras diferentes, mais antigas, mas não é o caso aqui. O uso de #i#bolinha de gude#!i# ou #i#bila#!i# não está relacionado com a idade do falante. #i#Búrica, bolinha de gude, bolinha de vidro, marraio#!i# ou #i#bila#!i# são nomes diferentes do brinquedo infantil e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Tente outra vez! Realmente há esse mito, mas não há nenhuma razão para considerar que o português falado em uma região é melhor que o português de outra região. #i#Búrica, bolinha de gude, bolinha de vidro, marraio#!i# ou #i#bila#!i# são nomes diferentes do brinquedo infantil e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
			<feedback>Muito bem! #i#Búrica, bolinha de gude, bolinha de vidro, marraio#!i# ou #i#bila#!i# são nomes diferentes do brinquedo infantil e ilustram a riqueza da cultura e da linguagem regional do Brasil.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>relogio</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
			<dialogo pers="Dona_Maria" contra="Vazio">Quando eu viajei, ouvi crianças dizendo que estavam jogando #i#bolinha de gude#!i#. Mas aquele brinquedo era #i#bila#!i#!</dialogo>
		</dialogos>
	</questao>
</questoes>
			]]> ).toString();
			
			questoesEpisodio[4] = (<![CDATA[
<questoes>
	<questao>
		<enunciado>Qual seria uma boa forma de escrever o bilhete para o Seo Zé?</enunciado> 
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Seo Zé,

Por favor, mande 10 sacos de estopa. Aproveito para contar que o filho da Chiquinha já está nascendo.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande 5, 6 ou 10 sacos de estopa. Aproveito para contar que o filho da Chiquinha já está nascendo.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande uns sacos de estopa. Aproveita para contar que o filho da Chiquinha está nascendo.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande uns 10 sacos de estopa, já tá bom, né? Ah! o filho da Chiquinha está nascendo, tá?

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, a Dona Socorro pede que o senhor mande 10 sacos de estopa. Ela aproveita para contar que o filho da Chiquinha está nascendo.

Lembranças,
Dona Socorro
</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! Seu bilhete ficou adequado, pois você conseguiu manter as informações, excluindo características típicas da fala tais como hesitações e redundâncias.</feedback>
			<feedback>Tente outra vez! Essa formulação conserva no texto escrito uma das características da fala que é a hesitação. Na fala, é comum reformular o pensamento como aconteceu com Dona Socorro que, num primeiro momento, pede 5 sacos de estopa, depois acha melhor 6 e acaba decidindo por 10. Essa fase de reformulação ou de hesitação não aparece na escrita.</feedback>
			<feedback>Tente outra vez! Nessa reformulação ocorreram dois problemas. Um deles é a falta da informação objetiva: 10 sacos de estopa. O outro problema é que o verbo #i#aproveita#!i# está em terceira pessoa, quando deveria se referir a quem assina o bilhete, que é Dona Socorro, em primeira pessoa. A forma adequada do verbo seria #i#aproveito#!i#.</feedback>
			<feedback>Tente outra vez! Essa reformulação escrita manteve algumas marcas típicas da oralidade que têm a função de fortalecer a interação em diálogos face a face. Essas marcas são #i#já tá bom, né?, Ah!, tá?#!i#, que não são necessárias em um texto escrito.</feedback>
			<feedback>Tente outra vez! Essa reformulação está escrita como se fosse Nico se dirigindo a Seo Zé, o que pode ser observado nos trechos: #i#A Dona Socorro pede..., Ela aproveita...#!i#. Mas quem assina o bilhete é Dona Socorro, então ela é que deveria se dirigir a Seo Zé, assim: #i#Peço que mande..., Aproveito para contar...#!i#.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>bolsa1</premio>
		<respcorreta>0</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
			<dialogo pers="Dona_Joana" contra="Nico">Nico, o compadre vai pra cidade e... e.. e eu quero ver ...tô querendo, como se diz, aproveitar a viagem, né, já que eu tô precisando pedir umas coisinha pro Seo Zé da venda. Tome nota aí, faça um bilhete pro Seo Zé no meu nome: pede a ele se... se ele pode mandar uns cinco.... uma meia dúzia... não, não, pede uns dez, dez saco de estopa já tá bom! Anota bem! Ah e aproveita também pra contar pro Seo Zé aí que a Chiquinha tá quase parindo, né? Pro mês já vai ter menino novo aparecendo lá na venda, né?</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Qual seria uma boa forma de escrever o bilhete para o Seo Zé?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Seo Zé,

Por favor, mande uma... aquela mesma fazenda que o senhor mandou da última vez. Aproveito para contar que a festa está boa e veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande 3 metros da mesma fazenda que o senhor mandou da última vez. Aproveito para contar que a festa está boa e que veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande uma fazenda. Aproveita para contar que a festa está boa e veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande a mesma fazenda, né, que o senhor mandou da última vez, sabe? Aproveito para contar que a festa está boa e veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, a Dona Socorro pede que o senhor mande a mesma fazenda que o senhor mandou da última vez. Ela aproveita para contar que a festa está boa e veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Essa formulação conserva no texto escrito uma das características da fala que é a hesitação. Na fala é comum reformular o pensamento como aconteceu com Dona Socorro, que pede, num primeiro momento, uma, em seguida, aquela mesma do outro dia e tenta ser mais específica com a expressão aquela mesma fazenda que o senhor mandou da última vez. Essa fase de reformulação ou de hesitação não aparece na escrita.</feedback>
			<feedback>Muito bem! Seu bilhete ficou adequado, pois você conseguiu manter as informações, excluindo características típicas da fala tais como hesitações e redundâncias.</feedback>
			<feedback>Tente outra vez! Nessa reformulação ocorreram dois problemas. Um deles é a falta da informação objetiva: Dona Socorro não quer qualquer fazenda, mas a que foi mandada da vez anterior. O outro problema é que o verbo #i#aproveita#!i# está em terceira pessoa, quando deveria se referir a quem assina o bilhete, que é Dona Socorro, em primeira pessoa. A forma adequada do verbo seria #i#aproveito#!i#.</feedback>
			<feedback>Tente outra vez! Essa reformulação escrita manteve algumas marcas típicas da oralidade que têm a função de fortalecer a interação em diálogos face a face. Essas marcas são #i#né, sabe?#!i#, que não são necessárias em um texto escrito.</feedback>
			<feedback>Tente outra vez! Essa reformulação está escrita como se fosse Nico se dirigindo a Seo Zé, o que pode ser observado nos trechos: “...”, #i#Ela aproveita...#!i#. Mas quem assina o bilhete é Dona Socorro, então ela é que deveria se dirigir a Seo Zé, assim: #i#Peço que mande..., Aproveito para contar...#!i#.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>bolsa2</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Dona_Joana" contra="Nico">Nico, o compadre vai pra cidade e... e... e eu quero ver... tô querendo, como se diz, aproveitar a viagem, né, já que eu tô precisando pedir umas coisinha pro Seo Zé da venda. Tome nota aí, faça um bilhete pro Seo Zé no meu nome: pede...se ele pode eh...se ele tem lá... uma... aquela mesma fazenda, né? que ele mandou naquele outro dia... pra eu fazer um lençol pra cama da Dona Josefa, né? Uns, uns... uns 3 metros tá bom. Anota bem! Ah e aproveita também pra contar pro Seo Zé aí que a festa tá boa e que veio gente até da cidade na festa.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Qual seria uma boa forma de escrever o bilhete para o Seo Zé?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Seo Zé,

Por favor, mande um carretel de linha daquele grande, aquele bem grande, carretel de linha branca. Aproveito para contar que o filho da Chiquinha já está nascendo.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande um carretel de linha grande. Aproveita para contar que o filho da Chiquinha já está nascendo.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande um carretel de linha branca grande. Aproveito para contar que o filho da Chiquinha já está nascendo.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande um carretel de linha branca grande, sabe qual? Aproveito para contar que o filho da Chiquinha já está nascendo, né?

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, a Dona Socorro pede que o senhor mande um carretel de linha branca grande. Ela aproveita para contar que o filho da Chiquinha já está nascendo.

Lembranças,
Dona Socorro
</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Essa formulação conserva no texto escrito uma das características da fala que é a repetição. Na fala é comum repetir e reformular o pensamento como aconteceu com Dona Socorro, que pede, num primeiro momento, #i#carretel de linha daquele grande#!i#, em seguida, #i#aquele bem grande, que vem bastante#!i#, reformula e reforça a informação com #i#o pequeno não serve, vem muito pouco, não dá pra nada#!i# e especifica com #i#carretel de linha branca#!i#. Essa fase de repetição e reformulação não aparece na escrita.</feedback>
			<feedback>Tente outra vez! Nessa reformulação ocorreram dois problemas. Um deles é a falta da informação objetiva: o carretel grande que Dona Socorro pediu é de linha branca. O outro problema é que o verbo #i#aproveita#!i# está em terceira pessoa, quando deveria se referir a quem assina o bilhete, que é Dona Socorro, em primeira pessoa. A forma adequada do verbo seria #i#aproveito#!i#.</feedback>
			<feedback>Muito bem! Seu bilhete ficou adequado, pois você conseguiu manter as informações, excluindo características típicas da fala tais como hesitações e redundâncias.</feedback>
			<feedback>Tente outra vez! Essa reformulação escrita manteve algumas marcas típicas da oralidade que têm a função de fortalecer a interação em diálogos face a face. Essas marcas são #i#sabe qual?, né?#!i#, que não são necessárias em um texto escrito.</feedback>
			<feedback>Tente outra vez! Essa reformulação está escrita como se fosse Nico se dirigindo a Seo Zé, o que pode ser observado nos trechos: #i#A Dona Socorro pede..., Ela aproveita...#!i#. Mas quem assina o bilhete é Dona Socorro, então ela é que deveria se dirigir a Seo Zé, assim: #i#Peço que mande..., Aproveito para contar...#!i#.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>bolsa3</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Dona_Joana" contra="Nico">Nico, o compadre vai pra cidade e... e... e eu quero ver... tô querendo, como se diz, aproveitar a viagem, né, já que eu tô precisando pedir umas coisinha pro Seo Zé da venda. Tome nota aí, faça um bilhete pro Seo Zé no meu nome: pede...se ele tem carretel de linha daquele grande, sabe qual? aquele bem grande, que vem bastante, né?, o pequeno não serve, vem muito pouco, não dá pra nada! Carretel de linha branca. Anota bem! Ah e aproveita também pra contar pro seo Zé aí que a Chiquinha tá quase parindo, né? pro mês já vai ter menino novo aparecendo lá na venda, né?</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Qual seria uma boa forma de escrever o bilhete para o Seo Zé?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Seo Zé,

Por favor, mande 3, 4 ou 5 latas de querosene. Aproveito para contar que a festa está boa e que veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande querosene. Aproveita para contar que a festa está boa e que veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande 5 latas de querosene, tá? Aproveito para contar que a festa está boa e veio gente até da cidade, né?

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande 5 latas de querosene. Aproveito para contar que a festa está boa e veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, a Dona Socorro pede que o senhor mande cinco latas de querosene. Ela aproveita para contar que a festa está boa e veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Essa formulação conserva no texto escrito uma das características da fala que é a hesitação. Na fala é comum reformular o pensamento como aconteceu com Dona Socorro, que pede, num primeiro momento, 3, depois acha melhor 4 e acaba decidindo por 5 latas de querosene. Essa fase de reformulação ou de hesitação não aparece na escrita.</feedback>
			<feedback>Tente outra vez! Nessa reformulação ocorreram dois problemas. Um deles é a falta da informação objetiva: são 5 latas de querosene. O outro problema é que o verbo #i#aproveita#!i# está em terceira pessoa, quando deveria se referir a quem assina o bilhete, que é Dona Socorro, em primeira pessoa. A forma adequada do verbo seria #i#aproveito#!i#.</feedback>
			<feedback>Tente outra vez! Essa reformulação escrita manteve algumas marcas típicas da oralidade que têm a função de fortalecer a interação em diálogos face a face. Essas marcas são #i#tá?, né?#!i#, que não são necessárias em um texto escrito.</feedback>
			<feedback>Muito bem! Seu bilhete ficou adequado, pois você conseguiu manter as informações, excluindo características típicas da fala tais como hesitações e redundâncias.</feedback>
			<feedback>Tente outra vez! Essa reformulação está escrita como se fosse Nico se dirigindo a Seo Zé, o que pode ser observado nos trechos: #i#A Dona Socorro pede..., Ela aproveita...#!i#. Mas quem assina o bilhete é Dona Socorro, então ela é que deveria se dirigir a Seo Zé, assim: #i#Peço que mande..., Aproveito para contar...#!i#.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>bolsa4</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Dona_Joana" contra="Nico">Nico, o compadre vai pra cidade e... e... e eu quero ver... tô querendo, como se diz, aproveitar a viagem, né, já que eu tô precisando pedir umas coisinha pro Seo Zé da venda. Tome nota aí, faça um bilhete pro Seo Zé no meu nome: pede... se ele tem querosene... 3... não, não, pede 4... se ele tiver, pede logo 5, assim já fica pra mais tempo, pede 5 lata de querosene, tá?. Anota bem! Ah e aproveita também pra contar pro Seo Zé aí que a festa tá boa e que veio gente até da cidade na festa.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Qual seria uma boa forma de escrever o bilhete para o Seo Zé?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Seo Zé,

Por favor, mande 1, 2 ou 3 saquinhos de sal. Aproveito para contar que a festa está boa e que veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande sal. Aproveita para contar que a festa está boa e que veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande 3 saquinhos de sal, tá? Ah, aproveito para contar que a festa está boa e veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, a Dona Socorro pede que o senhor mande três saquinhos de sal. Ela aproveita para contar que a festa está boa e veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
			<alternativa>Seo Zé,

Por favor, mande 3 saquinhos de sal. Aproveito para contar que a festa está boa e veio gente até da cidade.

Lembranças,
Dona Socorro
</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Essa formulação conserva no texto escrito uma das características da fala que é a hesitação. Na fala é comum reformular o pensamento como aconteceu com Dona Socorro, que pede, num primeiro momento, #i#uma#!i#, em seguida, #i#aquela mesma do outro dia#!i# e tenta ser mais específica com a expressão #i#aquela mesma fazenda que o senhor mandou da última vez#!i#. Essa fase de reformulação ou de hesitação não aparece na escrita.</feedback>
			<feedback>Tente outra vez! Nessa reformulação ocorreram dois problemas. Um deles é a falta da informação objetiva: são 3 saquinhos de sal. O outro problema é que o verbo #i#aproveita#!i# está em terceira pessoa, quando deveria se referir a quem assina o bilhete, que é Dona Socorro, em primeira pessoa. A forma adequada do verbo seria #i#aproveito#!i#.</feedback>
			<feedback>Tente outra vez! Essa reformulação escrita manteve algumas marcas típicas da oralidade que têm a função de fortalecer a interação em diálogos face a face. Essas marcas são #i#tá?, Ah!#!i#, que não são necessárias em um texto escrito.</feedback>
			<feedback>Tente outra vez! Essa reformulação está escrita como se fosse Nico se dirigindo a Seo Zé, o que pode ser observado nos trechos: #i#A Dona Socorro pede..., Ela aproveita...#!i#. Mas quem assina o bilhete é Dona Socorro, então ela é que deveria se dirigir a Seo Zé, assim: #i#Peço que mande..., Aproveito para contar...#!i#.</feedback>
			<feedback>Muito bem! Seu bilhete ficou adequado, pois você conseguiu manter as informações, excluindo características típicas da fala tais como hesitações e redundâncias.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>bolsa5</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Dona_Joana" contra="Nico">Nico, o compadre vai pra cidade e... e... e eu quero ver... tô querendo, como se diz, aproveitar a viagem, né, já que eu tô precisando pedir umas coisinha pro Seo Zé da venda. Tome nota aí, faça um bilhete pro Seo Zé no meu nome: pede... se ele tem sal... 1... não, não, pede 2... se ele tiver, pede logo 3, assim já fica pra mais tempo, pede 3 saquinho de sal, tá?. Anota bem! Ah! e aproveita também pra contar pro Seo Zé aí que a festa tá boa e que veio gente até da cidade na festa.</dialogo>
		</dialogos>
	</questao>
</questoes>

			]]> ).toString();
			
			questoesEpisodio[5] = (<![CDATA[
<questoes>
	<questao>
		<enunciado>Você concorda comigo, não é?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Não. Não há nada que justifique a ideia de que negros são inferiores aos brancos.</alternativa>
			<alternativa>Sim. Os negros são inferiores aos brancos do ponto de vista intelectual, físico e emocional.</alternativa>
			<alternativa>Em termos. Apenas as mulheres negras são inferiores aos brancos, pois são fisicamente mais fracas.</alternativa>
			<alternativa>Não. Os brancos só são superiores se são da raça ariana, ou seja, da raça indoeuropeia.</alternativa>
			<alternativa>Em termos. No passado, os negros eram inferiores e por isso eram escravos, mas hoje evoluíram.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Muito bem! Nada justifica a discriminação.</feedback>
			<feedback>Tente outra vez! Não há nenhuma evidência de que os negros sejam inferiores aos brancos do ponto de vista intelectual, físico e emocional. Isso é puro preconceito!</feedback>
			<feedback>Tente outra vez! Aqui há um duplo preconceito: contra os negros e contra as mulheres. Não há nenhuma evidência de que os negros sejam inferiores aos brancos do ponto de vista intelectual, físico e emocional. E eventuais diferenças físicas entre homens e mulheres não podem ser motivo de discriminação.</feedback>
			<feedback>Tente outra vez! Não há nenhuma evidência de que os brancos sejam superiores sob qualquer do ponto de vista. A suposta superioridade da raça ariana é um mito errôneo e discriminatório propagado por Hitler e pelos adeptos do nazismo. Mas é puro preconceito!</feedback>
			<feedback>Tente outra vez! Os negros foram escravizados por motivações econômicas e políticas. Os povos que os escravizaram utilizavam como justificativa uma suposta inferioridade dos negros. Mas isso é puro preconceito!</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>chapeu</premio>
		<respcorreta>0</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
			<dialogo pers="Auxiliadora" contra="Dona_Socorro_Dores">Vocês reclamam do tempo da escravidão, porque não percebem que os negros são naturalmente inferiores aos brancos.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Você concorda comigo, não é?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. Quem não sabe ler tem dificuldades para pensar corretamente.</alternativa>
			<alternativa>Não. Saber ler é importante, mas não torna ninguém superior aos outros. </alternativa>
			<alternativa>Em termos. Só os analfabetos negros são inferiores às pessoas capazes de ler.</alternativa>
			<alternativa>Não. Somente os homens instruídos e ricos são superiores; os pobres são inferiores.</alternativa>
			<alternativa>Em termos. Só as mulheres analfabetas são inferiores às pessoas capazes de ler.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Não há nenhuma evidência de que os iletrados tenham problemas para pensar. Isso é puro preconceito!</feedback>
			<feedback>Muito bem! A leitura dá acesso a informações e bens culturais importantes e é fundamental para o exercício da cidadania. Mas nada justifica a diferenciação dos seres humanos em superiores e inferiores.</feedback>
			<feedback>Tente outra vez! Aqui há um duplo preconceito: contra negros e contra analfabetos. Não há nenhuma evidência de que negros iletrados sejam inferiores a brancos analfabetos. Tampouco há qualquer evidência de que os iletrados sejam inferiores às pessoas capazes de ler. Isso é puro preconceito!</feedback>
			<feedback>Tente outra vez! Riqueza e instrução não devem ser motivo para inferiorizar os outros. Isso é puro preconceito!</feedback>
			<feedback>Tente outra vez! Aqui há um duplo preconceito: contra os iletrados e contra as mulheres. Não há nenhuma evidência de que mulheres iletradas sejam diferentes de homens analfabetos. Tampouco há qualquer evidência de que os iletrados sejam inferiores às pessoas capazes de ler. Além disso, eventuais diferenças entre homens e mulheres não são motivo para discriminação. Isso é puro preconceito!</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>chapeupalha</premio>
		<respcorreta>1</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Auxiliadora" contra="Dona_Socorro_Dores">Aqui na fazenda tem muita gente analfabeta e isso é triste. Os alfabetizados são gente superior a nós.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Você concorda comigo, não é?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. As mulheres são inferiores aos homens do ponto de vista intelectual, físico e emocional.</alternativa>
			<alternativa>Em termos. As mulheres negras são inferiores aos homens, mas as brancas são iguais a eles.</alternativa>
			<alternativa>Não. Não há nada que justifique a ideia de que as mulheres são inferiores.</alternativa>
			<alternativa>Não. Somente os homens instruídos são superiores, os analfabetos são iguais às mulheres.</alternativa>
			<alternativa>Em termos. Antigamente, as mulheres eram inferiores, mas evoluíram e se igualaram aos homens.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Mulheres e homens são diferentes, mas isso não deve ser motivo para discriminação.</feedback>
			<feedback>Tente outra vez! Aqui há um duplo preconceito: contra os negros e contra as mulheres. Não há nenhuma evidência de que mulheres negras sejam diferentes de mulheres brancas. E eventuais diferenças entre homens e mulheres não são motivo para discriminação. Isso é puro preconceito!</feedback>
			<feedback>Muito bem! Nada justifica a diferenciação dos seres humanos em superiores e inferiores. Você já sabe que eventuais diferenças entre homens e mulheres não são motivo para discriminação.</feedback>
			<feedback>Tente outra vez! Aqui há um duplo preconceito: contra os não instruídos e contra as mulheres. Ter instrução não é razão para inferiorizar os outros. E eventuais diferenças entre homens e mulheres não são motivo para discriminação. Isso é puro preconceito!</feedback>
			<feedback>Tente outra vez! No passado as mulheres eram tratadas como seres inferiores, embora não houvesse nenhuma evidência de que elas tivessem deficiências sob qualquer ponto de vista. Era puro preconceito!</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>flor</premio>
		<respcorreta>2</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Auxiliadora" contra="Dona_Socorro_Dores">Nós, mulheres, devemos obedecer aos homens, porque eles são naturalmente superiores a nós.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Você concorda comigo, não é?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. Os nordestinos são inferiores do ponto de vista intelectual, físico e emocional.</alternativa>
			<alternativa>Em termos. As mulheres nordestinas são inferiores, mas os homens são iguais aos outros brasileiros.</alternativa>
			<alternativa>Não. Os nordestinos instruídos são iguais aos demais, mas os pobres e analfabetos são inferiores.</alternativa>
			<alternativa>Não. As diferenças regionais não resultam em superioridade de uns sobre outros.</alternativa>
			<alternativa>Em termos. Antigamente, os nordestinos eram inferiores, mas evoluíram e se igualaram aos demais.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Não há nenhuma evidência de que nordestinos tenham deficiências sob qualquer ponto de vista. Isso é puro preconceito!</feedback>
			<feedback>Tente outra vez!  Aqui há um duplo preconceito: contra as mulheres e contra os nordestinos. Eventuais diferenças entre homens e mulheres não são motivo para discriminação. E não há nenhuma evidência de que nordestinos tenham deficiências sob qualquer ponto de vista. Isso é puro preconceito!</feedback>
			<feedback>Tente outra vez! Riqueza e instrução não devem ser motivo para inferiorizar os outros. Isso é puro preconceito!</feedback>
			<feedback>Muito bem! Nada justifica a diferenciação dos seres humanos em superiores e inferiores.</feedback>
			<feedback>Tente outra vez! Não há nenhuma evidência de que os nordestinos tenham sido inferiores aos demais em nenhuma época. Isso é puro preconceito!</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>pano</premio>
		<respcorreta>3</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Auxiliadora" contra="Dona_Socorro_Dores">Tenho vergonha de ser baiana porque nós, nordestinos, somos inferiores ao pessoal do Sul.</dialogo>
		</dialogos>
	</questao>
	
	<questao>
		<enunciado>Você concorda com isso?</enunciado>
		<textorelacionado></textorelacionado>
		<alternativas>
			<alternativa>Sim. Os brancos da raça ariana, ou seja, de raça indoeuropeia, são superiores aos judeus.</alternativa>
			<alternativa>Em termos. Apenas as mulheres judias são inferiores aos homens, pois são fisicamente mais fracas.</alternativa>
			<alternativa>Não. Apenas os arianos ricos e instruídos são superiores aos judeus.</alternativa>
			<alternativa>Em termos. Os judeus são inferiores aos brancos do ponto de vista intelectual, mas não físico.</alternativa>
			<alternativa>Não. Não há sustentação científica aceitável para a ideia de que há seres humanos superiores.</alternativa>
		</alternativas>
		<feedbacks>
			<feedback>Tente outra vez! Os nazistas, liderados por Hitler, tentaram difundir a ideia errônea de superioridade da raça ariana, a fim de justificar o extermínio de judeus. Esse foi um dos episódios mais vergonhosos da história da humanidade. Não há nenhuma evidência de que seja possível diferenciar os humanos por raças. Isso é puro preconceito!</feedback>
			<feedback>Tente outra vez! Aqui há um duplo preconceito: contra os judeus e contra as mulheres. Os nazistas, liderados por Hitler, tentaram difundir a ideia errônea de superioridade da raça ariana, a fim de justificar o extermínio de judeus. Esse foi um dos episódios mais vergonhosos da história da humanidade. E o fato de mulheres e homens serem diferentes não deve ser motivo para discriminação. Isso é puro preconceito!</feedback>
			<feedback>Tente outra vez! Aqui há um duplo preconceito: contra os judeus e contra os mais pobres. Os nazistas, liderados por Hitler, tentaram difundir a ideia errônea de superioridade da raça ariana, a fim de justificar o extermínio de judeus. Esse foi um dos episódios mais vergonhosos da história da humanidade. Além disso, riqueza e instrução não devem ser motivo para inferiorizar os outros. Isso é puro preconceito!</feedback>
			<feedback>Tente outra vez! Os nazistas, liderados por Hitler, tentaram difundir a ideia errônea de superioridade da raça ariana, a fim de justificar o extermínio de judeus. Esse foi um dos episódios mais vergonhosos da história da humanidade. Não há nenhuma evidência de que os judeus sejam inferiores às demais pessoas sob qualquer ponto de vista. Isso é puro preconceito!</feedback>
			<feedback>Muito bem! Os nazistas, liderados por Hitler, tentaram difundir a ideia errônea de superioridade da raça ariana, a fim de justificar o extermínio de judeus. Esse foi um dos episódios mais vergonhosos da história da humanidade. Mas você já sabe que nada justifica a diferenciação dos seres humanos em superiores e inferiores.</feedback>
		</feedbacks>
		<dica></dica>
		<valorpontos>120</valorpontos>
		<premio>tiara</premio>
		<respcorreta>4</respcorreta>
		 <dialogos>
			<quantidade>1</quantidade>
<dialogo pers="Auxiliadora" contra="Dona_Socorro_Dores">Ouvi no rádio que os alemães estão matando os judeus porque a raça deles é inferior.</dialogo>
		</dialogos>
	</questao>
</questoes>

			]]> ).toString();
	}

		
	}
}