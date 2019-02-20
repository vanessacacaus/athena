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
				this.q.push(new Questao("A frase da placa “Existo porque insisto” faz referência a “ ______, logo existo” ",  "penso", "", "", "", 1, 1));
				this.q.push(new Questao("Na frase \"Em terra de cego, quem tem um olho é caolho\" o complemento certo seria? ", "rei", "", "",  ".", 1, 1));
				this.q.push(new Questao("“Existe vida após o casamento, só que ninguém prova.”. A frase normalmente falada é “Existe vida após a _________”.",  "morte", "", "", "", 1, 1));
				this.q.push(new Questao("“Se não puder ajudar, __________atrapalhe, afinal o importante é  participar.”. \nPara transformar essa frase na máxima que conhecemos falta uma palavra. Qual seria?",  "não", "", "", "", 1, 1));
				this.q.push(new Questao("“Família que reza unida, é religiosa pacas.”. Essa frase é uma alteração de “Família_______ permanece _______”. Qual é a palavra que falta?",  "unida", "", "", "", 1, 1));
				this.q.push(new Questao("Na frase “Não sou orquestra, mas vivo no conserto.” A palavra conserto remete a dois significados. Qual é o nome do local que ocorre um conserto?",  "oficina", "", "", "", 1, 1));
				this.q.push(new Questao("Na frase “Não sou detetive, mas só ando na pista” dê um possível sinônimo para a palavra \"pista\".",  "rodovia", "", "", "", 1, 1));
				this.q.push(new Questao("Quais palavras são formadas pela leitura do som do número em: “70 me passar, passe sem atrapalhar.”.",  "cê tenta", "", "", "", 1, 1));
				this.q.push(new Questao("“100 você, não sei viver”. Qual a palavra é formada pelo som do número 100? ",  "sem", "", "", "", 1, 1));
				this.q.push(new Questao("“80ção, vim te ver.” A leitura do número forma o som de algumas palavras. Quais são elas?",  "oi tentação", "", "", "", 1, 1));
				
			}else if(i == 1){
				
				this.q.push(new Questao("Complete a frase com uma catacrese. “Vou ligar para Carol. Vou usar o ________ aqui da rua.", "orelhão", "","","", 1, 1));
				this.q.push(new Questao("Quando queremos dizer que sabemos guardar segredo, usamos como metáfora a expressão “minha boca é um ________.", "túmulo", "","","", 1, 1));
				this.q.push(new Questao("Ouro negro é também conhecido como ________.", "petróleo", "","","", 1, 1));
				this.q.push(new Questao("Outro nome para céu da boca é______.", "palato", "","","", 1, 1));
				this.q.push(new Questao("Dê o significado da metáfora “Um cardume de barcos chegou no porto”", "vários", "","","", 1, 1));
				this.q.push(new Questao("Dê o sinônimo de “Eu não lembro”.", "esqueci", "","","", 1, 1));
				this.q.push(new Questao("Ele não é uma pessoa amistosa, ele é _________.", "hostil", "","","", 1, 1));
				this.q.push(new Questao("Ela está cuspindo fogo pela boca, ela está _______.", "furiosa", "","","", 1, 1));
				this.q.push(new Questao("Naquele dia chorei lágrimas de sangue, eu _________.", "sofri", "","","", 1, 1));
				this.q.push(new Questao("Você não é tão bobo assim, até que você é _________.", "esperto", "","","", 1, 1));
				
				
			}else{
				this.q.push(new Questao("Substitua a palavra entre aspas por um sinônimo: O motivo da guerra foi a disputa pela \"coroa\"", "poder" , "", "","", 1,1));
				this.q.push(new Questao("Ele \"tem uma ótima cabeça\". É possível substituir a expressão entre aspas por?", "inteligente" , "", "","", 1,1));
				this.q.push(new Questao("“O homem viajou de foguete”. Na frase, quem realmente viajou de foguete?", "astronautas" , "", "","", 1,1));
				this.q.push(new Questao("Aquela família ficou sem \"teto\". Qual outra palavra que podemos colocar no lugar da destacada e não muda seu sentido?", "casa" , "", "","", 1,1));
				this.q.push(new Questao("“Graham Bell aproximou as pessoas”. O que realmente aproximou as pessoas, segundo a frase.", "telefone" , "", "","", 1,1));
				this.q.push(new Questao("Assim como no caso de Carolina, a quem chamamos de Carol, os _______ passam a impressão de proximidade e, até mesmo, de intimidade com as pessoas.", "apelidos" , "", "","", 1,1));
				this.q.push(new Questao("Quando dizemos: Carregamos \"umas\" laranjas naquela manhã, o artigo ______ nos diz que as laranjas carregadas não eram laranjas específicas e, sim, quaisquer laranjas.", "indefinido" , "", "","", 1,1));
				this.q.push(new Questao("Já, quando dizemos: “Carregamos as laranjas do seu Zé naquela manhã”, o artigo _______ nos mostra que se trata de laranjas específicas: as do seu Zé.", "definido" , "", "","", 1,1));
				this.q.push(new Questao("Na expressão \"placas de caminhão\", a partícula \"de\" indica que não se trata de quaisquer placas. Esta preposição, seguida de outro substantivo (\"caminhão\"), _______ as \"placas\".", "caracteriza" , "", "","", 1,1));
				this.q.push(new Questao("Na expressão \"placas de caminhão\", a partícula \"de\" seguida de outro substantivo (caminhão), ao caracterizar placas, deixa também a entender que há __________ tipos de placas.", "diferentes" , "", "","", 1,1));

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