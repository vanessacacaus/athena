var url_string = window.location.href
var url = new URL(url_string);
var identidade = url.searchParams.get("n");

if(String(identidade)==""){
	identidade="null";
}

$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "data/recursos_pc.tsv",
        dataType: "text",
        success: function(data) {processData(data);}
     });
});

function processData(textoParam){
	var linhas = textoParam.split('\n');
	var recursos = [];
	for (var i=0; i < linhas.length; i++){
	    var aux = linhas[i].split('\t');
	    aux = {identidade:aux[0], nome:aux[1], miniatura:aux[2], resumo:aux[3], disciplina:aux[4], ano:aux[5], descritores:aux[6], linkdown:aux[7], visualizar:aux[8], tema:aux[9], origem:aux[10], autores:aux[11], idioma:aux[12], datacriacao:aux[13]};
	    if(String(identidade)!="null" && String(aux.identidade)!=String(identidade)){
	    	continue;
	    }
	    recursos.push(aux);
		//alert(recursos.length);
		document.getElementById("tituloRecurso").innerHTML = recursos[0].nome;
		document.getElementById("imagemRecurso").src = recursos[0].miniatura;
		document.getElementById("textoRecurso").innerHTML = recursos[0].resumo;
		document.getElementById("descritoresRecurso").innerHTML = recursos[0].descritores;
		document.getElementById("metadadosRecurso").innerHTML = recursos[0].tema + '<br>' + recursos[0].origem + '<br>' + recursos[0].autores + '<br>' + recursos[0].idioma + '<br>' + recursos[0].datacriacao;
	}
}