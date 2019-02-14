//    alert($("div").scrollTop() + " px");



/*if($("#randroidcontainer").scrollLeft() < 1){
	document.getElementById('botaosliderEsquerda').style.visibility = "hidden";
}
if($("#randroidcontainer").scrollLeft() > 1){
	document.getElementById('botaosliderEsquerda').style.visibility = "visible";
}

if($("#randroidcontainer").scrollLeft() > 1450){
	document.getElementById('botaosliderDireita').style.visibility = "hidden";
}*/

function scrollToRight(a){
	$(a).animate({scrollLeft:'+=200'}, 500);
	//alert($("#randroidcontainer").scrollLeft());
}

function scrollToLeft(a){
	$(a).animate({scrollLeft:'-=200'}, 500);
	//alert($("#randroidcontainer").scrollLeft());
}
