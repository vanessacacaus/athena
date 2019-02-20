var questoes;

// Lê o arquivo de dados e chama a inicialização do jogo.
function inicializar(){
    $.getJSON("js/questoes.json", function(formulario){
        inicializarJogo(formulario);
        $("#popupInstrucoes").load('items/instrucoes.html');
    });
}

// Realiza a inicialização do jogo.
function inicializarJogo(formulario){
    $("#licenca").hide();
    $("#rodape").show();
    $("#mesa-de-jogo").hide();
    $("#popupInstrucoes").hide();
    criarBotaoInstrucoes("#cabecalho");
    $("#cabecalho").append(formulario.nome);
    document.title = formulario.titulo;
    totalTelas = formulario.telas.length;
    telas = formulario.telas;
    questoes = formulario.questoes;
    IniciarJogoMemoria();
    itemAtual = 0;
    carregaItem(itemAtual);
    $("#texto").html("<div class='mensagem' ><button onclick='proximo();'>Clique na imagem para continuar...</button></div>");
}

// Cria o botão de instruções.
function criarBotaoInstrucoes(id){
    var fonte = 12;
    var fonteMax = 16;
    var fonteMin = 12;
    $(id).html("<div id=\"ferramentas_texto\" class=\"ferramentas_texto\"><a id=\"mostra_instrucoes\" title=\"Veja as Instruções\">?</a></div>");

    $("#mostra_instrucoes").click(function(){
        centerPopup();
        $("#popupInstrucoes").fadeIn('slow', function() {
            // Animation complete
        });
    });

    $('#ferramentas_texto').show();
}

// Fecha a tela de instruções.
function fecharPopup(){
    $("#popupInstrucoes").fadeOut('slow', function() {
        // Animation complete
    });
}

// Centraliza a tela popup, usada para instruções.
function centerPopup(){

    var height = $('#conteudo').height();
    if ($.browser.msie == true){
        height += 30        
    }


    var windowWidth = $(window).width();
    var windowHeight = $(window).height();
    var popupHeight = $("#popupInstrucoes").height();
    var popupWidth = $("#popupInstrucoes").width()+ 22;

    $("#popupInstrucoes").css({
    "position": "absolute",
    "top": $('#cabecalho').height() + 30 ,
    "left": windowWidth/2-popupWidth/2,
    "height": height
    });
}

// Exibe na tela a área de texto.
function mostraDivTexto(){
    $("#texto").show();
}

// Exibe o relatório sobre o jogo.
function relatorio(){
    mostraDivTexto();
    geraRelatorio();
}

// Carrega as telas do jogo. Um Item é uma das telas de texto ou as telas do jogo e do relatório.
function carregaItem(itemId){
    $("#rodape").show();
    $("#licenca").hide();
    $("#mostra_instrucoes").hide();

    // Carrega a tela especifica, identificada pelo Tipo.
    switch(telas[itemId].tipo){
        // Telas de texto são todas as telas do jogo, exceto a tela que apresenta as cartas do jogo da memória.
        case 'texto':
            $("#mesa-de-jogo").css("display","none");
            $("#texto").css("min-height", "400");

            // Carrega a tela especifica, identificada pelo Título.
            switch(telas[itemId].titulo){
                case 'Relatório':
                    // Gera e exibe o relatório do jogo.
                    relatorio();
                    break;
                case 'Fim':
                    // Realiza a configuração específica da tela final.
                    $("#rodape").hide();
                    $("#licenca").show();
                    // Carrega a tela final executando a função mostraDivTexto().
                    $("#texto").load('items/' + telas[itemId].texto,mostraDivTexto);
                    break;
                default:
                    // Carrega a tela de texto atual executando a função mostraDivTexto().
                    $("#texto").load('items/' + telas[itemId].texto,mostraDivTexto);
                    novoJogo();
                    break;
            }
            break;
        // Tela do jogo da memória
        case 'jogo':
            if (pares_restantes == 0) {
                $('#texto').html('<span>Fim do jogo, parabéns !</span>');
                $('#texto').find('span').css({
                    'color' : '#00CC00',
                    'font-size' : '300%',
                    'text-align' : 'center'
                });
                $('#navegacao div:contains("Avançar >>")').html('Ver relatório >>');
            } else {
                $("#texto").html("Resolva o jogo da memória abaixo.<br><div id='msg-jogo'></div>");
            }
            $("#texto").css("min-height", "50");
            mostraJogo();
            break;
    }
    gerarNavegacao();
}

// Realiza a geração da tela de relatório do jogo.
function geraRelatorio(){
    var cssLabel = {
        'font-size' : '120%'
    }
    var cssField = {
        'font-size' : '200%',
        'margin-bottom' : '24px',
        'color' : '#000099',
        'margin-left' : '20px'
    }

    $('#texto').html("<div class='sublinhado negrito'>Relatório do Jogo da Memória</div>");
    $('#texto').append("<br/><br/>");
    $("<div>Quantidade de acertos:</div>").css(cssLabel).appendTo('#texto');
    $("<div>" + (pares - pares_restantes) + " acerto(s)</div>").css(cssField).appendTo('#texto');

    $("<div>Quantidade de erros:</div>").css(cssLabel).appendTo('#texto');;
    $("<div>" + (tentativas - (pares - pares_restantes)) + " erro(s)</div>").css(cssField).appendTo('#texto');

    $("<div>Quantidade total de tentativas:</div>").css(cssLabel).appendTo('#texto');;
    $("<div>" + tentativas + " tentativa(s)</div>").css(cssField).appendTo('#texto');;

    $("<div>Pontuação:</div>").css(cssLabel).appendTo('#texto');;
    $("<div>" + (((pares - pares_restantes)*10) - ((tentativas - (pares - pares_restantes))*2)) + " ponto(s)</div>").css(cssField).appendTo('#texto');;
}

// FUNÇÕES DE NAVEGAÇÃO =================================================================================================================================================

/*
* Executam as operações de avançar e retornar as telas do jogo. São chamadas pelos controles presentes na interface (código html), que são
* imagens e botões.
*/

// Executa a troca de telas para frente.
function proximo(){
	// Executa apenas se não estiver na última tela.
	if (itemAtual + 1 < totalTelas){
	    itemAtual++;
	    carregaItem(itemAtual);
	}
}

// Executa a troca de telas para trás.
function anterior(){
    // Se for a segunda tela, voltar fará com que o jogo reinicialize.
    if (itemAtual == 1){
        inicializar();

    }

    // Executa apenas se for uma tela posterior à segunda.
    if (itemAtual - 1 > 0){
        itemAtual--;
        carregaItem(itemAtual);
    }
}

// Gera os botões de navegação entre as telas do jogo.
function gerarNavegacao(){
    var navHtml = '';
    $('#navegacao').css('text-align', 'right');
    if (itemAtual > 0) {
        navHtml += "<div id='navRetroceder'><< Retroceder</div> ";
    }
    if (itemAtual + 1 < totalTelas) {
        navHtml +=  "<div id='navAvancar'>Avançar >></div>";
    } else {
        $('#navegacao').css('text-align', 'left');
    }
    $('#navegacao').html(navHtml);
    $('#navRetroceder').click(anterior);
    if (itemAtual + 1 < totalTelas) {
        $('#navRetroceder').css('float', 'left');
    }
    $('#navAvancar').click(proximo);
}


// ======================================================================================================================================================================


// FUNÇÕES ESPECÍFICAS DO JOGO DA MEMÓRIA ===============================================================================================================================

/*
*   Implementação do Jogo da Memória
*/

// Inicialização de atributos
var pares;
var cartaLadoB;
var coresPares = ['#336600','#663300','#FF3300','#006699','#CC0000','#000099','#990099','#FF0066','#AAAA00','#0000FF'];
var pares_restantes;
var is_segunda_carta = false;
var primeira_carta;
var segunda_carta;
var wait = 0;
var tentativas;
var cssAcerto = {
    'color' : '#00CC00'
}
var cssErro = {
    'color' : '#CC0000'
}

// Realiza a montagem da mesa de jogo (cria as cartas)
function IniciarJogoMemoria(){
    init_Cartas();
    $('#mesa-de-jogo').html("");
	for (i=1;i<=(pares*2);i++)
	{
		$("<div class='carta'></div>").bind("click",function(){ mudarCarta(this);}).appendTo("#mesa-de-jogo");
        if (i%4==0) {
		    $("#mesa-de-jogo").append("<div style='clear: both'></div>");
        }
	}
    if ((pares*2)%4!=0) {
        $("#mesa-de-jogo").append("<div style='clear: both'></div>");
    }
	novoJogo();
}

// Inicializa array de cartas
function init_Cartas() {
    pares = questoes.length;
    cartaLadoB = new Array(pares*2);
    for (i=1;i<=(pares*2);i++) {
        cartaLadoB[i] = i;
    }
}

// Realiza a criação de um novo jogo embaralhando as cartas e limpando as transformações realizadas pelo jogo corrente.
function novoJogo(){
	cartaLadoB.sort(function() {return 0.5 - Math.random()});
	$(".carta").css("background-image",'url("imagens/carta_verso.png")');
    $(".carta").find('table').css('color', '#000000');
    $(".carta").html("");
	pares_restantes = pares;
	tentativas = 0;
}

// Função responsável por virar a carta clicada. É disparada pelo evento on_click da carta.
function mudarCarta(elemento){
    // Vira a carta se ela ainda não estiver virada
    desvirar();
	if ( ($(elemento).css("background-image").indexOf("carta_verso.png",0) > -1  ) && (wait == 0))
	{
		$(elemento).css("background-image",'url("imagens/carta_frente.png")');

		// Carrega o texto da carta
        var eleIdx = cartaLadoB[$(".carta").index(elemento)]-1;
        if (eleIdx > pares-1) {
            $(elemento).html('<table width="100%" height="100%"><tr><td valign="middle">' + questoes[eleIdx-pares].correto + '</td></tr></table>');
        } else {
            $(elemento).css("text-align","left");
            $(elemento).html('<table width="100%" height="100%"><tr><td valign="middle">' + questoes[eleIdx].texto + '</td></tr></table>');
        }

        // Armazena a última carta virada. Se a última carta virada for a segunda carta, solicita a verificação do par de cartas virado.
		if (!is_segunda_carta) {
			primeira_carta = elemento;
			is_segunda_carta = true;
            $('#msg-jogo').html("");
		} else {
			segunda_carta = elemento;
			wait = 1;
            verificaPar();
			setTimeout(desvirar,20000);
		}
	}
}

// Realiza a verificação do par de cartas selecionadas.
function verificaPar(){
    is_segunda_carta = false;
    var eleIdx1 = cartaLadoB[$(".carta").index(primeira_carta)]-1;
    var eleIdx2 = cartaLadoB[$(".carta").index(segunda_carta)]-1;

    // Verifica se as cartas são correspondentes.
	if ((cartaLadoB[$(".carta").index(segunda_carta)]%pares) == (cartaLadoB[$(".carta").index(primeira_carta)]%pares)) {
		pares_restantes--;
        if (eleIdx1 > eleIdx2)
            eleIdx1 = eleIdx2;
        $('#msg-jogo').html(questoes[eleIdx1].feedback_correto);
        $('#msg-jogo').css(cssAcerto);
        $(primeira_carta).find('table').css('color', coresPares[eleIdx1]);
        $(segunda_carta).find('table').css('color', coresPares[eleIdx1]);
        wait = 0;
	} else {
        // Exibe a mensagem de erro de acordo com a situação.
        if (eleIdx1>pares-1 && eleIdx2>pares-1 || eleIdx1<=pares-1 && eleIdx2<=pares-1) {
            $('#msg-jogo').html("oops !");
        } else {
            if (eleIdx1>pares-1) {
                $('#msg-jogo').html(questoes[eleIdx1-pares].feedback_incorreto);
            } else {
                $('#msg-jogo').html(questoes[eleIdx2-pares].feedback_incorreto);
            }
        }
        $('#msg-jogo').css(cssErro);
	}

	tentativas++;
    if (pares_restantes <= 0) {
        $('#texto').html('<span>Fim do jogo, parabéns !</span>');
        $('#texto').find('span').css({
            'color' : '#00CC00',
            'font-size' : '300%',
            'text-align' : 'center'
        });
        $('#navegacao div:contains("Avançar >>")').html('Ver relatório >>');
    }
}

function desvirar() {
    if (wait==1) {
        $(segunda_carta).css("background-image",'url("imagens/carta_verso.png")');
        $(primeira_carta).css("background-image",'url("imagens/carta_verso.png")');
        $(segunda_carta).html("");
        $(primeira_carta).html("");
        wait = 0;
    }
}

// Exibe a mesa de jogo.
function mostraJogo() {
    $("#mesa-de-jogo").show();
    $("#mostra_instrucoes").show();
}

// ======================================================================================================================================================================

