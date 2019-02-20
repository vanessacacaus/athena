
/*****************************************************************
  BaseDados.as gerado por script desenvolvido por Bruno Milare  
  
  Jogo:
  Artes e escrita   

  Titulo:
  Imagens do Brasil 
Victor Meirelles e Cândido Portinari: interpretações
Artes e escrita 


  Creditos:
  Joice Mensato
Coordenação: Carmen Zink Bolonhini e Suzy Lagazzi


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
				<ajuda>Como se sabe, Victor Meirelles pintou o famoso quadro [i]A primeira Missa no Brasil[/i]. Ele se inspirou na descrição da cena feita por Pero Vaz de Caminha em sua carta ao Rei de Portugal anunciando a chegada ao Brasil.</ajuda>
				<intro>
					<texto>Victor Meirelles lendo: Lê Caminha, ó artista, marcha à glória/ Já que o céu te chamou Victor na terra/ Lê Caminha, pinta e então caminha.
</texto>
					<texto>Pedro: Carol, ele está contando a história de um artista que está caminhando, lendo e pintando ao mesmo tempo. 
Carolina: Não, Pedro, não acho que é isso que está acontecendo...
</texto>
					<texto></texto>
				</intro>
				
				<questoes>
			<questao>
				<enunciado>Para que Caminha possa ser interpretado como um verbo, assim como Pedro o fez, a frase teria a seguinte escrita</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa  valor="correta">
						<texto>Lê, caminha, ó artista, marche à glória.</texto>
						<feedback>É isso aí! Para que caminha possa ser interpretado como a conjugação do verbo caminhar, ele precisaria ser grafado com letra minúscula e vir após uma vírgula.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>Lê Caminha, ó artista, marche à glória.</texto>
						<feedback>Tente mais uma vez. Lembre-se que a escrita tem uma regra específica para nomes próprios. Para que caminha possa ser interpretado como a conjugação do verbo caminhar, ele precisaria ser grafado com letra minúscula e vir após uma vírgula.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>Caminha lê A Marcha da Glória com o artista. </texto>
						<feedback>Tente mais uma vez. Lembre-se que a escrita tem uma regra específica para nomes próprios. Para que caminha possa ser interpretado como a conjugação do verbo caminhar, ele precisaria ser grafado com letra minúscula e vir após uma vírgula.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>Ó artista, leia Caminha, marche à glória.</texto>
						<feedback>Tente mais uma vez. Lembre-se que a escrita tem uma regra específica para nomes próprios. Para que caminha possa ser interpretado como a conjugação do verbo caminhar, ele precisaria ser grafado com letra minúscula e vir após uma vírgula.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>Caminha lê o artista que marcha à glória.</texto>
						<feedback>Tente mais uma vez. Lembre-se que a escrita tem uma regra específica para nomes próprios. Para que caminha possa ser interpretado como a conjugação do verbo caminhar, ele precisaria ser grafado com letra minúscula e vir após uma vírgula.</feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>O enunciado [i]Lê Caminha, ó artista, marcha à glória/ Já que o céu te chamou Victor na terra/ Lê Caminha, pinta e então caminha[/i] tem um efeito metonímico acontecendo na palavra:</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>artista</texto>
						<feedback>Tente mais uma vez. A palavra [i]Caminha[/i] é o nome do autor da carta e, no contexto em questão, ela representa a carta.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>terra</texto>
						<feedback>Tente mais uma vez. A palavra [i]Caminha[/i] é o nome do autor da carta e, no contexto em questão, ela representa a carta.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>pinta</texto>
						<feedback>Tente mais uma vez. A palavra [i]Caminha[/i] é o nome do autor da carta e, no contexto em questão, ela representa a carta.</feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>Caminha</texto>
						<feedback>É isso aí! A palavra [i]Caminha[/i] é o nome do autor da carta e, no contexto em questão, ela representa a carta.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>caminha</texto>
						<feedback>Tente mais uma vez. A palavra [i]Caminha[/i] é o nome do autor da carta e, no contexto em questão, ela representa a carta.</feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>Para que Caminha possa ser interpretado como um verbo, assim como Pedro o fez, o enunciado teria a escrita [i]Lê, caminha, ó artista, marche à glória[/i]. A vírgula é importante, pois ela</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>separa parágrafos.</texto>
						<feedback>Tente mais uma vez. Na forma escrita do português, a vírgula, entre outras funções, separa termos que têm a mesma função no enunciado. No caso em questão, ela separaria dois verbos (ler e caminhar), que têm a função de descrever o que o pintor estaria fazendo.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>só separa substantivos.</texto>
						<feedback>Tente mais uma vez. Na forma escrita do português, a vírgula, entre outras funções, separa termos que têm a mesma função no enunciado. No caso em questão, ela separaria dois verbos (ler e caminhar), que têm a função de descrever o que o pintor estaria fazendo.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>separa o artigo do substantivo.</texto>
						<feedback>Tente mais uma vez. Na forma escrita do português, a vírgula, entre outras funções, separa termos que têm a mesma função no enunciado. No caso em questão, ela separaria dois verbos (ler e caminhar), que têm a função de descrever o que o pintor estaria fazendo.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>separa o adjetivo do substantivo.</texto>
						<feedback>Tente mais uma vez. Na forma escrita do português, a vírgula, entre outras funções, separa termos que têm a mesma função no enunciado. No caso em questão, ela separaria dois verbos (ler e caminhar), que têm a função de descrever o que o pintor estaria fazendo.</feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>separa termos com a mesma função.</texto>
						<feedback>É isso aí! Na forma escrita do português, a vírgula, entre outras funções, separa termos que têm a mesma função no enunciado. No caso em questão, ela separaria dois verbos ( ler e caminhar), que têm a função de descrever o que o pintor estaria fazendo.</feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>No enunciado [i]Lê Caminha, ó artista, marche à glória[/i],</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>Caminha é o artista.</texto>
						<feedback>Tente mais uma vez. De acordo com a gramática tradicional, Caminha é o objeto direto do verbo [i]ler[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>Caminha vai marchar à glória.</texto>
						<feedback>Tente mais uma vez. De acordo com a gramática tradicional, Caminha é o objeto direto do verbo [i]ler[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>Caminha é o lugar para onde o artista marchará.</texto>
						<feedback>Tente mais uma vez. De acordo com a gramática tradicional, Caminha é o objeto direto do verbo [i]ler[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>Caminha está lendo.</texto>
						<feedback>Tente mais uma vez. De acordo com a gramática tradicional, Caminha é o objeto direto do verbo [i]ler[/i]. </feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>Caminha é o autor do livro que está sendo lido pelo artista.</texto>
						<feedback>É isso aí! De acordo com a gramática tradicional, Caminha é o objeto direto do verbo [i]ler[/i].</feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado></enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa  valor="correta">
						<texto></texto>
						<feedback></feedback>
					</alternativa>
					
					<alternativa >
						<texto></texto>
						<feedback></feedback>
					</alternativa>
					
					<alternativa >
						<texto></texto>
						<feedback></feedback>
					</alternativa>
					
					<alternativa >
						<texto></texto>
						<feedback></feedback>
					</alternativa>
					
					<alternativa >
						<texto></texto>
						<feedback></feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
		
		</questoes>
		</jogo>
		
		]]> ).toString();
		}
	}
}