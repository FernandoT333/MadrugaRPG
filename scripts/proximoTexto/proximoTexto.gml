function proximoTexto() {
    var ultimoTexto = array_length(texto) - 1;
    var tamanhoTextoAtual = string_length(texto[textoAtual]);
    
    if (tamanhoTextoAtual > caractere) {
    	caractere = tamanhoTextoAtual;
    } else if (textoAtual < ultimoTexto) {
    	textoAtual++;
        caractere = 0;
    } else {
        alarm[0] = 2;
    }
}