


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
    //$("#navegacao").show();
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
        case 'tictactoe':
            $("#navegacaoQuestoes").css("display","none");
            $("#texto").load('items/' + questoes[itemId].texto,mostraDivTexto);
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

function tictacquestao(id){
    var selecionada = true;
    for (var i = 1; i <= 9; i++){
        if ($("#ttt"+i+"resp").val() == "selecionada"){
            selecionada = false;
        }
    }

    if (selecionada == true && $("#ttt" + id).val() != "X" && $("#ttt" + id).val() != "O" && (!tictacverifica("X")) && (!tictacverifica("O")) ){
        $("#ttt"+id+"resp").val("selecionada");
        var item = questoes[itemAtual].itens[id-1];
        $("#tictactoequestao").html(item.texto);
    
        var auxHtml = "<div class='alinhaCentro'><br/><input type='text' id='tictacresp" + item.id + "'/>";
        auxHtml = auxHtml + " <button id='btntictacresp'  onclick='tictacresposta(" + item.id + ");' >Responder</button></div>";
        $("#tictactoequestao").html(item.texto);
        $("#tictactoequestao").append(auxHtml);
        $("#tictacresp" + item.id).focus();
    }
}

function tictacresposta(id){
    var item = questoes[itemAtual].itens[id - 1];
    $("#tictacresp" + id).val($("#tictacresp" + id).val().replace(/^\s+|\s+$/g,""));
    if ($("#tictacresp" + id).val() == ""){
        return false;
    }

    $("#btntictacresp").hide();
    
    $("#ttt" + id + "resp").val($("#tictacresp" + id).val());
    if (($("#tictacresp" + id).val().toLowerCase() == item.correto.toLowerCase()) ||  (tiraAcento($("#tictacresp" + id).val().toLowerCase()) == tiraAcento(item.correto.toLowerCase()))){
        $("#tictactoequestao").html("<div class='feedbackCorreto'>" + item.feedback_correto + "</div>");
        $("#ttt" + id).val("O");
    }else{
        $("#tictactoequestao").html("<div class='feedbackIncorreto'>" + item.feedback_incorreto + "</div>");
        $("#ttt" + id).val("X");
    }
    if (tictacverifica("X")){
        auxHtml = "<div class='alinhaCentro'><div class='tictacperdeu'>Voce perdeu!</div>";
        auxHtml = auxHtml + "<br/><br/><button id='btntictacresp'  onclick='tictacreinicio();' >Jogar Novamente</button>";
        auxHtml = auxHtml + " <button id='btntictacresp'  onclick='tictacrelatorio();' >Ver Relatório</button></div>";
        $("#tictactoequestao").html(auxHtml);

    }
    if (tictacverifica("O")){
        auxHtml = "<div class='alinhaCentro'><div class='tictacganhou'>Voce ganhou!</div>";
        auxHtml = auxHtml + "<br/><br/><button id='btntictacresp'  onclick='tictacreinicio();' >Jogar Novamente</button>";
        auxHtml = auxHtml + " <button id='btntictacresp'  onclick='tictacrelatorio();' >Ver Relatório</button></div>";
        $("#tictactoequestao").html(auxHtml);
    }
    if (tictacverifica("Empate")){
        auxHtml = "<div class='alinhaCentro'><div class='tictacempatou'>Empatou!</div>";
        auxHtml = auxHtml + "<br/><br/><button id='btntictacresp'  onclick='tictacreinicio();' >Jogar Novamente</button>";
        auxHtml = auxHtml + " <button id='btntictacresp'  onclick='tictacrelatorio();' >Ver Relatório</button></div>";
        $("#tictactoequestao").html(auxHtml);
    }
}


function tictacverifica(valor){
    if (valor == "X" || valor == "O"){
        if (($("#ttt1").val() == valor && $("#ttt2").val() == valor && $("#ttt3").val() == valor)){
            $("#ttt1").addClass("tictac" + valor + "resultado");
            $("#ttt2").addClass("tictac" + valor + "resultado");
            $("#ttt3").addClass("tictac" + valor + "resultado");
            return true;
        }
        if (($("#ttt1").val() == valor && $("#ttt4").val() == valor && $("#ttt7").val() == valor)){
            $("#ttt1").addClass("tictac" + valor + "resultado");
            $("#ttt4").addClass("tictac" + valor + "resultado");
            $("#ttt7").addClass("tictac" + valor + "resultado");
            return true;
        }
        if (($("#ttt1").val() == valor && $("#ttt5").val() == valor && $("#ttt9").val() == valor)){
            $("#ttt1").addClass("tictac" + valor + "resultado");
            $("#ttt5").addClass("tictac" + valor + "resultado");
            $("#ttt9").addClass("tictac" + valor + "resultado");
            return true;
        }
        if (($("#ttt2").val() == valor && $("#ttt5").val() == valor && $("#ttt8").val() == valor)){
            $("#ttt2").addClass("tictac" + valor + "resultado");
            $("#ttt5").addClass("tictac" + valor + "resultado");
            $("#ttt8").addClass("tictac" + valor + "resultado");
            return true;
        }
        if (($("#ttt3").val() == valor && $("#ttt6").val() == valor && $("#ttt9").val() == valor)){
            $("#ttt3").addClass("tictac" + valor + "resultado");
            $("#ttt6").addClass("tictac" + valor + "resultado");
            $("#ttt9").addClass("tictac" + valor + "resultado");
            return true;
        }
        if (($("#ttt3").val() == valor && $("#ttt5").val() == valor && $("#ttt7").val() == valor)){
            $("#ttt3").addClass("tictac" + valor + "resultado");
            $("#ttt5").addClass("tictac" + valor + "resultado");
            $("#ttt7").addClass("tictac" + valor + "resultado");
            return true;
        }
        if (($("#ttt4").val() == valor && $("#ttt5").val() == valor && $("#ttt6").val() == valor)){
            $("#ttt4").addClass("tictac" + valor + "resultado");
            $("#ttt5").addClass("tictac" + valor + "resultado");
            $("#ttt6").addClass("tictac" + valor + "resultado");
            return true;
        }
        if (($("#ttt7").val() == valor && $("#ttt8").val() == valor && $("#ttt9").val() == valor)){
            $("#ttt7").addClass("tictac" + valor + "resultado");
            $("#ttt8").addClass("tictac" + valor + "resultado");
            $("#ttt9").addClass("tictac" + valor + "resultado");
            return true;
        }

        return false;
    }else{
        var ttc = 0; //tictac count
        for (var i = 1; i <= 9; i++){
            if ($("#ttt"+i+"resp").val() != ""){
                ttc = ttc + 1;
            }
        }
        if (ttc >= 9 ) return true;
        return false;
    }
}

function tictacreinicio(){
    for (var i = 1; i <= 9; i++){
        $("#ttt"+i).val(i);
        $("#ttt"+i).removeClass();
        $("#ttt"+i).addClass("tictac");

        $("#ttt"+i+"resp").val("");        
    }
    $("#tictactoequestao").html("");
}


function tictacrelatorio(){
    $("#tictac").hide();
    $('#texto').append("<div class='sublinhado negrito'>Relatório de Respostas</div>");
    $('#texto').append("<br/><br/>");
    $("#navegacaoQuestoes").show();
    $("#navegacaoQuestoesEsq").hide();
    for (var i = 1; i <= 9; i++){
        var item = questoes[itemAtual].itens[i-1];
        if ($("#ttt" + i + "resp").val() != ""){
            $('#texto').append(item.texto);
            $('#texto').append("<br/>Resposta dada:");
            $('#texto').append($("#ttt" + i + "resp").val());
            if (($("#ttt" + i + "resp").val().toLowerCase() == item.correto.toLowerCase()) ||  (tiraAcento($("#ttt" + i + "resp").val().toLowerCase()) == tiraAcento(item.correto.toLowerCase()))){
                $('#texto').append(" - Resposta correta.<br/><br/>");
            }else{
                $('#texto').append(" - Resposta incorreta.<br/><br/>");
            }
        }
    }

    /*
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
    */
}

