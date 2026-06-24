function executarMenuPausa() {
	var emBatalha = global.emBatalha;
	var emDialogo = global.emDialogo;
	var obtendoItem = global.obtendoItem;
	var emTransicao = global.emTransicao;
	
	if (!obtendoItem && !emTransicao && !emBatalha && !emDialogo) {
	    var pause = global.pause;
		
		if (pause) {
			
		    global.pause = false;
			instance_activate_all();
			instance_destroy(objMenuPausa);
			instance_destroy(objIconePlayerInventario);
		}
		else {
			objPlayerOW.cima = false;
			objPlayerOW.baixo = false;
			objPlayerOW.esquerda = false;
			objPlayerOW.direita = false;
			
			var ficha = variable_clone(objPlayerOW.ficha);
			var posicaoX = camera_get_view_x(view_camera[0]) + 88;
			var posicaoY = camera_get_view_y(view_camera[0]) + 10;
			
			global.pause = true;
			instance_deactivate_all(true);
			instance_activate_object(Ficha);
			instance_activate_object(objColisao);
			instance_activate_object(objMoldura);
			instance_activate_object(objGamepad);
			instance_activate_object(objInventario);
			instance_activate_object(objConfiguracoes);
			
			instance_create_depth(posicaoX, posicaoY,  -99999, objMenuPausa, {fichaMadruga: ficha});
		}
	}
}