	var recursos = []; 
	var recursosAnd = [];
	var recurso1 = {
		miniatura: "recursos/img/Portugues/brincandocomasvogais.png", 
		nome: "Brincando com as vogais",
		ano: "1",
		id: "1"
	};
	recursos.push(recurso1);
	
	var recurso2 = {
		miniatura: "recursos/img/Portugues/noimensomarazul.png", 
		nome: "No imenso mar azul",
		ano: "1",
		id: "50"
	};
	recursos.push(recurso2);

	var recurso3 = {
		miniatura: "recursos/img/Portugues/perdidoseseparados.png", 
		nome: "Perdidos e separados",
		ano: "6",
		id: "100"
	};
	recursos.push(recurso3);

	var recurso4 = {
		miniatura: "recursos/img/Portugues/acidadecomotexto.png", 
		nome: "A cidade como texto",
		ano: "8",
		id: "150"
	};
	recursos.push(recurso4);

	var recurso5 = {
		miniatura: "recursos/img/Matematica/circuloMagico.png", 
		nome: "Cí­rculo Mágico",
		ano: "3",
		id: "200"
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
		miniatura: "recursos/img/Portugues/quemriseusmalesespantapiadasegatilhos.png", 
		nome: "Quem ri seus males espanta: Piadas e gatilhos",
		ano: "7",
		id: "125"
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
		id: "175"
	};
	recursos.push(recurso10);

//recursos android
	var recursoA1 = {
		miniatura: "recursos/img/Mobile/Matematica/1/adicaoesubtracao.jpg", 
		nome: "Adição e subtração",
		ano: "1",
		id: "70"
	};
	recursosAnd.push(recursoA1);

	var recursoA2 = {
		miniatura: "recursos/img/Mobile/Portugues/2/luzdosaber.jpg", 
		nome: "Luz do saber",
		ano: "2",
		id: "17"
	};
	recursosAnd.push(recursoA2);

	var recursoA3 = {
		miniatura: "recursos/img/Mobile/Matematica/1/adicaoesubtracao.jpg", 
		nome: "Enigma Matemático com Varas",
		ano: "5",
		id: "93"
	};
	recursosAnd.push(recursoA3);

	var recursoA4 = {
		miniatura: "recursos/img/Mobile/Portugues/9/gramaticadebolso.jpg", 
		nome: "Gramática de bolso",
		ano: "9",
		id: "67"
	};
	recursosAnd.push(recursoA4);

	var recursoA5 = {
miniatura: "recursos/img/Mobile/Matematica/3/jogospara2.jpg", 
		nome: "Jogos para 2: Jogo Matemático",
		ano: "3",
		id: "83"
	};
	recursosAnd.push(recursoA5);

	var recursoA6 = {
		miniatura: "recursos/img/Mobile/Portugues/1/formapalavras.jpg", 
		nome: "Forma Palavras",
		ano: "1",
		id: "3"
	};
	recursosAnd.push(recursoA6);

	var recursoA7 = {
		miniatura: "recursos/img/Mobile/Matematica/5/lotofracoes.jpg", 
		nome: "Loto - Frações",
		ano: "3",
		id: "92"
	};
	recursosAnd.push(recursoA7);

	var recursoA8 = {
		miniatura: "recursos/img/Mobile/Portugues/1/brincandocomoalfabeto.jpg", 
		nome: "Brincando com o alfabeto",
		ano: "1",
		id: "10"
	};
	recursosAnd.push(recursoA8);

	var recursoA9 = {
		miniatura: "recursos/img/Mobile/Matematica/4/matematicabasica.jpg", 
		nome: "Matemática básica 1, 2 frações",
		ano: "4",
		id: "86"
	};
	recursosAnd.push(recursoA9);	

	var recursoA10 = {
		miniatura: "recursos/img/Mobile/Portugues/5/Acentuando.jpg", 
		nome: "Acentuando",
		ano: "5",
		id: "39"
	};
	recursosAnd.push(recursoA10);


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


//recursos android
		document.getElementById('recursoA1').children[0].src = recursosAnd[0].miniatura;
		document.getElementById('recursoA1').children[1].innerHTML = recursosAnd[0].nome;
		document.getElementById('recursoA1').children[2].innerHTML = recursosAnd[0].ano+"º ano";

		document.getElementById('recursoA2').children[0].src = recursosAnd[1].miniatura;
		document.getElementById('recursoA2').children[1].innerHTML = recursosAnd[1].nome;
		document.getElementById('recursoA2').children[2].innerHTML = recursosAnd[1].ano+"º ano";

		document.getElementById('recursoA3').children[0].src = recursosAnd[2].miniatura;
		document.getElementById('recursoA3').children[1].innerHTML = recursosAnd[2].nome;
		document.getElementById('recursoA3').children[2].innerHTML = recursosAnd[2].ano+"º ano";

		document.getElementById('recursoA4').children[0].src = recursosAnd[3].miniatura;
		document.getElementById('recursoA4').children[1].innerHTML = recursosAnd[3].nome;
		document.getElementById('recursoA4').children[2].innerHTML = recursosAnd[3].ano+"º ano";

		document.getElementById('recursoA5').children[0].src = recursosAnd[4].miniatura;
		document.getElementById('recursoA5').children[1].innerHTML = recursosAnd[4].nome;
		document.getElementById('recursoA5').children[2].innerHTML = recursosAnd[4].ano+"º ano";

		document.getElementById('recursoA6').children[0].src = recursosAnd[5].miniatura;
		document.getElementById('recursoA6').children[1].innerHTML = recursosAnd[5].nome;
		document.getElementById('recursoA6').children[2].innerHTML = recursosAnd[5].ano+"º ano";

		document.getElementById('recursoA7').children[0].src = recursosAnd[6].miniatura;
		document.getElementById('recursoA7').children[1].innerHTML = recursosAnd[6].nome;
		document.getElementById('recursoA7').children[2].innerHTML = recursosAnd[6].ano+"º ano";

		document.getElementById('recursoA8').children[0].src = recursosAnd[7].miniatura;
		document.getElementById('recursoA8').children[1].innerHTML = recursosAnd[7].nome;
		document.getElementById('recursoA8').children[2].innerHTML = recursosAnd[7].ano+"º ano";

		document.getElementById('recursoA9').children[0].src = recursosAnd[8].miniatura;
		document.getElementById('recursoA9').children[1].innerHTML = recursosAnd[8].nome;
		document.getElementById('recursoA9').children[2].innerHTML = recursosAnd[8].ano+"º ano";

		document.getElementById('recursoA10').children[0].src = recursosAnd[9].miniatura;
		document.getElementById('recursoA10').children[1].innerHTML = recursosAnd[9].nome;
		document.getElementById('recursoA10').children[2].innerHTML = recursosAnd[9].ano+"º ano";

		function page(n) {
			location.href="../novo-athena/recursocomputador.html?n=" + recursos[n].id;
		}

		function pageAnd(n) {
			location.href="../novo-athena/recursomobile.html?n=" + recursosAnd[n].id;
		}