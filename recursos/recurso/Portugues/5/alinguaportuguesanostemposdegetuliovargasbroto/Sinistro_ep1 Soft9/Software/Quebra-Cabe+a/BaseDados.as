
/*****************************************************************
  BaseDados.as gerado por script desenvolvido por Bruno Milare  
  
  Jogo:
  Nome   

  Titulo:
  título

  Creditos:
  creditos

  Numero de Perguntas:
  4

  Numero de Alternativas::
  5
******************************************************************/
		
package{
	import flash.events.*
	import flash.net.*
			
	public class BaseDados{
			
	private static var questoes:String;
			
	public static function carrega(){
		carregaQuestoes();
	}
			
	public static function retornaXML():XML{
		return new XML(questoes);
	}
			
	public static function carregaQuestoes(){
		questoes = (<![CDATA[			
		<jogo>
				<ajuda>texto de ajuda</ajuda>
				<intro>
					<texto>texto de intro1</texto>
					<texto>texto de intro2</texto>
					<texto>texto de intro3</texto>
				</intro>
				
				<questoes>
					<questao>
						<enunciado>Nossa, o filho da vizinha é mesmo um ________.</enunciado>
						<dica>Pense bem: pode também ser um felino que sempre sobe no telhado.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>gato</resposta>
					</questao>
					
					<questao>
						<enunciado>Ouvi dizer que o Márcio é mesmo um ________.</enunciado>
						<dica>Também pode ser uma comida muito apreciada e feita de trigo.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>pão</resposta>
					</questao>
					
					<questao>
						<enunciado>Olha que mulher linda, é um verdadeiro ________.</enunciado>
						<dica>É também um meio de transporte.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>avião</resposta>
					</questao>
					
					<questao>
						<enunciado>Maria, de tão delicada, parece uma ________.</enunciado>
						<dica>Pode ser uma parte da planta que, normalmente, exala um cheiro bom.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>flor</resposta>
					</questao>
					
					<questao>
						<enunciado>Que gracinha seu filho, ele é mesmo um ________.</enunciado>
						<dica>Também se refere a alimentos feitos com bastante açúcar.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>docinho</resposta>
					</questao>
					
					<questao>
						<enunciado>É um ________, mesmo, essa criança.</enunciado>
						<dica>Em outro contexto, pode ser um alimento verde, considerado por muitos como ‘sem-graça’, sem gosto.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>chuchu</resposta>
					</questao>
					
					<questao>
						<enunciado>Sua filha é linda, parece, mesmo, uma ________.</enunciado>
						<dica>É também um brinquedo infantil.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>boneca</resposta>
					</questao>
					
					<questao>
						<enunciado>Ela adora criticar desrespeitosamente os outros, é como uma ________.</enunciado>
						<dica>Em outro contexto poderia ser um réptil que rasteja e é, muitas vezes, venenoso.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>cobra</resposta>
					</questao>
					
					<questao>
						<enunciado>Como esse menino fala! Ele é uma verdadeira ________.</enunciado>
						<dica>Pode também se referir a um instrumento musical bastante barulhento, usado também como sinalizador.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>matraca</resposta>
					</questao>
				
		
		</questoes>
		</jogo>
		
		]]> ).toString();
		}
	}
}