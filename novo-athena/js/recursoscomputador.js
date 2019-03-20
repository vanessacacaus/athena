var recursos = []; 
//recursos de matematica
	var recurso1 = {
		miniatura: "recursos/img/Matematica/Arrumeoquarto.png", 
		nome: "Arrume o Quarto",
		ano: "1",
		id: "176"
	};
	recursos.push(recurso1);
	 
	var recurso2 = {
		miniatura: "recursos/img/Matematica/4Cores.png", 
		nome: "4 Cores",
		ano: "2",
		id: "191"
	};
	recursos.push(recurso2);

	var recurso3 = {
		miniatura: "recursos/img/Matematica/circuloMagico.png", 
		nome: "Cí­rculo Mágico",
		ano: "3",
		id: "200"
	};
	recursos.push(recurso3);

	var recurso4 = {
		miniatura: "recursos/img/Matematica/Acerte.png", 
		nome: "Acerte o Resultado",
		ano: "3",
		id: "214"
	};
	recursos.push(recurso4);

	var recurso5 = {
		miniatura: "recursos/img/Matematica/ehobicho.png", 
		nome: "Eh o Bicho",
		ano: "4",
		id: "230"
	};
	recursos.push(recurso5);

	var recurso6 = {
		miniatura: "recursos/img/Matematica/arrumeOperacoes.png", 
		nome: "Arrume Operações",
		ano: "6",
		id: "250"
	};
	recursos.push(recurso6);

	var recurso7 = {
		miniatura: "recursos/img/Matematica/demonstracao_da_area_do_circulo.png", 
		nome: "Demonstração da área do cí­rculo",
		ano: "9",
		id: "300"
	};
	recursos.push(recurso7);

	var recurso8 = {
		miniatura: "recursos/img/Matematica/tabuada9.PNG", 
		nome: "Tabuada 9",
		ano: "5",
		id: "245"
	};
	recursos.push(recurso8);

	var recurso9 = {
		miniatura: "recursos/img/Matematica/muroNumerico.png", 
		nome: "Muro Numérico",
		ano: "4",
		id: "225"
	};
	recursos.push(recurso9);

	var recurso10 = {
		miniatura: "recursos/img/Matematica/formas.png", 
		nome: "Formas",
		ano: "1",
		id: "173"
	};
	recursos.push(recurso10);


//recursos de portugues

	var recurso11 = {
		miniatura: "recursos/img/Portugues/brincandocomasvogais.png", 
		nome: "Brincando com as vogais",
		ano: "1",
		id: "1"
	};
	recursos.push(recurso11);
	
	var recurso12 = {
		miniatura: "recursos/img/Portugues/noimensomarazul.png", 
		nome: "No imenso mar azul",
		ano: "1",
		id: "50"
	};
	recursos.push(recurso12);

	var recurso13 = {
		miniatura: "recursos/img/Portugues/perdidoseseparados.png", 
		nome: "Perdidos e separados",
		ano: "6",
		id: "100"
	};
	recursos.push(recurso13);

	var recurso14 = {
		miniatura: "recursos/img/Portugues/acidadecomotexto.png", 
		nome: "A cidade como texto",
		ano: "8",
		id: "150"
	};
	recursos.push(recurso14);

	var recurso15 = {
		miniatura: "recursos/img/Portugues/vogais.png", 
		nome: "Vogais",
		ano: "1",
		id: "10"
	};
	recursos.push(recurso15);

	var recurso16 = {
		miniatura: "recursos/img/Portugues/viagemespacial.png", 
		nome: "Viagem Espacial",
		ano: "2",
		id: "20"
	};
	recursos.push(recurso16);

	var recurso17 = {
		miniatura: "recursos/img/Portugues/silaba.png", 
		nome: "Sílaba",
		ano: "3",
		id: "38"
	};
	recursos.push(recurso17);

	var recurso18 = {
		miniatura: "recursos/img/Portugues/ruthrocha.png", 
		nome: "Ruth Rocha",
		ano: "4",
		id: "60"
	};
	recursos.push(recurso18);

	var recurso19 = {
		miniatura: "recursos/img/Portugues/ortografiapalavrascomsc.png", 
		nome: "Ortografia: palavras com sc [Orto e grafia]",
		ano: "5",
		id: "75"
	};
	recursos.push(recurso19);

	var recurso20 = {
		miniatura: "recursos/img/Portugues/vanguardas.png", 
		nome: "Vanguarda",
		ano: "6",
		id: "93"
	};
	recursos.push(recurso20);


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

		document.getElementById('recurso9').children[0].src = recursos[8].miniatura;
		document.getElementById('recurso9').children[1].innerHTML = recursos[8].nome;
		document.getElementById('recurso9').children[2].innerHTML = recursos[8].ano+"º ano";

		document.getElementById('recurso10').children[0].src = recursos[9].miniatura;
		document.getElementById('recurso10').children[1].innerHTML = recursos[9].nome;
		document.getElementById('recurso10').children[2].innerHTML = recursos[9].ano+"º ano";	


//lingua portuguesa
		document.getElementById('recurso11').children[0].src = recursos[10].miniatura;
		document.getElementById('recurso11').children[1].innerHTML = recursos[10].nome;
		document.getElementById('recurso11').children[2].innerHTML = recursos[10].ano+"º ano";

		document.getElementById('recurso12').children[0].src = recursos[11].miniatura;
		document.getElementById('recurso12').children[1].innerHTML = recursos[11].nome;
		document.getElementById('recurso12').children[2].innerHTML = recursos[11].ano+"º ano";

		document.getElementById('recurso13').children[0].src = recursos[12].miniatura;
		document.getElementById('recurso13').children[1].innerHTML = recursos[12].nome;
		document.getElementById('recurso13').children[2].innerHTML = recursos[12].ano+"º ano";

		document.getElementById('recurso14').children[0].src = recursos[13].miniatura;
		document.getElementById('recurso14').children[1].innerHTML = recursos[13].nome;
		document.getElementById('recurso14').children[2].innerHTML = recursos[13].ano+"º ano";

		document.getElementById('recurso15').children[0].src = recursos[14].miniatura;
		document.getElementById('recurso15').children[1].innerHTML = recursos[14].nome;
		document.getElementById('recurso15').children[2].innerHTML = recursos[14].ano+"º ano";

		document.getElementById('recurso16').children[0].src = recursos[15].miniatura;
		document.getElementById('recurso16').children[1].innerHTML = recursos[15].nome;
		document.getElementById('recurso16').children[2].innerHTML = recursos[15].ano+"º ano";

		document.getElementById('recurso17').children[0].src = recursos[16].miniatura;
		document.getElementById('recurso17').children[1].innerHTML = recursos[16].nome;
		document.getElementById('recurso17').children[2].innerHTML = recursos[16].ano+"º ano";

		document.getElementById('recurso18').children[0].src = recursos[17].miniatura;
		document.getElementById('recurso18').children[1].innerHTML = recursos[17].nome;
		document.getElementById('recurso18').children[2].innerHTML = recursos[17].ano+"º ano";		

		document.getElementById('recurso19').children[0].src = recursos[18].miniatura;
		document.getElementById('recurso19').children[1].innerHTML = recursos[18].nome;
		document.getElementById('recurso19').children[2].innerHTML = recursos[18].ano+"º ano";

		document.getElementById('recurso20').children[0].src = recursos[19].miniatura;
		document.getElementById('recurso20').children[1].innerHTML = recursos[19].nome;
		document.getElementById('recurso20').children[2].innerHTML = recursos[19].ano+"º ano";	
		
		function page(n) {
			location.href="../novo-athena/recursocomputador.html?n=" + recursos[n].id;
		}