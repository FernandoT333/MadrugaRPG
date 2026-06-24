function criarVariaveisGlobais() {	
	global.pause = false;
	global.fimJogo = false;
	global.emBatalha = false;
	global.emDialogo = false;
	global.obtendoItem = false;
	global.emTransicao = false;
	global.inimigoColidido = 0;
	
	if (!variable_global_exists("slot")) {
	    global.slot = 0;
	}
}