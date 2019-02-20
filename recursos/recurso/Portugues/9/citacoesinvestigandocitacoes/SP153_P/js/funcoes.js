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
    IniciarJogo();
    itemAtual = 0;
    carregaItem(itemAtual);
    $("#texto").html("<div class='mensagem' ><button onclick='proximo();'>Clique na imagem para continuar...</button></div>");
}

// Cria o botão de instruções.
function criarBotaoInstrucoes(id){
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
            $("#cabecalho").show();
            $('#msg-fim-jogo').hide();
            $("#mesa-de-jogo").css("display","none");
            $("#formulario-resposta").css("display","none");
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
                case 'Introdução':
                    // Realiza a configuração específica da tela final.
                    $("#cabecalho").hide();
                    // Carrega a tela final executando a função mostraDivTexto().
                    $("#texto").load('items/' + telas[itemId].texto,mostraDivTexto);
                    IniciarJogo();
                    break;
                default:
                    // Carrega a tela de texto atual executando a função mostraDivTexto().
                    $("#texto").load('items/' + telas[itemId].texto,mostraDivTexto);
                    IniciarJogo();
                    break;
            }
            break;
        // Tela do jogo da memória
        case 'jogo':
            if (cartas_restantes == 0) {
                $('#formulario-resposta').hide();
                $('#msg-fim-jogo').css({'text-align' : 'center'});
                $('#msg-fim-jogo').show();
                $('#msg-fim-jogo').html('<span>Fim do jogo, parabéns !</span>');
                $('#msg-fim-jogo').find('span').css({
                    'color' : '#00CC00',
                    'font-size' : '300%',
                    'text-align' : 'center'
                });
                $('#navegacao div:contains("Avançar >>")').html('Ver relatório >>');
            }
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

    $('#texto').html("<div class='sublinhado negrito'>Relatório do Jogo</div>");
    $('#texto').append("<br/><br/>");
    $("<div>Quantidade de acertos:</div>").css(cssLabel).appendTo('#texto');
    $("<div>" + (nCartas - cartas_restantes) + " acerto(s)</div>").css(cssField).appendTo('#texto');

    $("<div>Quantidade de erros:</div>").css(cssLabel).appendTo('#texto');;
    $("<div>" + (tentativas - (nCartas - cartas_restantes)) + " erro(s)</div>").css(cssField).appendTo('#texto');

    $("<div>Quantidade total de tentativas:</div>").css(cssLabel).appendTo('#texto');;
    $("<div>" + tentativas + " tentativa(s)</div>").css(cssField).appendTo('#texto');;

    $("<div>Pontuação:</div>").css(cssLabel).appendTo('#texto');;
    $("<div>" + (((nCartas - cartas_restantes)*10) - ((tentativas - (nCartas - cartas_restantes))*3)) + " ponto(s)</div>").css(cssField).appendTo('#texto');;
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
var nCartas;
var imgNormal;
var imgMirado;
var cartas = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
var posCartas = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1];
var cartas_restantes;
var eleIdx = -1;
var is_segunda_carta = false;
var carta_selecionada;
var tentativas;
var cssAcerto = {
    'color' : '#00CC00'
}
var cssErro = {
    'color' : '#CC0000'
}

// Realiza a montagem da mesa de jogo (cria as cartas)
function IniciarJogo(){
    init_Cartas();
    $('#mesa-de-jogo').html("");
	for (i=0;i<nCartas && i<10;i++)
	{
		$("<div id='carta-" + cartas[i] + "' class='carta'><img src='" + imgNormal[cartas[i]] + "' idx='" + cartas[i] + "' /></div>").bind("click",function(){ mudarCarta(this);}).appendTo("#mesa-de-jogo");
	}
	novoJogo();
}

// Inicializa array de cartas
function init_Cartas() {
	cartas.sort(function() {return 0.5 - Math.random()});
	posCartas.sort(function() {return 0.5 - Math.random()});
    nCartas = questoes.length;
    if (nCartas > 10) {
        nCartas = 10;
    }
    imgNormal = new Array(nCartas);
    imgMirado = new Array(nCartas);
	for (i=0; i<nCartas && i<10; i++) {
        imgNormal[cartas[i]] = getImagem(1, cartas[i]);
        imgMirado[cartas[i]] = getImagem(0, cartas[i]);
    }
    carta_selecionada = '';
}

function getImagem(normal, idx) {
    var prefixo;
    var sufixo;
    var tam;
    if (normal == 1)
        prefixo = "pato";
    else
        prefixo = "pato_mirado";
    if (posCartas[idx]==0)
        sufixo = "esq";
    else
        sufixo = "dir";
    if (idx < 3)
        tam = "grande";
    else if (idx < 7)
        tam = "med";
    else
        tam = "peq";
    return "imagens/" + prefixo + "_" + tam + "_" + sufixo + ".png";
}

// Realiza a criação de um novo jogo embaralhando as cartas e limpando as transformações realizadas pelo jogo corrente.
function novoJogo(){
	cartas_restantes = nCartas;
	tentativas = 0;
    $('#pergunta').html('Selecione um pato!');
    $('#campo-resposta').hide();
    $('#msg-jogo').html('');
}

// Função responsável por virar a carta clicada. É disparada pelo evento on_click da carta.
function mudarCarta(elemento){
    // Vira a carta se ela ainda não estiver virada
    desvirar();
	if ( $(elemento).find('img').attr('src').indexOf("pato_mirado",0) == -1  )
	{
        $('#msg-jogo').html('');
        var itemIdx;
		itemIdx = $(elemento).find('img').attr('idx').valueOf();
        $(elemento).find('img').attr('src', getImagem(0, itemIdx));

        for (i=0; i<nCartas && i<10; i++) {
            if (cartas[i]==itemIdx) {
                eleIdx = i;
                break;
            }
        }

		// Carrega o texto da carta
        $('#pergunta').html(questoes[eleIdx].texto);
        $('#resposta').show();

        // Armazena a última carta selecionada.
		carta_selecionada = elemento;
        $('#campo-resposta').show();
        document.getElementById('resp').value = '';
	}
}

// Realiza a verificação do par de cartas selecionadas.
function verificaResposta(){
    var resposta = Trim(document.getElementById('resp').value.trim().toLowerCase());
    if (questoes[eleIdx].correto==resposta) {
        $('#msg-jogo').css(cssAcerto);
        $('#msg-jogo').html(questoes[eleIdx].feedback_correto);
        cartas_restantes--;
        $(carta_selecionada).hide();
        carta_selecionada = '';
    } else {
        $('#msg-jogo').html(questoes[eleIdx].feedback_incorreto);
        $('#msg-jogo').css(cssErro);
        desvirar();
    }
    $('#pergunta').html('Selecione um pato!');
    $('#campo-resposta').hide();

    tentativas++;
    document.getElementById('resp').value = '';

    if (cartas_restantes <= 0) {
        $('#formulario-resposta').hide();
        $('#msg-fim-jogo').css({'text-align' : 'center'});
        $('#msg-fim-jogo').show();
        $('#msg-fim-jogo').html('<span>Fim do jogo, parabéns !</span>');
        $('#msg-fim-jogo').find('span').css({
            'color' : '#00CC00',
            'font-size' : '300%',
            'text-align' : 'center'            
        });
        $('#navegacao div:contains("Avançar >>")').html('Ver relatório >>');
    }    
}

function Trim(str){return str.replace(/^\s+|\s+$/g,"");}

function desvirar() {
    if (carta_selecionada!='') {
        var itemIdx;
	    itemIdx = $(carta_selecionada).find('img').attr('idx').valueOf();
        $(carta_selecionada).find('img').attr('src', getImagem(1, itemIdx));
    }
}

// Exibe a mesa de jogo.
function mostraJogo() {
    $("#texto").hide();
    $("#mesa-de-jogo").show();
    $("#mostra_instrucoes").show();
    if (cartas_restantes > 0)
        $("#formulario-resposta").show();
    else
        $("#msg-fim-jogo").show();
}

// ======================================================================================================================================================================

