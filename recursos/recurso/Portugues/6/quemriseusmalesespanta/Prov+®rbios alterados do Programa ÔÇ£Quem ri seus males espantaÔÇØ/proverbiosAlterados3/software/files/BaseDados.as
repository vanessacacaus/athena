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
			<questao>
				<questao>
					<enunciado>Em terra de cego, quem tem um olho, emigra.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>cego</alternativa>
						<alternativa>quem tem olho</alternativa>
						<alternativa>emigra</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
			
				<questao>
					<enunciado>A pressa é inimiga da refeição.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>refeição</alternativa>
						<alternativa>pressa</alternativa>
						<alternativa>inimiga</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Quem diz o que quer, ouve voz de prisão.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>ouve</alternativa>
						<alternativa>voz de prisão</alternativa>
						<alternativa>quem diz o que quer</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Quem tem boca, vai a Roma, exilado. </enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>boca</alternativa>
						<alternativa>Roma</alternativa>
						<alternativa>exilado</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Miséria pouca é miragem.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>miséria</alternativa>
						<alternativa>miragem</alternativa>
						<alternativa>pouca</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
							
				<questao>
					<enunciado>Pense duas vezes antes de agitar.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>duas vezes</alternativa>
						<alternativa>antes</alternativa>
						<alternativa>agitar</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Quando um não quer, dois obrigam. </enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>quando</alternativa>
						<alternativa>um não quer</alternativa>
						<alternativa>obrigam</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Sol nasce para toldos.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>toldos</alternativa>
						<alternativa>nasce</alternativa>
						<alternativa>sol</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Quem vê carro não vê coração.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>não vê coração</alternativa>
						<alternativa>carro</alternativa>
						<alternativa>quem vê</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Penso, logo hesito.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>penso</alternativa>
						<alternativa>logo</alternativa>
						<alternativa>hesito</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Não adianta chorar sobre o leite desnatado.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>não adianta chorar</alternativa>
						<alternativa>leite</alternativa>
						<alternativa>desnatado</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Os últimos serão desclassificados.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>os últimos</alternativa>
						<alternativa>serão</alternativa>
						<alternativa>desclassificados</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Quem espera senta e cansa.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>senta e cansa</alternativa>
						<alternativa>quem</alternativa>
						<alternativa>espera</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Gato escaldado morre.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>morre</alternativa>
						<alternativa>escaldado</alternativa>
						<alternativa>gato</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>				
				
				<questao>
					<enunciado>Quem ama o feio, namora em casa.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>quem ama</alternativa>
						<alternativa>o feio</alternativa>
						<alternativa>namora em casa</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
			
				<questao>
					<enunciado>Alegria de pobre é impossível.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>alegria</alternativa>
						<alternativa>de pobre</alternativa>
						<alternativa>é impossível</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>A união faz o açúcar.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>a união</alternativa>
						<alternativa>faz</alternativa>
						<alternativa>o açúcar</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
					
				<questao>
					<enunciado>Roupa suja se lava na máquina.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>se lava</alternativa>
						<alternativa>na máquina</alternativa>
						<alternativa>roupa suja</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Em casa de ferreiro só tem ferro.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>ferreiro</alternativa>
						<alternativa>em casa de</alternativa>
						<alternativa>só tem ferro</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Quem não tem cão não caça.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>quem não</alternativa>
						<alternativa>tem cão</alternativa>
						<alternativa>não caça</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Antes tarde do que mais tarde.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>mais tarde</alternativa>
						<alternativa>antes tarde</alternativa>
						<alternativa>do que</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
				
							
				<questao>
					<enunciado>Quem ri por último é loira. </enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>quem ri</alternativa>
						<alternativa>é loira</alternativa>
						<alternativa>por último</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>É dando que se engravida.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>engravida</alternativa>
						<alternativa>é dando</alternativa>
						<alternativa>que se</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Quem dá aos pobres, empresta. Adeus! </enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>empresta</alternativa>
						<alternativa>quem dá</alternativa>
						<alternativa>adeus!</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Há males que vem para pior.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>há males</alternativa>
						<alternativa>pior</alternativa>
						<alternativa>que vem para</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Escreveu não leu, analfabeto.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>escreveu</alternativa>
						<alternativa>não leu</alternativa>
						<alternativa>analfabeto</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
				
				
				<questao>
					<enunciado>Quem tudo quer, tudo pede.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>quem</alternativa>
						<alternativa>pede</alternativa>
						<alternativa>tudo quer</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
			
				<questao>
					<enunciado>Águas passadas não dão cólera.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>águas</alternativa>
						<alternativa>não dão cólera</alternativa>
						<alternativa>passadas</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>1</respcorreta>
				</questao>
			
				<questao>
					<enunciado>Quem com ferro fere, vai preso.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>vai preso</alternativa>
						<alternativa>ferro fere</alternativa>
						<alternativa>quem com</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>0</respcorreta>
				</questao>
				
				<questao>
					<enunciado>Para tudo há remédio, menos para a mulher.</enunciado>
					<textorelacionado></textorelacionado>
					<alternativas>
						<alternativa>remédio</alternativa>
						<alternativa>para tudo</alternativa>
						<alternativa>mulher</alternativa>
					</alternativas>
					<feedbacks>
						<feedback></feedback>
						<feedback></feedback>
						<feedback></feedback>
					</feedbacks>
					<dica></dica>
					<valorpontos>1</valorpontos>
					<respcorreta>2</respcorreta>
				</questao>
			</questao>
			]]> ).toString();
		}	
	}
}