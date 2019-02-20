function inicializar(){
    $.getJSON("js/questoes.json", function(formulario){
        //iniciaQuestionario(formulario);
        inicializarJogo(formulario);
        $("#popupInstrucoes").load('items/instrucoes.html',mostraDivTexto);

    });
}

function inicializarJogo(formulario){
    $("#licenca").hide();
    $("#rodape").show();
//    $("#navegacaoQuestoes").hide();
    $("#popupInstrucoes").hide();
//    $("#navegacao").hide();
    carregaFerramentaTexto("#cabecalho");
    $("#cabecalho").append(formulario.nome);
//    $("#conteudo").css('border-color','#FFFFFF');
    document.title = formulario.titulo;
    totalQuestoes = formulario.questoes.length;
    questoes = formulario.questoes;
    itemAtual = 0;
    respostas_vf[0] = new Array(0,0,0,0,0);
    respostas_vf[1] = new Array(0,0,0,0,0);
    respostas_vf[2] = new Array(0,0,0,0,0);
    respostas_vf[3] = new Array(0,0,0,0,0);
    respostas_vf[4] = new Array(0,0,0,0,0);
    respostas_vf[5] = new Array(0,0,0,0,0);
    geraBarraNavegacao();
    carregaItem(itemAtual);
//    $("#texto").html("<div class='mensagem' ><button onclick='proximo();'>Clique na imagem para continuar...</button></div>");

}

function carregaFerramentaTexto(id){
    var fonte = 12;
    var fonteMax = 16;
    var fonteMin = 12;
    $(id).html("<div id=\"ferramentas_texto\" class=\"ferramentas_texto\"><a id=\"reduz_fonte\" title=\"Reduzir tamanho da fonte\">A-</a><a id=\"aumenta_fonte\" title=\"Aumentar tamanho da fonte\">A+</a><a id=\"mostra_instrucoes\" title=\"Veja as Instruções\">?</a></div>");
    $("#aumenta_fonte").click(function(){
            if (fonte<fonteMax){
                    fonte = fonte+2;
                    $("body").css("font-size", fonte);
            }
            if ($("#resposta").height() > $("#questao").height()){
                $("#questao").height($("#resposta").height());
            }
    });

    $("#reduz_fonte").click(function(){
            if (fonte>fonteMin){
                    fonte = fonte-2;
                    $("body").css("font-size", fonte);
            }
            if ($("#resposta").height() > $("#questao").height()){
                $("#questao").height($("#resposta").height());
            }
    });

    $("#mostra_instrucoes").click(function(){
        centerPopup();
        $("#popupInstrucoes").fadeIn('slow', function() {
        // Animation complete
        });
    });

//    $('#ferramentas_texto').hide();

}

function fecharPopup(){
    $("#popupInstrucoes").fadeOut('slow', function() {
        // Animation complete
    });
}

//centering popup
function centerPopup(){
    //request data for centering
    //document.body.clientWidth

    var height = $('#conteudo').height() + 43;
    if ($.browser.msie == true){
        height += 30        
    }


    //checa se ie
    /*if ($.browser.msie == true){
        var windowWidth = document.body.clientWidth;
        var windowHeight = document.body.clientHeight;
    }else{*/
        var windowWidth = $(window).width();
        var windowHeight = $(window).height();
    //  }
    var popupHeight = $("#popupInstrucoes").height();
    var popupWidth = $("#popupInstrucoes").width()+ 22;
    //centering
    $("#popupInstrucoes").css({
    "position": "absolute",
    "top": $('#cabecalho').height() + 20 ,
    "left": windowWidth/2-popupWidth/2,
    "height": height
    });



    /*$("#popupInstrucoes").css({
    "position": "absolute",
    "top": windowHeight/2-popupHeight/2,
    "left": windowWidth/2-popupWidth/2
    });*/



}

function iniciaQuestionario(){
    $("#texto").html("");
//    $("#conteudo").css('border-color','maroon');
    geraBarraNavegacao();
    $("#navegacao").show();
    itemAtual++;
    carregaItem(itemAtual);
    $('#ferramentas_texto').show();

}

function geraBarraNavegacao(){
    var x;
    var html;
    $("#navegacao").html("");
    for (x=0;x<totalQuestoes;x++){
        if (questoes[x].introducao != "true"){
            t = questoes[x].titulo;
        } else {
            t = "Início";
        }
        html = '<div id="item' + x + '" style="display:none">' + t + '</div>';
        $("#navegacao").append(html);
        $("#item" + x).fadeIn('slow', function() {
        // Animation complete
        });
    }

}

function mostraDivTexto(){

/*    if (itemAtual < (totalQuestoes - 1) && itemAtual != 0){
        $("#texto").append("<div class='mensagem'><button onclick='proximo();'>Clique para continuar...</button></div>");
    }*/

    $("#texto").show();
    $("#questao").hide();
    $("#resposta").hide();


}

function mostraDivQuestoes(){
    $("#texto").hide();
    $("#questao").show();
    $("#resposta").show();
    $("#navegacaoQuestoes").show();
    
}


function relatorio(){
    mostraDivQuestoes();
    $("#questao").height($("#resposta").height());
/*    $("#conteudo").height($("#resposta").height() + 60);*/
}

function carregaItem(itemId){
    $('#navegacao div').removeClass('itemAtual');
    $('#item' + itemId).addClass('itemAtual');
    $("#btnAvancar").show();
    $("#btnVoltar").show();
    if (itemId==0) {
        $("#btnVoltar").hide();
    }

    switch(questoes[itemId].tipo){
        case 'texto':
//            $("#navegacaoQuestoes").css("display","none");
            if (questoes[itemId].titulo == "Relatório"){
                $("#resposta").load('items/' + questoes[itemId].texto,relatorio);
                geraRelatorio();
/*                $("#questao").show();
                $("#resposta").show();
                $("#navegacaoQuestoes").show();                */
                //$("#conteudo").height($("#resposta").height());

            }else{
                if (questoes[itemId].titulo == "Fim"){
                    $("#btnAvancar").hide();
                    $("#rodape").hide();
                    $("#licenca").show();
                }
                $("#texto").load('items/' + questoes[itemId].texto,mostraDivTexto);
            }
            //mostraDivTexto();
            break;
        case 'associacao':
            $("#questao").load('items/' + questoes[itemId].texto,mostraDivQuestoes);
            mostraOpcoes(itemId);
            //mostraDivQuestoes();
            break;
        case 'teste':
            $("#questao").load('items/' + questoes[itemId].texto,mostraDivQuestoes);
            mostraOpcoes(itemId);
            //mostraDivQuestoes();
            break;
        case 'vf':
            $("#questao").load('items/' + questoes[itemId].texto,mostraDivQuestoes);
            mostraOpcoes(itemId);
            //mostraDivQuestoes();
            break;
        case 'completar':
            $("#questao").load('items/' + questoes[itemId].texto,mostraDivQuestoes);
            mostraOpcoes(itemId);
            //mostraDivQuestoes();
            break;
        default:
            //console.error('Tipo de questão desconhecido')
            break;
    }
}

function mostraOpcoes(questaoId){
    var x;
    var html = '';
    var select_txt = '<option value="0">-</option>';
    var colunaA = "";
    var colunaB = "";
    if (questoes[questaoId].tipo == "associacao") {
        for (x=0; x<questoes[questaoId].itens.length;x++) {
            select_txt += '<option value="' + (x+1) + '">' + (x+1) + '</option>';
        }
    }
    for (x=0;x<questoes[questaoId].itens.length;x++){
        var item = questoes[questaoId].itens[x];
        switch (questoes[questaoId].tipo){
            case 'associacao':
                colunaA += '[' + (x+1) + '] - ' + item.texto + '<br/><br/>';
                colunaB += '<select id="resp' + item.id + '" name="resp' + item.id + '" onchange="respostaAssociacao(' + item.id + ')">' + select_txt + '</select> ';
                colunaB += item.textob + '<br/><br/>';
                break;
            case 'teste':
                if (x == 0) html += questoes[questaoId].textoAdicional;
                //if (x == 0) html += questoes[questaoId].textoAdicional+"<br/><br/><br/>";
                html += '<input type="radio" class="radio" id="resp" name="resp" value="' + item.id + '">' + item.texto;
                break;
            case 'vf':
                html += item.texto + "<br/>";
                html += '<input type="radio"  class="radio" id="resp' + item.id  + '" name="resp' + item.id  + '" onclick="respostaRadio(\'#hresp' + item.id+'\',\'V\');" value="V">V';
                html += '<input type="hidden" id="hresp' + item.id  + '" name="hresp' + item.id  + '" value="n">';
                html += '<input type="radio" class="radio" id="resp' + item.id  + '" name="resp' + item.id  + '" onclick="respostaRadio(\'#hresp' + item.id+'\',\'F\');" value="F">F';
                html += "<br/>";
                break;
            case 'completar':
                //console.log(questoes[questaoId].textoAdicional);
                //html += '[' + item.id + '] - <input type="text" id="resp' + item.id + '"><br/>';
                var er = "<"+item.id+">";
                if (x == 0) html += questoes[questaoId].textoAdicional;
                var auxHtml = '<input type="text" id="resp' + item.id + '"><sup>[' + item.id + ']</sup>';
                html = html.replace(er,auxHtml);
                break;
        }
        html += '<br>';
    }
    if (questoes[questaoId].tipo == "associacao") {
        html = questoes[questaoId].textoAdicional + '<div id="colunaA"><h3>Coluna A</h3>' + colunaA + '</div><div id="colunaB"><h3>Coluna B</h3>' + colunaB + '</div>';
    }
    html += '<br/><button onclick="responder()" >Responder</button><br>';
    $("#resposta").html(html);

}

function respostaRadio(idItem,resp){    
    $(idItem).val(resp);
    //questao.respondida = 1;
}

function respostaAssociacao(itemNr){
    if ($("#resp" + itemNr + " option:selected").val()!="0") {
        var nOptions = $("#resp" + itemNr + " option").length;
        var x;
        for (x=1;x<nOptions; x++) {
            if (x==itemNr) continue;
            if ($("#resp" + x + " option:selected").val()==$("#resp" + itemNr + " option:selected").val())
                $("#resp" + x).val("0");
        }
    }
}

function getRadioCheckedValue(radio_name) {
    var oRadio = document.forms[0].elements[radio_name];
    for(var i = 0; i < oRadio.length; i++) {
        if(oRadio[i].checked) {
            return oRadio[i].value;
        }
    }
    return '';
}

function getRadioCheckedValue(radio_name) {
    var oRadio = document.forms[0].elements[radio_name];
    var contador = 0;
    for(var i = 0; i < oRadio.length; i++) {
        if(oRadio[i].checked) {
            contador++;
        }
    }
    return contador;
}

function responder(){
    var questao = questoes[itemAtual];

    if ($("#mensagem_resposta").length==0) {
        $("#resposta").append('<div id="mensagem_resposta"></div>');
    } else {
        $("#mensagem_resposta").html("");
    }

    switch (questao.tipo){
        case 'teste':
            var resposta = $("input[@name='resp']:checked").val();
            var correta = questao.correto;
            if ($("input[@name='resp']:checked").length > 0){
                questao.respondida = 1;
                if (resposta == correta){
                    $("#mensagem_resposta").html("<div class='feedbackCorreto'>" + questao.feedback_correto + "</div>");
                }else{
                    $("#mensagem_resposta").html("<div class='feedbackIncorreto'>" + questao.feedback_incorreto + "</div>");
                }
            }else{
                alert("Responda a questão.");
                return false;
            }
            break;
        case 'associacao':
            $("#texto").html("");
            var questoesSemResposta = 0;
            var qtdeItens = questao.itens.length;
            for (var x = 1;x<=qtdeItens;x++){
                if ($("#resp" + x).val() != "0"){
                    questao.respondida = -1;
                    if (!respostas_vf[itemAtual-1][x-1]) {
                        if ($("#resp" + x).val() == questao.itens[x-1].correto){
                            $("#mensagem_resposta").append("<div class='feedbackCorreto'>" + questao.itens[x-1].feedback_correto + "</div>");
                        }else{
                            $("#mensagem_resposta").append("<div class='feedbackIncorreto'>" + questao.itens[x-1].feedback_incorreto + "</div>");
                        }
                        respostas_vf[itemAtual-1][x-1] = 1;
                    }
                }else{
                    questoesSemResposta++;
                }
            }
            if (questoesSemResposta > 0){
                if (questao.respondida == 0 ){
                    alert("Responda a questão.");
                }else{
                    alert("Tem " + questoesSemResposta + " pergunta(s) sem responder.");
                }
            } else {
                questao.respondida = 1;
            }
            
            if (questao.respondida == 0 ){
                 //   proximo();
                 return false;
            }
            break;
        case 'vf':
            $("#texto").html("");
            var questoesSemResposta = 0;
            var qtdeItens = questao.itens.length;
            for (var x = 1;x<=qtdeItens;x++){
                if ($("#hresp" + x).val() != "n"){
                    questao.respondida = -1;
                    if (!respostas_vf[itemAtual-1][x-1]) {
                        if ($("#hresp" + x).val().toLowerCase() == questao.itens[x-1].correto.toLowerCase()){
                            $("#mensagem_resposta").append("<div class='feedbackCorreto'>" + questao.itens[x-1].feedback_correto + "</div>");
                        }else{
                            $("#mensagem_resposta").append("<div class='feedbackIncorreto'>" + questao.itens[x-1].feedback_incorreto + "</div>");
                        }
                        respostas_vf[itemAtual-1][x-1] = 1;
                    }
                }else{
                    questoesSemResposta++;
                }
            }
            if (questoesSemResposta > 0){
                if (questao.respondida == 0 ){
                    alert("Responda a questão.");
                }else{
                    alert("Tem " + questoesSemResposta + " pergunta(s) sem responder.");
                }
            } else {
                questao.respondida = 1;
            }
            
            if (questao.respondida == 0 ){
                 //   proximo();
                 return false;
            }
            break;
        case 'completar':
            $("#texto").html("");
            var questoesSemResposta = 0;
            var qtdeItens = questao.itens.length;
            for (var x = 1;x<=qtdeItens;x++){
                if ($("#resp" + x).val() != ""){
                    questao.respondida = 1;
                    if (($("#resp" + x).val().toLowerCase() == questao.itens[x-1].correto.toLowerCase()) ||  (tiraAcento($("#resp" + x).val().toLowerCase()) == tiraAcento(questao.itens[x-1].correto.toLowerCase()))){
                        $("#mensagem_resposta").append("<div class='feedbackCorreto'>" + questao.itens[x-1].feedback_correto + "</div>");
                    }else{
                        $("#mensagem_resposta").append("<div class='feedbackIncorreto'>" + questao.itens[x-1].feedback_incorreto + "</div>");
                    }
                }else{
                    questoesSemResposta++;
                }
            }

             if (questoesSemResposta > 0){
                if (questao.respondida == 0 ){
                    alert("Responda a questão.");
                }else{
                    if(! confirm("Tem " + questoesSemResposta + " lacuna(s) sem responder. Continuar ?")){
                        return false;
                    }
                }
            }

            if (questao.respondida == 0 ){
                //proximo();
                return false;
            }
            break;
    }
//    $("#navegacaoQuestoes").hide();
//    mostraDivTexto();
    $("#mensagem_resposta").append('<div><button onclick="proximo()">Continuar</button></div> ');
}


function geraRelatorio(){
    $('#questao').html("<div class='sublinhado negrito'>Relatório de Respostas</div>");
    $('#questao').append("<br/><br/>");
    for (var questao in questoes) {
        var er = /^[0-9]+$/i;
        if (er.test(questoes[questao].titulo)){
            $('#questao').append("<br/>Questão "+questoes[questao].titulo+": ");
            if (questoes[questao].respondida == 1){
                $('#questao').append("Respondida.<br/><br/>");
            }else if (questoes[questao].respondida == -1){
                $('#questao').append("Respondida Parcialmente.<br/><br/>");
            }else {
                $('#questao').append("Não Respondida.<br/><br/>");
            }
        }

    }
}

function proximo(){
    /*console.log("Proximo: "+itemAtual);
    if (itemAtual == 0){
        console.log("Proximo: "+itemAtual);
        iniciaQuestionario();
    }else{*/
        if (itemAtual + 1 < totalQuestoes){
            itemAtual++;
            carregaItem(itemAtual);
        }
    /*}*/
}

function anterior(){
    if (itemAtual == 1){
        inicializar();

    }

    if (itemAtual - 1 > 0){
        itemAtual--;
        carregaItem(itemAtual);

        $("#questao").height('auto');
    }
}
/**/


function tiraAcento(texto){
    var varString = new String(texto);
    var stringAcentos = new String('àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ');
    var stringSemAcento = new String('aaeouaoaeioucuAAEOUAOAEIOUCU');

    var i = new Number();
    var j = new Number();
    var cString = new String();
    var varRes = '';

    for (i = 0; i < varString.length; i++) {
        cString = varString.substring(i, i + 1);
        for (j = 0; j < stringAcentos.length; j++) {
            if (stringAcentos.substring(j, j + 1) == cString){
                cString = stringSemAcento.substring(j, j + 1);
            }
        }
    varRes += cString;
    }
    return varRes;
}




