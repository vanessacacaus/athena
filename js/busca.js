var url_string = window.location.href
			var url = new URL(url_string);
			var disciplinaDesejada = url.searchParams.get("d");
			if(String(disciplinaDesejada)=="lp"){
				disciplinaDesejada = "Portugues";
			}else if(String(disciplinaDesejada)=="mat"){
				disciplinaDesejada = "Matematica";
			}else{
				disciplinaDesejada = "null";
			}
			var anoDesejado = url.searchParams.get("a");
			if(String(anoDesejado)==""){
				anoDesejado="null";
			}
			var descritoresDesejados = url.searchParams.get("t");

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
				    if(String(disciplinaDesejada) != "null" && String(disciplinaDesejada) != String(aux.disciplina)){
				    	continue;
				    }
				    if(String(anoDesejado)!="null" && String(aux.ano)!=String(anoDesejado)){
				    	//alert(String(anoDesejado)!="null");
				    	continue;
				    }
				    recursos.push(aux);
				}
				alert(recursos.length);


				document.getElementById('recurso1').children[0].src = recursos[0].miniatura;
				document.getElementById('recurso1').children[1].innerHTML = recursos[0].nome;
				document.getElementById('recurso1').children[2].innerHTML = recursos[0].ano+"º ano";

				document.getElementById('recurso2').children[0].src = recursos[1].miniatura;
				document.getElementById('recurso2').children[1].innerHTML = recursos[1].nome;
				document.getElementById('recurso2').children[2].innerHTML = recursos[1].ano+"º ano";

				document.getElementById('recurso3').children[0].src = recursos[2].miniatura;
				document.getElementById('recurso3').children[1].innerHTML = recursos[2].nome;
				document.getElementById('recurso3').children[2].innerHTML = recursos[2].ano+"º ano";

				document.getElementById('recurso4').children[0].src = recursos[3].miniatura;
				document.getElementById('recurso4').children[1].innerHTML = recursos[3].nome;
				document.getElementById('recurso4').children[2].innerHTML = recursos[3].ano+"º ano";

				document.getElementById('recurso5').children[0].src = recursos[4].miniatura;
				document.getElementById('recurso5').children[1].innerHTML = recursos[4].nome;
				document.getElementById('recurso5').children[2].innerHTML = recursos[4].ano+"º ano";

				document.getElementById('recurso6').children[0].src = recursos[5].miniatura;
				document.getElementById('recurso6').children[1].innerHTML = recursos[5].nome;
				document.getElementById('recurso6').children[2].innerHTML = recursos[5].ano+"º ano";

				document.getElementById('recurso7').children[0].src = recursos[6].miniatura;
				document.getElementById('recurso7').children[1].innerHTML = recursos[6].nome;
				document.getElementById('recurso7').children[2].innerHTML = recursos[6].ano+"º ano";

				document.getElementById('recurso8').children[0].src = recursos[7].miniatura;
				document.getElementById('recurso8').children[1].innerHTML = recursos[7].nome;
				document.getElementById('recurso8').children[2].innerHTML = recursos[7].ano+"º ano";

			}