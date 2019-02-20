
/*****************************************************************
  BaseDados.as gerado por script desenvolvido por Bruno Milare  
  
  Jogo:
  Deslizes   

  Titulo:
  Vozes da Cidade
Acontecimento estranho
Deslizes

  Creditos:
  Adilson Ventura da Silva
Coordenação: Eduardo Guimarães


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
				<ajuda>Quando falamos e quando escrevemos, podemos cometer alguns pequenos lapsos e nem nos damos conta disso. No caso da fala, não podemos apagar o dito. Podemos apenas reformular o enunciado. No caso da escrita, a vantagem é podermos rever o texto, e reorganizálo para tentar retirar os deslizes cometidos. Por isso é importante, ao acabarmos de escrever qualquer texto, lê-lo novamente. </ajuda>
				<intro>
					<texto>Carol: Pedro, você já pensou que não podemos apagar o que dizemos, mas podemos apagar o que escrevemos? Você tem o hábito de revisar os textos que escreve?
Pedro: Eu não, para que fazer isso?
Carol: É um passo muito importante para escrever bem, pois aí podemos corrigir erros e reorganizar a escrita. </texto>
					<texto></texto>
					<texto></texto>
				</intro>
				
				<questoes>
			<questao>
				<enunciado>Ler atentamente um texto é importante para corrigir deslizes ocorridos na hora da escrita. Leia as frases a seguir e indique em qual delas há algo a ser corrigido:</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>Um aluno acertou todas as questões da prova.</texto>
						<feedback>Preste mais atenção. Leia novamente as frases.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>O aluno, que estava doente, foi embora mais cedo.</texto>
						<feedback>Preste mais atenção. Leia novamente as frases.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>A aluna não gostou da atitude do colega de sala.</texto>
						<feedback>Preste mais atenção. Leia novamente as frases.</feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>A professora ficou zangada com toda s sala.</texto>
						<feedback>Muito bem! Você notou que a letra [i]s[/i] foi digitada no lugar da letra [i]a[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>Aquele livro é muito bom.</texto>
						<feedback>Preste mais atenção. Leia novamente as frases.</feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>Muitas vezes, ao escrevermos, acontecem pequenos deslizes, que podem ser corrigidos com uma releitura do texto. Indique em qual enunciado abaixo ocorreu um deslize:</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>Estamos todos preparados para a prova.</texto>
						<feedback>Preste mais atenção. Leia novamente as frases.</feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>Todos estamos preparados para aa prova.</texto>
						<feedback>Muito bem! Você notou que a letra [i]a[/i] foi digitada duas vezes.  </feedback>
					</alternativa>
					
					<alternativa >
						<texto>A prova exige muito preparo.</texto>
						<feedback>Preste mais atenção. Leia novamente as frases.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>O preparo é importante para que a prova seja feita.</texto>
						<feedback>Preste mais atenção. Leia novamente as frases.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>É importante nos prepararmos para a prova.</texto>
						<feedback>Preste mais atenção. Leia novamente as frases.</feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>Em alguns contextos, a forma da escrita aceitável difere da forma padrão do português escrito. Por exemplo, [i]pq vc naum tah ...?[/i], no português padrão escrito seria:</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa  valor="correta">
						<texto>por que você não está ...?</texto>
						<feedback>Muito bem! O [i]internetês[/i] é bem diferente do português padrão escrito. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>por que cê não está ... ? </texto>
						<feedback>Preste mais atenção. O [i]internetês[/i] é bem diferente do português padrão escrito. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>por que cê não tá ...?</texto>
						<feedback>Preste mais atenção. O [i]internetês[/i] é bem diferente do português padrão escrito. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>por que você não tá ...?</texto>
						<feedback>Preste mais atenção. O [i]internetês[/i] é bem diferente do português padrão escrito. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>por que você naum está ...?  </texto>
						<feedback>Preste mais atenção. O [i]internetês[/i] é bem diferente do português padrão escrito. </feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>Escrever uma mensagem ou carta formal para o diretor da escola merece atenção especial. Dentre as propostas abaixo, qual seria a mais adequada?</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>Prezado diretor, você poderia abrir a biblioteca no domingo?</texto>
						<feedback>Preste mais atenção. Leia novamente as frases. Contextos formais, como escrever para o diretor da escola, exigem atenção especial. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>Prezado diretor, você abre a biblioteca no domingo?</texto>
						<feedback>Preste mais atenção. Leia novamente as frases. Contextos formais, como escrever para o diretor da escola, exigem atenção especial. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>Prezado diretor, você abriria a biblioteca no domingo?</texto>
						<feedback>Preste mais atenção. Leia novamente as frases. Contextos formais, como escrever para o diretor da escola, exigem atenção especial. </feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>Prezado diretor, o senhor poderia autorizar a abertura da biblioteca no domingo?</texto>
						<feedback>Muito bem! Contextos formais, como escrever para o diretor da escola, exigem atenção especial. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>Prezado diretor, o senhor abre a biblioteca no domingo?</texto>
						<feedback>Preste mais atenção. Leia novamente as frases. Contextos formais, como escrever para o diretor da escola, exigem atenção especial. </feedback>
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