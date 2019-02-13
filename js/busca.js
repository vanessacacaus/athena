var urlString = window.location.href
var recursos = [];
var url = new URL(urlString);
var disciplinaDesejada = url.searchParams.get("d");
var anoDesejado = url.searchParams.get("a");
var descritoresDesejados = url.searchParams.get("t");
var pagina = url.searchParams.get("p");
var primeiroIntervaloRecursos = 0;

if(String(disciplinaDesejada)=="lp"){
	disciplinaDesejada = "Portugues";
}else if(String(disciplinaDesejada)=="mat"){
	disciplinaDesejada = "Matematica";
}else{
	disciplinaDesejada = "null";
}


if(String(anoDesejado)==""){
	anoDesejado="null";
}

if(pagina == null){
	pagina = 0;
} else if(String(pagina)==""){
	pagina = 0;
}
else{
	pagina = parseInt(pagina);
	primeiroIntervaloRecursos = pagina*8;
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
	for (var i=0; i < linhas.length; i++){
	    var aux = linhas[i].split('\t');
	    aux = {identidade:aux[0], nome:aux[1], miniatura:aux[2], resumo:aux[3], disciplina:aux[4], ano:aux[5], descritores:aux[6], linkdown:aux[7], visualizar:aux[8], tema:aux[9], origem:aux[10], autores:aux[11], idioma:aux[12], datacriacao:aux[13]};
	    if(String(disciplinaDesejada) != "null" && String(disciplinaDesejada) != String(aux.disciplina)){
	    	continue;
	    }
	    if(String(anoDesejado)!="null" && String(aux.ano)!=String(anoDesejado)){
	    	continue;
	    }
	    recursos.push(aux);
	}
	//processamento de consulta por descritores
	//processamento de consulta por tema
	//alert(recursos.length);



	//colocando recursos no seus locais
	var auxCount = 0;
	for(i=primeiroIntervaloRecursos;i<primeiroIntervaloRecursos+8;i++){
		//if para o caso de nao ter a pagina inteira, ex: com 20 recursos há duas paginas cheias e uma com quatro
		if(recursos[i]==null){
			break;
		}
		document.getElementById('recurso'+auxCount).children[0].src = recursos[i].miniatura;
		document.getElementById('recurso'+auxCount).children[1].innerHTML = recursos[i].nome;
		document.getElementById('recurso'+auxCount).children[2].innerHTML = recursos[i].ano+"º ano";
		auxCount++;
	}

	//colocando os links para passar de página
	//pagina+1 para calcular quantos recursos temos, se tiver menos recursos que o maximo das paginas, é a ultima
	document.getElementById("paginaAtual").innerHTML='| Página '+ (pagina+1) + ' |';
	if((pagina+1)*8 >= recursos.length){
		document.getElementById("proximaPagina").style.visibility = "hidden";
	}else{
		var proximaPaginaUrl = urlString.replace('p='+pagina,'p='+(pagina+1))
		document.getElementById('proximaPagina').href=proximaPaginaUrl;
		document.getElementById("proximaPagina").innerHTML='Página '+(pagina+2)+'&raquo;';
	}

	if(pagina == 0){
		document.getElementById("paginaAnterior").style.visibility = "hidden";
	}else{
		var paginaAnteriorUrl = urlString.replace('p='+pagina,'p='+(pagina-1))
		document.getElementById('paginaAnterior').href=paginaAnteriorUrl;
		document.getElementById("paginaAnterior").innerHTML='&laquo; Página '+pagina;	
	}

}


function irPararecurso(n) {
	location.href="../novo-athena/recursocomputador.html?n=" + recursos[n].identidade;
}