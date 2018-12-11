window.onload = function main() { //"Ponte a trabajar, no seas Jessie Pinkman"
    $(".seleccion").click(abrirLink);
}

function abrirLink() {
    //El primer [0] es porque jquery devuelve un array con varias cosas, entre otras, el elemento en si en [0]. cells[0] indica su primera td, innerText el texto.
    fila = $(this)[0].cells[0].innerText;
    document.location.href = "./plantilla.php?nif=" + fila;
}