$('.dropdown-menu').click(function(e) {
    e.stopPropagation();
});

function checkSearch(){
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
}