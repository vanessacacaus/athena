
/*****************************************************************
  BaseDados.as gerado por script desenvolvido por Bruno Milare  
  
  Jogo:
  A coroa e a realeza   

  Titulo:
  Imagens do Brasil
Episódio 1: Gândavo e Pero Vaz de Caminha
A coroa e a realeza


  Creditos:
  Joice Mensato
Coordenação: Carmen Zink Bolonhini; Suzy Lagazzi


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
				<ajuda>Conforme já discutimos anteriormente, os sentidos de um objeto simbólico dependem de suas condições de produção, ou seja, do local, da pessoa e do tempo em que é feita a enunciação. Tratamos amplamente deste assunto no programa Imagens do Brasil. Em um episódio, coroa se refere, para Pedro, a uma mulher mais velha e, para Carolina, ao objeto que simboliza a realeza de Portugal. O episódio nos ensinou que os sentidos se produzem em interpretações determinadas pelo contexto em que acontecem. Dizemos que as condições de produção dos enunciados são determinantes das possibilidades de sua interpretação para os sujeitos. Ao se situar em sua época (século XXI) e não no século XVI, Pedro interpreta diferentemente de Carolina, cuja atenção está voltada para o contexto do século XVI.</ajuda>
				<intro>
					<texto>Carolina: Pedro, lembra quando estávamos na corte do Dom Sebastião e tivemos duas interpretações para a palavra [i]coroa[/i]?
Pedro: Lembro! Foi tão confuso tudo aquilo...</texto>
					<texto></texto>
					<texto></texto>
				</intro>
				
				<questoes>
			<questao>
				<enunciado>Em qual dos enunciados abaixo, a palavra [i]coroa[/i] remete à realeza?</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>Começa o jogo quem ganhar no cara ou coroa.</texto>
						<feedback>Não! Nesse caso, a palavra [i]coroa[/i] não foi usada como uma representação da realeza. Tente novamente...</feedback>
					</alternativa>
					
					<alternativa >
						<texto>Dizem que aquele bar é só para coroas.</texto>
						<feedback>Não! Nesse caso, a palavra [i]coroa[/i] não foi usada como uma representação da realeza. Tente novamente...</feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>Em 1808, a coroa portuguesa abandonou Portugal.</texto>
						<feedback>Muito bom! Você percebeu as diferentes possibilidades de sentidos para a palavra [i]coroa[/i] e encontrou a que se refere à realeza!</feedback>
					</alternativa>
					
					<alternativa >
						<texto>Vou falar com o coroa sobre isso.</texto>
						<feedback>Não! Nesse caso, a palavra [i]coroa[/i] não foi usada como uma representação da realeza. Tente novamente...</feedback>
					</alternativa>
					
					<alternativa >
						<texto>A coroa de flores foi enviada ao velório.</texto>
						<feedback>Não! Nesse caso, a palavra [i]coroa[/i] não foi usada como uma representação da realeza. Tente novamente...</feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>No enunciado [i]Em 1808, a coroa portuguesa abandonou Portugal[/i], a palavra [i]coroa[/i] remete à realeza por um:</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>efeito metafórico</texto>
						<feedback>Não! Observe que a palavra [i]coroa[/i], seguida do adjetivo [i]portuguesa[/i] representa, aqui, toda o grupo de pessoas que faziam parte da realeza. É um processo pelo qual uma palavra condensa e representa um todo do qual ela faz parte.</feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>efeito metonímico</texto>
						<feedback>Muito bom! A palavra [i]coroa[/i], seguida do adjetivo [i]portuguesa[/i] representa, aqui, todo o grupo de pessoas que faziam parte da realeza. É um processo pelo qual uma palavra condensa e representa um todo do qual ela faz parte.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>silenciamento</texto>
						<feedback>Não! Observe que a palavra [i]coroa[/i], seguida do adjetivo [i]portuguesa[/i] representa, aqui, toda o grupo de pessoas que faziam parte da realeza. É um processo pelo qual uma palavra condensa e representa um todo do qual ela faz parte.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>efeito de ironia</texto>
						<feedback>Não! Observe que a palavra [i]coroa[/i], seguida do adjetivo [i]portuguesa[/i] representa, aqui, toda o grupo de pessoas que faziam parte da realeza. É um processo pelo qual uma palavra condensa e representa um todo do qual ela faz parte.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>destaque</texto>
						<feedback>Não! Observe que a palavra [i]coroa[/i], seguida do adjetivo [i]portuguesa[/i] representa, aqui, toda o grupo de pessoas que faziam parte da realeza. É um processo pelo qual uma palavra condensa e representa um todo do qual ela faz parte.</feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>Em qual enunciado há um efeito metonímico acontecendo?</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>Ontem eu assisti Glauber Rocha.</texto>
						<feedback>Não! Nesse caso, [i]Glauber Rocha[/i] e [i]Portinari[/i] estão representando suas obras e [i]escola[/i] representa as pessoas que fazem parte dela.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>Um Portinari é muito valioso.</texto>
						<feedback>Não! Nesse caso, [i]Glauber Rocha[/i] e [i]Portinari[/i] estão representando suas obras e [i]escola[/i] representa as pessoas que fazem parte dela.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>A escola toda ficou comovida.</texto>
						<feedback>Não! Nesse caso, [i]Glauber Rocha[/i] e [i]Portinari[/i] estão representando suas obras e [i]escola[/i] representa as pessoas que fazem parte dela.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>Nenhuma das anteriores.</texto>
						<feedback>Não! Nesse caso, [i]Glauber Rocha[/i] e [i]Portinari[/i] estão representando suas obras e [i]escola[/i] representa as pessoas que fazem parte dela.</feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>Todas as anteriores.</texto>
						<feedback>Muito bom! [i]Glauber Rocha[/i] e [i]Portinari[/i] estão representando suas obras e [i]escola[/i] representa as pessoas que fazem parte dela.</feedback>
					</alternativa>
					
				</alternativas>
			</questao>
				
				
				
			
			<questao>
				<enunciado>O efeito metonímico da palavra [i]coroa[/i] no enunciado [i]Em 1808, a coroa portuguesa abandonou Portugal[/i] faz sentido porque ...</enunciado>
				<dica></dica>
				<alternativas>
			
					<alternativa >
						<texto>todos sabem que esse objeto foi trazido de Portugal para o Brasil nessa data.</texto>
						<feedback>Não! Lembre-se que um enunciado produz sentido porque está sempre relacionado a outros, anteriores.</feedback>
					</alternativa>
					
					<alternativa  valor="correta">
						<texto>há outros enunciados, já ditos anteriormente, que possibilitam essa interpretação.</texto>
						<feedback>Muito bom! Um enunciado produz sentido porque está sempre relacionado a outros, anteriores.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>uma pessoa mais velha saiu de Portugal nessa data.</texto>
						<feedback>Não! Lembre-se que um enunciado produz sentido porque está sempre relacionado a outros, anteriores.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>muitos portugueses abandonaram Portugal.</texto>
						<feedback>Não! Lembre-se que um enunciado produz sentido porque está sempre relacionado a outros, anteriores.</feedback>
					</alternativa>
					
					<alternativa >
						<texto>em 1808 o Brasil era colônia de Portugal.</texto>
						<feedback>Não! Lembre-se que um enunciado produz sentido porque está sempre relacionado a outros, anteriores.</feedback>
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