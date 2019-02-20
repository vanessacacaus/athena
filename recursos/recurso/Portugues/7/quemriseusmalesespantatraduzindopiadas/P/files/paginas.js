

var paginasLink  = new Array( './inicio.html','./intro.html','./ativ1.html','./ativ2.html','./ativ3.html','./ativ4.html','./consid.html','./final.html');
var paginasTitle = new Array( 'Início','Texto Inicial','Ativ 1','Ativ 2','Ativ 3','Ativ 4','Saiba Mais','Final');

var pagesHeader = 'Traduzindo piadas';
var pagesTitle  = 'Traduzindo piadas';

function goNext(paginaatual){
	window.location = paginasLink[paginaatual+1];
}
function goPrev(paginaatual){
	window.location = paginasLink[paginaatual-1];
}
function fillNavegacao(paginaatual){

	var text = "";
	for (var i=0;i<paginasLink.length;i++){
		if (paginaatual>i){
		   text = text+'<li><a href="#">'+paginasTitle[i]+'</a></li>';
		}else if (paginaatual==i){
		   text = text+'<li id = "current" >'+paginasTitle[i]+'</li>';
		}else{
			   text = text+'<li>'+paginasTitle[i]+'</li>';			
		}
	}
	document.getElementById("crumbs").innerHTML=text;
}

function setPageTitle(){
	//document.getElementById("title_id").innerHTML=pagesTitle;
	document.title=pagesTitle;
}
function setPageHeader(){
	document.getElementById("header_id").innerHTML=pagesHeader;
}
function fillNavegacaoComLink(paginaatual){

	var text = "";
	for (var i=0;i<paginasLink.length;i++){
		if (paginaatual>i){
		   text = text+'<li><a href="'+paginasLink[i]+'">'+paginasTitle[i]+'</a></li>';
		}else if (paginaatual==i){
		   text = text+'<li id = "current" >'+paginasTitle[i]+'</li>';
		}else{
			   text = text+'<li>'+paginasTitle[i]+'</li>';			
		}
	}
	document.getElementById("crumbs").innerHTML=text;

}
