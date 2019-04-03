var urlString = window.location.href
var recursos = [];
var url = new URL(urlString);
var disciplinaDesejada = url.searchParams.get("d");
var anoDesejado = url.searchParams.get("a");
var descritoresDesejados = String(url.searchParams.get("t"));
var pagina = url.searchParams.get("p");
var primeiroIntervaloRecursos = 0;
var buscarPorDescritores = false;

if(descritoresDesejados!="null" && descritoresDesejados!=""){
	buscarPorDescritores = true;
}

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
	    aux = {identidade:String(aux[0]), nome:String(aux[1]), miniatura:String(aux[2]), resumo:String(aux[3]), disciplina:String(aux[4]), ano:String(aux[5]), descritores:String(aux[6]), linkdown:String(aux[7]), visualizar:String(aux[8]), tema:String(aux[9]), origem:String(aux[10]), autores:String(aux[11]), idioma:String(aux[12]), datacriacao:String(aux[13])};
	    if(String(disciplinaDesejada) != "null" && String(disciplinaDesejada) != String(aux.disciplina)){
	    	continue;
	    }
	    if(String(anoDesejado)!="null" && String(aux.ano)!=String(anoDesejado)){
	    	continue;
	    }
	    recursos.push(aux);
	}

	//processamento de consulta por descritores
	if(buscarPorDescritores == true){
		descritoresArray = descritoresDesejados.split(";");
		recursosComDescritoresDesejados = [];
		for(var i=0; i < recursos.length; i++){
			for(var j=0; j<descritoresArray.length; j++){
				if(recursos[i].descritores.indexOf(descritoresArray[j]) > -1){
					recursosComDescritoresDesejados.push(recursos[i]);
					break;
				}
			}
		}
		recursos = recursosComDescritoresDesejados;
	}

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
		document.getElementById('recurso'+auxCount).style.display = "block";
		auxCount++;
	}

	//colocando os links para passar de página
	//pagina+1 para calcular quantos recursos temos, se tiver menos recursos que o maximo das paginas, é a ultima
	document.getElementById("paginaAtual").innerHTML='&nbsp;'+ (pagina+1) + '&nbsp;';
	if((pagina+1)*8 >= recursos.length){
		document.getElementById("proximaPagina").style.visibility = "hidden";
	}else{
		var proximaPaginaUrl = urlString.replace('p='+pagina,'p='+(pagina+1))
		document.getElementById('proximaPagina').href=proximaPaginaUrl;
		document.getElementById("proximaPagina").innerHTML=' '+(pagina+2)+'&raquo;';
	}

	if(pagina == 0){
		document.getElementById("paginaAnterior").style.visibility = "hidden";
	}else{
		var paginaAnteriorUrl = urlString.replace('p='+pagina,'p='+(pagina-1))
		document.getElementById('paginaAnterior').href=paginaAnteriorUrl;
		document.getElementById("paginaAnterior").innerHTML='&laquo;'+pagina;	
	}

	if(recursos.length == 0){
		//alert("testando");
		document.getElementById("nenhumRecurso").style.visibility = "visible";
		document.getElementById("nenhumRecurso").style.padding = "5% 0";
		document.getElementById("paginacao").style.visibility = "hidden";
	}

}


function irPararecurso(n) {
	location.href="../novo-athena/recursocomputador.html?n=" + recursos[n+pagina*8].identidade;
}