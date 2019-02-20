package{
	
	import flash.events.*
	import flash.net.*

	/**
	 * Classe ConjuntoQuestoes
	 *
	 * @author Victor Muniz Cezar
	 * @date 25/05/2009
	 */
	public class ConjuntoQuestoes{

	/**
	 * Variáveis mais abstratas
	 */
		public var q:Array = new Array(); // questões
		
		
		/**
		 * Construtor
		 *
		 * new ConjuntoQuestoes(tipo, episodio);
		 */
		public function ConjuntoQuestoes(i:int){
			if(i == 0){
				this.q.push(new Questao("O carro do Manuel enguiça e ele vai com o filho caçula no mecânico. Após verificar o motor do velho carro, o mecânico diz: “O problema está no freio. Vou ter que mexer no burrinho”. Manuel puxa o garoto para trás, alterado: “Não senhoire! No garoto ninguém mexe!”.",  "", "burrinho", 0, "O português interpreta uma palavra com um sentido completamente diferente do usado pelo mecânico (este se referia ao nome de uma peça) e o efeito disso é bem engraçado. À qual palavra estamos nos referindo"));
				this.q.push(new Questao("Uma loira maravilhosa está deitada na praia, com um bronzeado espetacular, que chama a atenção de todo mundo que passa. Uma mulher, invejando o bronzeado da loira, resolve abordá-la: “Por favor, qual o seu protetor?”. E a loira: “São Judas Tadeu”.", "", "protetor", 0, "A loira desconsidera completamente o contexto (está tomando sol na praia) e a resposta que ela dá é, no mínimo, inesperada: ela descobre um outro sentido para uma das palavras que aparece na fala da mulher que a abordou. Qual palavra é essa?"));
				this.q.push(new Questao("Qual é a diferença entre uma criança e um carpinteiro? Resposta: A criança adora uma mamadeira e um carpinteiro detesta uma má madeira.",  "", "mamadeira", 0, "A graça dessa piada está em uma sequência de sons, que pode ser lida como uma única palavra ou como duas palavras distintas. Qual sequência é essa?"));
				this.q.push(new Questao("Um cara diz, orgulhoso: \"Minha sogra é um anjo!\". O amigo observa: \"Você tem sorte, a minha ainda está viva!\"",  "", "anjo", 0, "Uma palavra que pode ter mais de um sentido é o segredo desta piada, que funciona com base em estereótipos negativos sobre as sogras. Descubra qual é essa palavra."));
				this.q.push(new Questao("Por que o português tem chulé no pé esquerdo? Resposta: Porque a mãe dele vive dizendo: \"Lava o pé direito, menino!”.",  "", "direito", 0, "Na fala da mãe, uma palavra é interpretada de forma inusitada pelo português – o que ajuda a estereotipá-lo como alguém nada inteligente. Qual palavra é essa?"));
				this.q.push(new Questao("Um bebê cai da janela de um prédio. Uma loira que ia passando pela calçada vê a criança caindo e imediatamente sai correndo e coloca-se bem debaixo do bebê, a tempo de ampará-lo em seus braços, conseguindo assim salvar a criança. A loira é aplaudida por todos que assistiram à cena. Um senhor não se contém e a elogia: “Puxa, parabéns! Que reflexo maravilhoso!”. E a loira: “Gostou? É Wellaton!”.",  "", "reflexo", 0, "A loira, ignorando o contexto (ela acabara de salvar uma criança graças à sua agilidade), interpreta equivocadamente a pergunta feita pelo senhor e dá uma resposta que achamos engraçada. Qual palavra, presente na fala do homem, foi responsável pelo equívoco da loira? (Lembre-se de que isso só aconteceu porque o contexto foi completamente desconsiderado por ela)."));
				this.q.push(new Questao("Uma loira comenta sua situação desesperadora com um amigo, freqüentador da Igreja Universal:\n- Estou numa maré de azar. Estou sem crédito na praça, devo para todo mundo! Não vejo solução, não tenho como pagar. Estou desempregada, sem dinheiro nenhum e cheia de carnês de várias lojas atrasados.\nAconselhada pelo amigo, a loira vai a um culto. Ela é, então, chamada ao palco, onde fica com outros desesperados. De repente, um pastor aproxima-se dela, coloca a mão direita em sua testa e começa a gritar:\n- Saia deste corpo, demônio! Desaloja! Este corpo não te pertence! Em nome de Jesus, afaste-se desta boa alma! \nO pastor passa a gritar ainda mais alto:\n- Estou ordenando! Em nome de Jesus, desaloja! Desaloja!\nE a loira:\n- Casas Bahia, Lojas Americanas, Ponto Frio Bonzão, C&A, Renner, Magazine Luíza...\n",  "", "desaloja", 0, "A loira não interpreta adequadamente a ordem dada pelo pastor e cita os nomes das lojas para as quais ela estava devendo dinheiro. Qual palavra possibilitou o equívoco?"));
				this.q.push(new Questao("Como é que se chama o elevador mais famoso de Salvador? Resposta: É só apertar o botão.",  "", "chama", 0, "Quando ouvimos a pergunta, pensamos que uma certa palavra e em um determinado sentido. Entretanto, a resposta nos mostra que estávamos equivocados: há um outro sentido para a palavra em questão – e que se encaixa coerentemente na pergunta da piada. À que palavra estamos nos referindo?"));
				this.q.push(new Questao("Numa festa o secretário do presidente fila um cigarro. O presidente comenta: - Não sabia que você fumava. - Eu fumo, mas não trago. - Pois devia trazer.",  "", "trago", 0, "O comentário do presidente evidencia que ele descobriu um outro sentido possível para uma das palavras que aparece na fala do secretário. Qual palavra é essa?"));
				this.q.push(new Questao("Dois amigos conversando: \n- Meu pai morreu ontem.\n- Puxa, meus sentimentos... Ele morreu do quê?\n- Foi por causa de uma latinha.\n- De uma latinha?!!\n- É. Ele estava passando o feriado na praia. Foi nadar, pensou que naquela região não havia tubarão, mas lá tinha.\n",  "", "latinha", 0, "Qual palavra, que pode ser dividida em mais de uma (com outro sentido, evidentemente) é o gatilho dessa piada?"));
		
			}else if(i == 1){
				this.q.push(new Questao("“Um gago pergunta para um português:\n- O se-se-senhor po-po-pode me inf-for-for-mar o-onde t-t-tem esco-co-cola pra pra ga-ga-gago?\nE o português responde:\n - Mas pra quê, se você gagueja tão bem?”\n",  "", "escola pra gago", 0, ""));
				this.q.push(new Questao("A loira vai fazer curso de catequese. Numa das aulas, o padre lhe pergunta:\n- Quem foi o primeiro homem?\nE a loira:\n- Ai... Prefiro não dizer!\n",  "", "primeiro homem", 0, ""));
				this.q.push(new Questao("“No consultório médico: \n- Doutor, um cego quer ver o senhor. \n- Diz pra ele que eu não faço milagres.”\n",  "", "ver", 0, ""));
				this.q.push(new Questao("“Numa festa, Pedro quer levar seu amigo Zeca, que bebeu muito, para casa.\n- Zeca, vamos tomar um táxi? \n- Não, cara, hoje não quero misturar mais nada.”\n",  "", "tomar", 0, ""));
				this.q.push(new Questao("“- Qual é o símio mais tecnológico de todos?”\n- ?\nO chipanzé",  "", "chipanzé", 0, "O início de seu nome coincide com o nome de peças de computadores"));
				this.q.push(new Questao("“Um cara chegou no trabalho todo de porre e trançando as pernas. Então, o chefe dele falou:\n- Hei, que história é essa de vir trabalhar neste estado?\nE o bêbado respondeu:\n- A culpa é do Doutor. Foi o Doutor que fez isso.\n- Mas como assim? O médico?\n- Eu fui no doutor, ele me examinou, e disse que era pra comprar uns negócios e escreveu tudo num papel. Eu não entendi muita coisa. Era uma letra ruim, mas li lá embaixo dos garranchos: \"E pinga 3 vezes ao dia\".”\n",  "", "pinga", 0, "A palavra pode ser verbo ou substantivo"));
				this.q.push(new Questao("“O português está viajando pela Dutra quando vê uma loira de minissaia pedindo carona. Ele pára o carro.\n— Para onde você está indo? — pergunta ela.\n— Para São José dos Campos!\nEla sobe no carro e os dois começam a bater papo.\nAlgum tempo depois, num ato de extrema coragem, o português consegue vencer a timidez e pousa suavemente a mão nas pernas da moça.\nEla olha para ele com um sorriso malicioso e diz:\n— Se quiser ir mais longe eu, não me importo!\nE ele foi até o Rio de Janeiro!”\n",  "", "ir mais longe", 0, ""));
				this.q.push(new Questao("Doutor, todas as noites eu vejo crocodilos azuis.\n— Você já viu um psicólogo?\n— Não, não. Só crocodilos azuis.\n",  "", "viu", 0, ""));
				this.q.push(new Questao("Um bêbado tinha acabado de sair do bar e ia atravessar a rua com o farol aberto para os carros quando chegou um fusca e buzinou:\n— Bibi!\nE o bêbado respondeu:\n— Eu também bibi, companheiro!\n",  "", "bibi", 0, ""));
				this.q.push(new Questao("Um bêbado chega até uma esquina onde acaba de haver um acidente de trânsito e pergunta a um dos curiosos, aglomerados ali: - Que aconteceu? Por que esse cara tá caído aí no chão?- Foi uma batida! Foi uma batida! - Batida, é? Tá vendo só? É por isso que eu só gosto de tomar pura...",  "", "batida", 0, ""));
				

			}else{
				this.q.push(new Questao("- O senhor precisa me dar um aumento – disse o empregado ao chefe.  Existem duas ou três companhias atrás de mim.\n- É mesmo? – surpreendeu-se o chefe. E que companhias são essas?\n- A companhia de luz, de água, de telefone.", "", "atrás de mim", 0, ""));
 				this.q.push(new Questao("No meio da rua, o bêbado é abordado por uma moça de cabelos bem longos: \n- Você quer ser testemunha de Jeová? – pergunta ela, fervorosa.\n- Mar por quê? – pergunta o bêbado, cambaleando – Vai me dizer que ele tá sendo processado?\n",  "", "testemunha", 0, ""));
				this.q.push(new Questao("Da porta da barbearia, o freguês grita para o barbeiro:\n- Vicente, acabo de ver tua mulher com outro homem!\nImediatamente, o barbeiro corre até a sua casa, que fica ali perto. Pouco depois, volta reclamando:\n- Perdi tempo à toa. Ela não estava com outro homem. Era o mesmo de sempre.\n",  "", "outro", 0, ""));
				this.q.push(new Questao("No restaurante, o garçom pergunta ao freguês:\n- E então, como achou o bife?\n- Como achei? Por acaso. Fui comer uma batata e vi que ele estava embaixo.\n",  "", "achou", 0, ""));
				this.q.push(new Questao("Quando Costa e Silva era candidato à Presidência da República, um jornalista lhe perguntou: \n- Se houver adversário, o senhor disputa?\n- Digo!\n",  "", "disputa", 0, "a sequência pode ser uma palavra ou serem duas"));
				this.q.push(new Questao("Entrevista com um diretor:\n- Quantos pessoas estudam nesta escola?\n- Calculo que uns dois terços...\n",  "", "estudam", 0, ""));
				this.q.push(new Questao("O português vem andando pela rua quando se depara com uma placa, na porta de um chaveiro: TROCAM-SE SEGREDOS. Ele entra e cochicha no ouvido do chaveiro:\n- Eu sou gay. E tu?\n",  "", "segredos", 0, ""));
				this.q.push(new Questao("Notícia de telejornal português: “Governo informa que vai trazer capitais do exterior”. O Manoel comenta:\n- E onde é que vão botar essa gente toda de Londres, Tóquio, Paris?\n",  "", "capitais", 0, ""));
				this.q.push(new Questao("Manoel faz uma ligação telefônica:\n- Alô! É da Varig? Por favoire, eu queria sabeire o tempo de duração do vôo São Paulo-Lisboa.\n- Um minutinho...\n- Ah! Está bem, obrigado.\n",  "", "um minutinho", 0, ""));
				this.q.push(new Questao("- Brito, meu relógio caiu no chão e parou.\n- E você queria que ele saísse andando?\n",  "", "parou", 0, ""));
			}//if
		}//function
		
		
		public function shuffle(startIndex:int = 0, endIndex:int = 0):void{
			if(endIndex == 0) endIndex = this.q.length-1;
			for (var i:int = endIndex; i>startIndex; i--) {
				var randomNumber:int = Math.floor(Math.random()*endIndex)+startIndex;
				var tmp:* = this.q[i];
				this.q[i] = this.q[randomNumber];
				this.q[randomNumber] = tmp;
			}
		}//function
			
		
		
		
	}//class
}//package