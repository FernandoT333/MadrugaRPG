function checarPlayerProximo() {
	var distancia = 5;
	
	if (
		//Verificar proximidade horizontal
		place_meeting(x + distancia, y, objPlayerOW) ||
		place_meeting(x - distancia, y, objPlayerOW)  ||
		
		//Verificar proximidade vertical
		place_meeting(x, y  + distancia, objPlayerOW) ||
		place_meeting(x, y - distancia, objPlayerOW) 
	) {
	    permiteAbertura = true;
	    permiteIniciarDialogo = true;
	} else {
	    permiteAbertura = false;
	    permiteIniciarDialogo = false;
	}
}