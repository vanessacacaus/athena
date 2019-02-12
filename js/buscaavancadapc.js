function checkDescritors(materia, ano){
    if(materia == "" || ano == "") {
        document.getElementById('t').disabled=true;
        $('#t').empty();
        $('#t').append('<option value="">Descritor</option>');
    }else{
        document.getElementById('t').disabled=false;
        if(materia == 'lp'){
            if(ano >= 08){
                $('#t').empty();
                $('#t').append('<option value="">Descritor</option>');
                $('#t').append('<option value="DPII01;DPII03;DPII04;DPII06;DPII11">Procedimentos de Leitura</option>');
                $('#t').append('<option value="DPII05;DPII09">Implicações do suporte, gênero e/ou enunciador na compreensão do texto</option>');
                $('#t').append('<option value="DPII15">Relação entre textos</option>');
                $('#t').append('<option value="DPII02;DPII07;DPII08;DPII12">Coerência e coesão no processamento do texto</option>'); 
                $('#t').append('<option value="DPII13;DPII14">Relação entre recursos expressivos e efeitos de sentido</option>'); 
                $('#t').append('<option value="DPII10">variação linguística</option>');  
            }else{
                $('#t').empty();
                $('#t').append('<option value="">Descritor</option>');
                $('#t').append('<option value="DPI01;DPI03;DPI04;DPI06;DPI14">Procedimentos de Leitura</option>');
                $('#t').append('<option value="DPI05;DPI12">Implicações do suporte, gênero e/ou enunciador na compreensão do texto</option>');
                $('#t').append('<option value="DPI20;DPI21">Relação entre textos</option>');
                $('#t').append('<option value="DPI02;DPI10;DPI11;DPI15;DPI07;DPI08;DPI09">Coerência e coesão no processamento do texto</option>');
                $('#t').append('<option value="DPI16;DPI17;DPI18;DPI19">Relação entre recursos expressivos e efeitos de sentido</option>');
                $('#t').append('<option value="DPI13">variação linguística</option>');
            }
        }else{//matematica
            if(ano >= 08){
                $('#t').empty();
                $('#t').append('<option value="">Descritor</option>');
                $('#t').append('<option value="DMII01;DMII02;DMII03;DMII04;DMII05">Espaço e forma</option>');
                $('#t').append('<option value="DMII06;DMII07;DMII08;DMII09;DMII10;DMII11;DMII12">Grandezas e medidas</option>');
                $('#t').append('<option value="DMII13;DMII14;DMII15;DMII16;DMII17;DMII18;DMII19;DMII20;DMII21;DMII22;DMII23;DMII24;DMII25;DMII26">Números e operações - álgebra e funções</option>'); 
                $('#t').append('<option value="DMII27;DMII28">Tratamento da informação</option>');
            }
            else{
                $('#t').empty();
                $('#t').append('<option value="">Descritor</option>');
                $('#t').append('<option value="DMI01;DMI02;DMI03;DMI04;DMI05;DMI06;DMI07;DMI08;DMI09;DMI10;DMI11">Espaço e forma</option>');
                $('#t').append('<option value="DMI12;DMI13;DMI14;DMI15">Grandezas e medidas</option>');
                $('#t').append('<option value="DMI16;DMI17;DMI18;DMI19;DMI20;DMI21;DMI22;DMI23;DMI24;DMI25;DMI26;DMI27;DMI28;DMI29;DMI30;DMI31;DMI32;DMI33;DMI34;DMI35">Números e operações - álgebra e funções</option>');
                $('#t').append('<option value="DMI36;DMI37">Tratamento da informação</option>');
            }
        }
    }
}

/*function checkSearch(){
	var x = document.forms["formsearch"]["h"].value;
	if (x == "") {
		swal({
		    title: "Escolha uma plataforma!",
		    text: "Você deve escolher ao menos uma plataforma para buscar recursos: Android ou computador.",
		    type: 'error',
		    confirmButtonColor: '#3085d6',
		    confirmButtonText: 'Ok!'
		    });
		return false;
	}else{
		if(x=="pc"){
			$('#formsearch').attr('action', 'resultadobuscapc.html');
		}else{
			$('#formsearch').attr('action', 'resultadobuscaand.html');
		}
	}
    var input = document.createElement("input");
    input.type = "text";
    input.name = "p";
    input.value = "0";
    input.style.visibility = "hidden";
    document.forms["formsearch"].appendChild(input);
	return true;
}*/