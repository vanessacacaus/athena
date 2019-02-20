
/*****************************************************************
  BaseDados.as gerado por script desenvolvido por Bruno Milare  
  
  Jogo:
  Ortografia   

  Titulo:
  Vozes da Cidade
Acontecimento Estranho
Ortografia



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
				<ajuda>Observe o texto abaixo, redigido no dia 10 de novembro de 1575, por Franciso de Gouvea. O objetivo do texto foi o de aprovar a publicação do livro de Gândavo a respeito do Brasil, intitulado História da Província Santa Cruz. Como vocês sabem, era a época da Inquisição e apenas livros aprovados pelos Inquisitores podiam ser publicados.

                                [i] APROVAÇAM
Li a presente obra de Pero de Magalhães, por mandado dos Senhores do Conselho geral da Inquiziçam, e nam tem cousa que seja contra nossa Santa Fee catholica, nem os bons costumes, antes muitas, muito pera ler, oje dez de Novembro de 1575.-- Francisco de Gouvea.[/i]</ajuda>
				<intro>
					<texto>Os professores de Língua Portuguesa falam muito sobre a reforma ortográfica. Mas essa não é a primeira vez que há mudanças na escrita do português. Desde 1907, até hoje, já houve muitas reformas e muitas tentativas de unificação da escrita do português nos países lusófonos. </texto>
					<texto>Em nosso país, temos uma ortografia oficial, ou seja, temos uma forma considerada correta para se escrever as palavras. No entanto, a escrita do Português sofreu muitas modificações ao longo dos tempos. </texto>
					<texto></texto>
				</intro>
				
				<questoes>
			<questao>
				<enunciado>Comparando a escrita do século XVI com a escrita de hoje, tal qual ela se apresenta no texto abaixo,
                                [i] APROVAÇAM
Li a presente obra de Pero de Magalhães, por mandado dos Senhores do Conselho geral da Inquiziçam, e nam ....“[/i]
podemos dizer que</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>houve mudanças no uso da ç</texto>
						<feedback>Cuidado. As palavras, que no texto estão escritas com final [i]am[/i], ou seja, [i]APROVAÇAM[/i], [i]Inquiziçam[/i] e [i]nam[/i], são hoje escritas com [i]ão[/i], ou seja, [i]aprovação[/i], [i]Inquizição[/i] e [i]não[/i].</feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>houve mudanças no uso do ão</texto>
						<feedback>Muito bem! As palavras, que no texto estão escritas com final [i]am[/i], ou seja, [i]APROVAÇAM[/i], [i]Inquiziçam[/i] e [i]nam[/i], são hoje escritas com [i]ão[/i], ou seja, [i]aprovação[/i], [i]Inquizição[/i] e [i]não[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>houve mudanças no uso do qu</texto>
						<feedback>Cuidado. As palavras, que no texto estão escritas com final [i]am[/i], ou seja, [i]APROVAÇAM[/i], [i]Inquiziçam[/i] e [i]nam[/i], são hoje escritas com [i]ão[/i], ou seja, [i]aprovação[/i], [i]Inquizição[/i] e [i]não[/i].</feedback>
					</alternativa>
					
					<alternativa >
						<texto>houve mudanças no uso do lh</texto>
						<feedback>Cuidado. As palavras, que no texto estão escritas com final [i]am[/i], ou seja, [i]APROVAÇAM[/i], [i]Inquiziçam[/i] e [i]nam[/i], são hoje escritas com [i]ão[/i], ou seja, [i]aprovação[/i], [i]Inquizição[/i] e [i]não[/i].</feedback>
					</alternativa>
					
					<alternativa >
						<texto>houve mudanças no uso do nh</texto>
						<feedback>Cuidado. As palavras, que no texto estão escritas com final [i]am[/i], ou seja, [i]APROVAÇAM[/i], [i]Inquiziçam[/i] e [i]nam[/i], são hoje escritas com [i]ão[/i], ou seja, [i]aprovação[/i], [i]Inquizição[/i] e [i]não[/i].</feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>Continuando com a comparação da escrita do século XVI com a escrita de hoje, tal qual ela se apresenta no texto de Pero de Magalhães Gândavo, observe a frase: [i]Reinando aquelle mui Catholico e Serenissimo Principe El Rey Dom Manuel, fez-se huma frota para a India, de que ia por Capitam mór Pedralvarez Cabral, que foi a segunda navegaçam que fizerão os Portuguezes para aquellas partes do Oriente.[/i] Hoje em dia, não temos mais, em Português, a escrita de:</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>[i]rr[/i]</texto>
						<feedback>Cuidado. Na escrita atual do Português, temos [i]ss[/i], como em [i]pássaro[/i]; [i]rr[/i], como em [i]barreira[/i]; [i]fr[/i], como em [i]frota[/i]; [i]pr[/i], como em [i]príncipe[/i]. No entanto, não existe [i]ll[/i]. A grafia de [i]aquelle[/i], mudou para [i]aquele[/i] e a grafia de [i]aquella[/i] mudou para [i]aquela[/i].   </feedback>
					</alternativa>
					
					<alternativa >
						<texto>[i]ss[/i]</texto>
						<feedback>Cuidado. Na escrita atual do Português, temos [i]ss[/i], como em [i]pássaro[/i]; [i]rr[/i], como em [i]barreira[/i]; [i]fr[/i], como em [i]frota[/i]; [i]pr[/i], como em [i]príncipe[/i]. No entanto, não existe [i]ll[/i]. A grafia de [i]aquelle[/i], mudou para [i]aquele[/i] e a grafia de [i]aquella[/i] mudou para [i]aquela[/i]. </feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>[i]ll[/i]</texto>
						<feedback>Muito bem! Na escrita atual do Português, temos [i]ss[/i], como em [i]pássaro[/i]; [i]rr[/i], como em [i]barreira[/i]; [i]fr[/i], como em [i]frota[/i]; [i]pr[/i], como em [i]príncipe[/i]. No entanto, não existe [i]ll[/i]. A grafia de [i]aquelle[/i], mudou para [i]aquele[/i] e a grafia de [i]aquella[/i] mudou para [i]aquela[/i].   </feedback>
					</alternativa>
					
					<alternativa >
						<texto>[i]fr[/i]</texto>
						<feedback>Cuidado. Na escrita atual do Português, temos [i]ss[/i], como em [i]pássaro[/i]; [i]rr[/i], como em [i]barreira[/i]; [i]fr[/i], como em [i]frota[/i]; [i]pr[/i], como em [i]príncipe[/i]. No entanto, não existe [i]ll[/i]. A grafia de [i]aquelle[/i], mudou para [i]aquele[/i] e a grafia de [i]aquella[/i] mudou para [i]aquela[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>[i]pr[/i]</texto>
						<feedback>Cuidado. Na escrita atual do Português, temos [i]ss[/i], como em [i]pássaro[/i]; [i]rr[/i], como em [i]barreira[/i]; [i]fr[/i], como em [i]frota[/i]; [i]pr[/i], como em [i]príncipe[/i]. No entanto, não existe [i]ll[/i]. A grafia de [i]aquelle[/i], mudou para [i]aquele[/i] e a grafia de [i]aquella[/i] mudou para [i]aquela[/i]. </feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>Agora preste atenção no segmento seguir, que está escrito com os verbos no passado: [i]e os Indios da terra que ali se ajuntarão ouvirão tudo com muita quietaçam, usando de todos os actos e cerimonias que vião fazer aos nossos...[/i] Aqui você pode observar o uso do [i]ão[/i] nos verbos [i]ajuntarão[/i], [i]ouvirão[/i] e [i]vião[/i], mas que hoje em dia são escrito:</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>ajuntariam, ouviriam, veriam</texto>
						<feedback>Cuidado. Os verbos, que no texto estão escritos com final [i]ão[/i], ou seja, [i]ajuntarão[/i], [i]ouvião[/i] e [i]vião[/i], são hoje escritos com [i]am[/i], ou seja, [i]ajuntaram[/i], [i]ouviam[/i] e [i]viam[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>ajuntará, ouvirá, verá</texto>
						<feedback>Cuidado. Os verbos, que no texto estão escritos com final [i]ão[/i], ou seja, [i]ajuntarão[/i], [i]ouvião[/i] e [i]vião[/i], são hoje escritos com [i]am[/i], ou seja, [i]ajuntaram[/i], [i]ouviam[/i] e [i]viam[/i]. </feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>ajuntaram, ouviram, viam</texto>
						<feedback>Muito bem! Os verbos, que no texto estão escritos com final [i]ão[/i], ou seja, [i]ajuntarão[/i], [i]ouvião[/i] e [i]vião[/i], são hoje escritos com [i]am[/i], ou seja, [i]ajuntaram[/i], [i]ouviam[/i] e [i]viam[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>ajuntam, ouvem, veem</texto>
						<feedback>Cuidado. Os verbos, que no texto estão escritos com final [i]ão[/i], ou seja, [i]ajuntarão[/i], [i]ouvião[/i] e [i]vião[/i], são hoje escritos com [i]am[/i], ou seja, [i]ajuntaram[/i], [i]ouviam[/i] e [i]viam[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>ajuntassem, ouvissem, vissem</texto>
						<feedback>Cuidado. Os verbos, que no texto estão escritos com final [i]ão[/i], ou seja, [i]ajuntarão[/i], [i]ouvião[/i] e [i]vião[/i], são hoje escritos com [i]am[/i], ou seja, [i]ajuntaram[/i], [i]ouviam[/i] e [i]viam[/i]. </feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>As modificações na escrita também afetaram a acentuação. Observe o segmento: [i]Esta provincia Santa Cruz està situada naquella grande America, uma das quatro partes do mundo. Dista o seu principio dous graos da equinocial para a banda do Sul, e dahi se vai estendendo para o mesmo sul atè quarenta e cinco graos...[/i]
A crase, hoje em dia, é usada apenas quando houver contração da preposição a com a vogal:</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa  valor="correta">
						<texto>a</texto>
						<feedback>Muito bem! As palavras, que no texto estão escritas com crase, como [i]està[/i] e [i]atè[/i], hoje em dia são acentuadas [i]está[/i] e [i]até[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>e</texto>
						<feedback>Cuidado. As palavras, que no texto estão escritas com crase, como [i]està[/i] e [i]atè[/i], hoje em dia são acentuadas [i]está[/i] e [i]até[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>i</texto>
						<feedback>Cuidado. As palavras, que no texto estão escritas com crase, como [i]està[/i] e [i]atè[/i], hoje em dia são acentuadas [i]está[/i] e [i]até[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>o</texto>
						<feedback>Cuidado. As palavras, que no texto estão escritas com crase, como [i]està[/i] e [i]atè[/i], hoje em dia são acentuadas [i]está[/i] e [i]até[/i]. </feedback>
					</alternativa>
					
					<alternativa >
						<texto>u</texto>
						<feedback>Cuidado. As palavras, que no texto estão escritas com crase, como [i]està[/i] e [i]atè[/i], hoje em dia são acentuadas [i]está[/i] e [i]até[/i]. </feedback>
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