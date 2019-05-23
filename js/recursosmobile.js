var recursos = []; 
//recursos de matematica
	var recurso1 = {
		miniatura: "recursos/img/Mobile/Matematica/1/adicaoesubtracao.jpg", 
		nome: "Adição e subtração",
		ano: "1",
		id: "70"
	}; 
	recursos.push(recurso1);
	 
	var recurso2 = {
		miniatura: "recursos/img/Mobile/Matematica/1/adicaoesubtracao.jpg", 
		nome: "Enigma Matemático com Varas",
		ano: "5",
		id: "93"
	};
	recursos.push(recurso2);

	var recurso3 = {
		miniatura: "recursos/img/Mobile/Matematica/2/jematematicatabuada.jpg", 
		nome: "Jogos educativos de Matemática: adição, tabuada",
		ano: "2",
		id: "75"
	};
	recursos.push(recurso3);

	var recurso4 = {
		miniatura: "recursos/img/Mobile/Matematica/3/jogospara2.jpg", 
		nome: "Jogos para 2: Jogo Matemático",
		ano: "3",
		id: "83"
	};
	recursos.push(recurso4);

	var recurso5 = {
		miniatura: "recursos/img/Mobile/Matematica/5/lotofracoes.jpg", 
		nome: "Loto - Frações",
		ano: "3",
		id: "92"
	};
	recursos.push(recurso5);

	var recurso6 = {
		miniatura: "recursos/img/Mobile/Matematica/4/matematicabasica.jpg", 
		nome: "Matemática básica 1, 2 frações",
		ano: "4",
		id: "86"
	};
	recursos.push(recurso6);

	var recurso7 = {
		miniatura: "recursos/img/Mobile/Matematica/7/mathmaster.jpg", 
		nome: "Math Master - Brain Quizzes & Math Puzzles",
		ano: "7",
		id: "102"
	};
	recursos.push(recurso7);

	var recurso8 = {
		miniatura: "recursos/img/Mobile/Matematica/6/mestredamatematica.jpg", 
		nome: "Mestre da Matemática Jogo Educativo e Exercícios",
		ano: "6",
		id: "94"
	};
	recursos.push(recurso8);

	var recurso9 = {
		miniatura: "recursos/img/Mobile/Matematica/5/representarporfracoes.jpg", 
		nome: "Representar por frações",
		ano: "5",
		id: "91"
	};
	recursos.push(recurso9);

	var recurso10 = {
		miniatura: "recursos/img/Mobile/Matematica/9/treinaequacao.jpg", 
		nome: "Treina Equação",
		ano: "9",
		id: "110"
	};
	recursos.push(recurso10);


//recursos de portugues

	var recurso11 = {
		//G:\novo-athena22.04\recursos\img\Mobile\Portugues\inicial
		miniatura: "recursos/img/Mobile/Portugues/5/Acentuando.jpg", 
		nome: "Acentuando",
		ano: "5",
		id: "39"
	};
	recursos.push(recurso11);
	
	var recurso12 = {
		miniatura: "recursos/img/Mobile/Portugues/1/brincandocomoalfabeto.jpg", 
		nome: "Brincando com o alfabeto",
		ano: "1",
		id: "10"
	};
	recursos.push(recurso12);

	var recurso13 = {
		miniatura: "recursos/img/Mobile/Portugues/1/formapalavras.jpg", 
		nome: "Forma Palavras",
		ano: "1",
		id: "3"
	};
	recursos.push(recurso13);

	var recurso14 = {
		miniatura: "recursos/img/Mobile/Portugues/9/gramaticadebolso.jpg", 
		nome: "Gramática de bolso",
		ano: "9",
		id: "67"
	};
	recursos.push(recurso14);

	var recurso15 = {
		miniatura: "recursos/img/Mobile/Portugues/2/lelesilabas.jpg", 
		nome: "Lele sílabas",
		ano: "2",
		id: "11"
	};
	recursos.push(recurso15);

	var recurso16 = {
		miniatura: "recursos/img/Mobile/Portugues/2/luzdosaber.jpg", 
		nome: "Luz do saber",
		ano: "2",
		id: "17"
	};
	recursos.push(recurso16);

	var recurso17 = {
		miniatura: "recursos/img/Mobile/Portugues/8/mistercrase.jpg", 
		nome: "Mister Crase",
		ano: "8",
		id: "58"
	};
	recursos.push(recurso17);

	var recurso18 = {
		miniatura: "recursos/img/Mobile/Portugues/6/montapalavras.jpg", 
		nome: "Monta palavras",
		ano: "6",
		id: "47"
	};
	recursos.push(recurso18);

	var recurso19 = {
		miniatura: "recursos/img/Mobile/Portugues/4/mundoleitorfabulas.jpg", 
		nome: "Mundo Leitor - Fábulas",
		ano: "4",
		id: "30"
	};
	recursos.push(recurso19);

	var recurso20 = {
		miniatura: "recursos/img/Mobile/Portugues/3/oraptodavaca.jpg", 
		nome: "O rapto da vaca sagrada",
		ano: "3",
		id: "22"
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
		
		function pageAnd(n) {
			location.href="../novo-athena/recursomobile.html?n=" + recursos[n].id;
		}