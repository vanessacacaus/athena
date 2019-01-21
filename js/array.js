var recurso1 = {img: "file:///C:/Users/vanes/Downloads/novo-athena/img/home/recursos/matematicaMovel/recurso1.png", titulo: "Matematica selvagem", ano: "pré-escola"};
alert(recurso1.img);
document.getElementById("imagemRec").src = recurso1.img;
document.getElementById("tituloRec").innerHTML = recurso1.titulo;
document.getElementById("textoRec").innerHTML = recurso1.ano;