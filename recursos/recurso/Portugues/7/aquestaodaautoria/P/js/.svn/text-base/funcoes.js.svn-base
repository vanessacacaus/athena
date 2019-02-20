


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
    $("#navegacaoQuestoes").hide();
    $("#popupInstrucoes").hide();
    $("#navegacao").hide();
    carregaFerramentaTexto("#cabecalho");
    $("#cabecalho").append(formulario.nome);
    $("#conteudo").css('border-color','#FFFFFF');
    document.title = formulario.titulo;
    totalQuestoes = formulario.questoes.length;
    questoes = formulario.questoes;
    itemAtual = 0;
    carregaItem(itemAtual);
    $("#texto").html("<div class='mensagem' ><button onclick='proximo();'>Clique na imagem para continuar...</button></div>");



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

    $('#ferramentas_texto').hide();

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

    var height = $('#conteudo').height();
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
    "top": $('#cabecalho').height() + 30 ,
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
    $("#conteudo").css('border-color','maroon');
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
            html = '<div id="item' + x + '" style="display:none">' + questoes[x].titulo + '</div>';
            $("#navegacao").append(html);
            $("#item" + x).fadeIn('slow', function() {
            // Animation complete
            });
        }

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

    switch(questoes[itemId].tipo){
        case 'texto':
            $("#navegacaoQuestoes").css("display","none");
            if (questoes[itemId].titulo == "Relatório"){
                $("#resposta").load('items/' + questoes[itemId].texto,relatorio);
                geraRelatorio();
/*                $("#questao").show();
                $("#resposta").show();
                $("#navegacaoQuestoes").show();                */
                //$("#conteudo").height($("#resposta").height());

            }else{
                if (questoes[itemId].titulo == "Fim"){
                    $("#rodape").hide();
                    $("#licenca").show();
                }
                $("#texto").load('items/' + questoes[itemId].texto,mostraDivTexto);
            }
            //mostraDivTexto();
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
    for (x=0;x<questoes[questaoId].itens.length;x++){
        var item = questoes[questaoId].itens[x];
        switch (questoes[questaoId].tipo){
            case 'teste':
                if (x == 0) html += questoes[questaoId].textoAdicional+"<br/><br/><br/>";
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
                if (x == 0) html += questoes[questaoId].textoAdicional+"<br/><br/><br/>";
                var auxHtml = '<input type="text" id="resp' + item.id + '"><sup>[' + item.id + ']</sup>';
                html = html.replace(er,auxHtml);
                break;
        }
        html += '<br>';
    }
    html += '<br/><br/><button onclick="responder()" >Responder</button>';
    $("#resposta").html(html);

}

function respostaRadio(idItem,resp){    
    $(idItem).val(resp);
    //questao.respondida = 1;
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
    switch (questao.tipo){
        case 'teste':
            var resposta = $("input[@name='resp']:checked").val();
            var correta = questao.correto;
            if ($("input[@name='resp']:checked").length > 0){
                questao.respondida = 1;
                if (resposta == correta){
                    $("#texto").html("<div class='feedbackCorreto'>" + questao.feedback_correto + "</div>");
                }else{
                    $("#texto").html("<div class='feedbackIncorreto'>" + questao.feedback_incorreto + "</div>");
                }
            }else{
                alert("Responda a questão.");
                return false;
            }
            break;
        case 'vf':
            $("#texto").html("");
            var questoesSemResposta = 0;
            var qtdeItens = questao.itens.length;
            for (var x = 1;x<=qtdeItens;x++){
                if ($("#hresp" + x).val() != "n"){
                    questao.respondida = 1;
                    if ($("#hresp" + x).val().toLowerCase() == questao.itens[x-1].correto.toLowerCase()){
                        $("#texto").append("<div class='feedbackCorreto'>" + questao.itens[x-1].feedback_correto + "</div>");
                    }else{
                        $("#texto").append("<div class='feedbackIncorreto'>" + questao.itens[x-1].feedback_incorreto + "</div>");
                    }
                }else{
                    questoesSemResposta++;
                }
            }
            if (questoesSemResposta > 0){
                if (questao.respondida == 0 ){
                    alert("Responda a questão.");
                }else{
                    if(! confirm("Tem " + questoesSemResposta + " pergunta(s) sem responder. Continuar ?")){
                        return false;
                    }
                }
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
                        $("#texto").append("<div class='feedbackCorreto'>" + questao.itens[x-1].feedback_correto + "</div>");
                    }else{
                        $("#texto").append("<div class='feedbackIncorreto'>" + questao.itens[x-1].feedback_incorreto + "</div>");
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
    $("#navegacaoQuestoes").hide();
    mostraDivTexto();
    $("#texto").append('<br/><br/><div class="alinhaCentro"><button onclick="mostraDivQuestoes()" >Voltar</button> <button onclick="proximo()">Continuar</button></div> ');

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
            }else{
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




