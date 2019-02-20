
function getCheckedValue(radioObj) {
	if(!radioObj)
		return "";
	var radioLength = radioObj.length;
	if(radioLength == undefined)
		if(radioObj.checked)
			return radioObj.value;
		else
			return "";
	for(var i = 0; i < radioLength; i++) {
		if(radioObj[i].checked) {
			return radioObj[i].value;
		}
	}
	return "";
}

function getProjPage(){
	return 'http://www.iel.unicamp.br/projetos/conexaolinguagem/';
}

function validateAnswerVF3Q(r1,r2,r3){
	  var radio = document.getElementsByName("v1");
	  var t1 = getCheckedValue(radio);
	 
	  radio = document.getElementsByName("v2");
	  var t2 = getCheckedValue(radio);
	  
	  radio = document.getElementsByName("v3");
	  var t3 = getCheckedValue(radio);
				
	  var msgEmpty = "Por favor, escolha uma alternativa.";
	  var resp1 =  msgEmpty;
	  var resp2 =  msgEmpty;
	  var resp3 =  msgEmpty;

	if (t1!=""){
		if ( r1==t1 ){
			resp1=document.getElementById("respOK1").innerHTML;
		}else{
			resp1 =  document.getElementById("respFalse1").innerHTML;
		}
	}
	if (t2!=""){
		if ( r2==t2 ){
			resp2=document.getElementById("respOK2").innerHTML;
		}else{
			resp2 =  document.getElementById("respFalse2").innerHTML;
		}
	}
	if (t3!=""){
		if ( r3==t3 ){
			resp3=document.getElementById("respOK3").innerHTML;
		}else{
			resp3 =  document.getElementById("respFalse3").innerHTML;
		}
	}

	var resp = '1. '+resp1+'<br><br>'+'2. '+resp2+'<br><br>'+'3. '+resp3+'<br><br>';
	document.getElementById('feedback').innerHTML=resp;
}

function validateAnswerVFSimple(r1,r2,r3){
	  var resp = "Primeiro responda todas as questões.";

	  var radio = document.getElementsByName("v1");
	  var t1 = getCheckedValue(radio);
	 
	  radio = document.getElementsByName("v2");
	  var t2 = getCheckedValue(radio);
	  radio = document.getElementsByName("v3");
	  var t3 = getCheckedValue(radio);
					

    if (t1==""||t2==""||t3==""){
    	resp = "Primeiro responda todas as questões.";
    }else{
		resp =  document.getElementById("respFalse").innerHTML;
		if ( r1==t1 && r2==t2&& r3==t3){
			resp=document.getElementById("respOK").innerHTML;
		}
    }
	 document.getElementById('feedback').innerHTML=resp;
}

function validateAnswer(){
  var radio = document.getElementsByName("quests");
  var choice = getCheckedValue(radio);
  var textresp = "Por favor escolha uma das alternativas para responder a questão";
  if (choice){
     textresp = document.getElementById(choice).innerHTML;
  }
  document.getElementById('feedback').innerHTML=textresp;

}
function validateAnswerText3resp(r1,r2,r3){
	var resp = "Primeiro responda todas as questões.";
	var pt1 =  document.getElementById('v1').value;
	var pt2 =  document.getElementById('v2').value;
	var pt3 =  document.getElementById('v3').value;
	if (pt1==""||pt2==""||pt3==""){
	}else{
	
		var t1 =  pt1.trim().toUpperCase();
		var t2 =  pt2.trim().toUpperCase();
		var t3 =  pt3.trim().toUpperCase();
	
		var resp1 =  document.getElementById("respFalse1").innerHTML;
		var resp2 =  document.getElementById("respFalse2").innerHTML;
		var resp3 =  document.getElementById("respFalse3").innerHTML;

		if (r1.toUpperCase()==t1 ){
			resp1=document.getElementById("respOK1").innerHTML;
		}
		if ( r2.toUpperCase()==t2 ){
			resp2=document.getElementById("respOK2").innerHTML;
		}
		if ( r3.toUpperCase()==t3 ){
			resp3=document.getElementById("respOK3").innerHTML;
		}

		var resp = '1. '+resp1+'<br><br>'+'2. '+resp2+'<br><br>'+'3. '+resp3+'<br><br>';

	}
	 document.getElementById('feedback').innerHTML=resp;
	

}

String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g, '');
}
function validateAnswerText(r1,r2,r3){
	var resp = "Primeiro responda todas as questões.";
	var pt1 =  document.getElementById('v1').value;
	var pt2 =  document.getElementById('v2').value;
	var pt3 =  document.getElementById('v3').value;
	if (pt1==""||pt2==""||pt3==""){
	}else{
	
		var t1 =  pt1.trim().toUpperCase();
		var t2 =  pt2.trim().toUpperCase();
		var t3 =  pt3.trim().toUpperCase();
	
		resp =  document.getElementById("respFalse").innerHTML;
		if ( r1.toUpperCase()==t1 && r2.toUpperCase()==t2&& r3.toUpperCase()==t3){
			resp=document.getElementById("respOK").innerHTML;
		}
	}
	 document.getElementById('feedback').innerHTML=resp;
	

}
function setupPage(){
	fillNavegacao(mypage);
	setPageTitle();
	setPageHeader();
	copyConteudo('panecentral_src','panecentral');
	copyConteudo('paneleft_src','paneleft');
}

function copyConteudo(src, dest){
	var src_obj = document.getElementById(src);
	var dest_obj = document.getElementById(dest);
	if (src_obj!=null && dest_obj!=null){
		dest_obj.innerHTML = src_obj.innerHTML;
	}
	
}





// Início do código de Aumentar/ Diminuir a letra
 
// Para usar coloque o comando: "javascript:mudaTamanho('tag_ou_id_alvo', -1);" para diminuir
// e o comando "javascript:mudaTamanho('tag_ou_id_alvo', +1);" para aumentar
 
var tagAlvo = new Array('p'); //pega todas as tags p//
 
// Especificando os possíveis tamanhos de fontes, poderia ser: x-small, small...
var tamanhos = new Array( '7px','8px','9px','10px','11px','12px','13px','14px','15px','16px','17px','18px','20px','24px' );
var tamanhoInicial = 6;
var QUESTION_ANSWERED = 'ok';

function mudaTamanho(incremento){
	
	var tamanho = tamanhoInicial;
	  tamanho += incremento;
	  if ( tamanho < 0 ) tamanho = 0;
	  if ( tamanho > 14 ) tamanho = 14;
	  tamanhoInicial = tamanho;
	
	mudaTamanhoInt('contentsright',tamanho);
	mudaTamanhoInt('contentsleft',tamanho);
	mudaTamanhoInt('contentscenter',tamanho);
}

function mudaTamanhoInt( idAlvo,tamanho ){
  if (!document.getElementById) return
  var selecionados = null,i,j,tagsAlvo;
  if ( !( selecionados = document.getElementById( idAlvo ) ) ) selecionados = document.getElementsByTagName( idAlvo )[ 0 ];
  if (selecionados){
  selecionados.style.fontSize = tamanhos[ tamanho ];
  
  for ( i = 0; i < tagAlvo.length; i++ ){
    tagsAlvo = selecionados.getElementsByTagName( tagAlvo[ i ] );
    for ( j = 0; j < tagsAlvo.length; j++ ) tagsAlvo[ j ].style.fontSize = tamanhos[ tamanho ];
  }
  }
}



function createCookie(name,value) {
     document.cookie = name+"="+value+"; path=/";
}

function setResponse(mypage){
	createCookie('question'+mypage,QUESTION_ANSWERED);
}



function createCookieWithDate(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name,"");
}

function clearCookies(){
	eraseCookie('question'+1);
	eraseCookie('question'+2);
	eraseCookie('question'+3);
	eraseCookie('question'+4);
	eraseCookie('question'+5);
	eraseCookie('question'+6);
	eraseCookie('question'+7);
	eraseCookie('question'+8);
}

function getQuestionCookieByPage(pagenum){
	var cookval = readCookie('question'+pagenum);
	if (QUESTION_ANSWERED==cookval) return 'Respondida';
	return 'Em branco';
}