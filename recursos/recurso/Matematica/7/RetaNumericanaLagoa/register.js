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
			if(e == 'duplicate-email') return "E-mail já cadastrado";
			if(e == 'email') return "E-mail inválido";
			if(e == 'password') return "Senha inválida";
			if(e == 'name') return "Nome inválido";
			if(e == 'segmento') return "Segmento inválido";
			if(e == 'perfil') return "Perfil inválido";
			if(e == 'city') return "Cidade inválida";
			if(e == 'state') return "Estado inválido";
			if(e == 'studentSegment') return "Selecione um segmento";
			if(e == 'teacherSegment') return "Selecione um segmento";
			if(e == 'confirm-password') return "As senhas não conferem";
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
