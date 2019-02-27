	var recursos = [];
	var n;

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

		    recursos.push(aux);

		}
		//alert(recursos.length);
		document.getElementById('recurso1').children[0].src = recursos[0].miniatura;
		document.getElementById('recurso1').children[1].innerHTML = recursos[0].nome;
		document.getElementById('recurso1').children[2].innerHTML = recursos[0].ano+"º ano";

		document.getElementById('recurso2').children[0].src = recursos[20].miniatura;
		document.getElementById('recurso2').children[1].innerHTML = recursos[20].nome;
		document.getElementById('recurso2').children[2].innerHTML = recursos[20].ano+"º ano";

		document.getElementById('recurso3').children[0].src = recursos[51].miniatura;
		document.getElementById('recurso3').children[1].innerHTML = recursos[51].nome;
		document.getElementById('recurso3').children[2].innerHTML = recursos[51].ano+"º ano";

		document.getElementById('recurso4').children[0].src = recursos[81].miniatura;
		document.getElementById('recurso4').children[1].innerHTML = recursos[81].nome;
		document.getElementById('recurso4').children[2].innerHTML = recursos[81].ano+"º ano";

		document.getElementById('recurso5').children[0].src = recursos[110].miniatura;
		document.getElementById('recurso5').children[1].innerHTML = recursos[110].nome;
		document.getElementById('recurso5').children[2].innerHTML = recursos[110].ano+"º ano";

		document.getElementById('recurso6').children[0].src = recursos[150].miniatura;
		document.getElementById('recurso6').children[1].innerHTML = recursos[150].nome;
		document.getElementById('recurso6').children[2].innerHTML = recursos[150].ano+"º ano";

		document.getElementById('recurso7').children[0].src = recursos[180].miniatura;
		document.getElementById('recurso7').children[1].innerHTML = recursos[180].nome;
		document.getElementById('recurso7').children[2].innerHTML = recursos[180].ano+"º ano";

		document.getElementById('recurso8').children[0].src = recursos[210].miniatura;
		document.getElementById('recurso8').children[1].innerHTML = recursos[210].nome;
		document.getElementById('recurso8').children[2].innerHTML = recursos[210].ano+"º ano";		

		document.getElementById('recurso9').children[0].src = recursos[260].miniatura;
		document.getElementById('recurso9').children[1].innerHTML = recursos[260].nome;
		document.getElementById('recurso9').children[2].innerHTML = recursos[260].ano+"º ano";

		document.getElementById('recurso10').children[0].src = recursos[300].miniatura;
		document.getElementById('recurso10').children[1].innerHTML = recursos[300].nome;
		document.getElementById('recurso10').children[2].innerHTML = recursos[300].ano+"º ano";	
	}

	function page(n) {
		location.href="../novo-athena/recursocomputador.html?n=" + recursos[n].identidade;
	}