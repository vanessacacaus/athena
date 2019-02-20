
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
						<enunciado>Se o bilhete escrito por sua mãe começasse com “Como é cesta”, a frase teria um sentido __________.</enunciado>
						<dica>Sexta feira, dia da semana, e cesta, um utensílio para carregar objetos.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>diferente</resposta>
					</questao>
					
					<questao>
						<enunciado>“Sexta”, “cesta” e “sesta”. São palavras que, dependendo da região do país, possuem uma _________ muito semelhante.</enunciado>
						<dica>Fale as palavras em voz alta e veja se encontra semelhanças.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>pronúncia</resposta>
					</questao>
					
					<questao>
						<enunciado>Diversos são os motivos para se aprender ________. No caso do bilhete, ela serviu para dar a precisão que a mensagem precisava.</enunciado>
						<dica>Sem os conhecimentos necessários de ortografia, não haveria como transmitir a mensagem sem gerar dúvida.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>ortografia</resposta>
					</questao>
					
					<questao>
						<enunciado>O conhecimento de ________ também é importante. A palavra “sesta” é o sono de curta duração após o almoço.</enunciado>
						<dica>A valorização e o conhecimento da língua ajudam inclusive na conclusão desses exercícios. </dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>vocabulário</resposta>
					</questao>
					
					<questao>
						<enunciado>“levamos a cesta ao mercado” teria um ________ completamente diferente de “levamos às sextas ao mercado”</enunciado>
						<dica>Pense no sentido das frases.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>sentido</resposta>
					</questao>
					
					<questao>
						<enunciado>Para auxiliar em uma dúvida de ortografia, ajudaria muito estudar alguns radicais e regras de ________. </enunciado>
						<dica>As regras são importantes para o estabelecimento da relação entre as palavras de um enunciado. </dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>acentuação</resposta>
					</questao>
					
					<questao>
						<enunciado>“porque não queríamos atrapalhar sua sexta”, apesar de outro sentido, a frase ainda seria ________.</enunciado>
						<dica>A coerência evita a ocorrência do absurdo no texto.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>coerente</resposta>
					</questao>
					
					<questao>
						<enunciado>No jornal: “Oscar marca sua sexta cesta”. O sentido de ‘sexta’ e ‘cesta’ será diferente das _______ dos bilhetes.</enunciado>
						<dica>Embora a grafia, nesse caso seja a mesma daquela do bilhete, o sentido das palavras é outro.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>palavras</resposta>
					</questao>
					
					<questao>
						<enunciado>Nos casos de grafias iguais é necessário ter um conhecimento do________. </enunciado>
						<dica>É o contexto que define os sentidos.</dica>
						<fbcorreta>Correto !</fbcorreta>
						<fbincorreta>Incorreto !</fbincorreta>
						<resposta>contexto</resposta>
					</questao>
				
		
		</questoes>
		</jogo>
		
		]]> ).toString();
		}
	}
}