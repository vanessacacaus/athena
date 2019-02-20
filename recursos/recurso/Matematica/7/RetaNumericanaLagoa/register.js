jQuery(function($){
	var modal = $(".modal");
	
	function hide(){
		modal.fadeOut("normal", function(){
			$('body').removeClass("modal-open");
		})
	}
	
	modal.find(".close").click(hide);
	modal.click(function(e){
		if($(e.target).is(".modal-center")) hide();
	});
	
	
	var loginForm = $('.login-form');
	var registerForm = $('.register-form');
	
	$('.to-login').click(function(){
		modal.removeClass("register-mode");
		loginForm.removeClass("none");
		registerForm.addClass('none');
		$('.title').html("Login");
	});
	
	$('.to-register').click(function(){
		modal.addClass("register-mode");
		registerForm.removeClass('none');
		loginForm.addClass("none");
		$('.title').html("Cadastro");
	});
	
	function onRegisterSubmit(){
		if(registerForm.find("[name=password]").val() != registerForm.find("[name='confirm-password']").val()){
			showError("confirm-password");
			return false;
		}
		
		function getError(e){
			if(e == 'network-error') return "Erro na rede";
			if(e == 'duplicate-email') return "E-mail j� cadastrado";
			if(e == 'email') return "E-mail inv�lido";
			if(e == 'password') return "Senha inv�lida";
			if(e == 'name') return "Nome inv�lido";
			if(e == 'segmento') return "Segmento inv�lido";
			if(e == 'perfil') return "Perfil inv�lido";
			if(e == 'city') return "Cidade inv�lida";
			if(e == 'state') return "Estado inv�lido";
			if(e == 'studentSegment') return "Selecione um segmento";
			if(e == 'teacherSegment') return "Selecione um segmento";
			if(e == 'confirm-password') return "As senhas n�o conferem";
			return e;
		}
		
		function showError(e){
			if($.isArray(e))
				registerForm.find('.error-message').removeClass('none').html($(e).map(function(){return getError(this);}).toArray().join(", "));
			else
				registerForm.find('.error-message').removeClass('none').html(getError(e));
		}
		
		function onResult(e){
			if(!e || e.error){
				showError(e.error);
				return;
			}
			location = registerForm.data('ok');
		}
		
		$.ajax({
			url: registerForm.attr("action"),
			type:"POST",
			data: registerForm.serialize(),
			dataType: "json",
			success: onResult,
			error: function(){onResult({error:"network-error"});}
		});
		
		return false;
	}
	
	registerForm.submit(onRegisterSubmit);
	
	
	registerForm.find("[name=perfil]").change(function(){
		var perfil = registerForm.find("[name=perfil]:checked").val();
		registerForm.find(".segment").removeClass("none");
		if(perfil == "Professor"){
			registerForm.find(".student-segment").addClass("none");
			registerForm.find(".teacher-segment").removeClass("none");
			return;
		}
		
		registerForm.find(".student-segment").removeClass("none");
		registerForm.find(".teacher-segment").addClass("none");
	});
	
});
