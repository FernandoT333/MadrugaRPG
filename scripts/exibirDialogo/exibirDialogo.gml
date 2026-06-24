function exibirDialogo(){ 
    var tamanhoListaTexto = array_length(texto);
			
    if (tamanhoListaTexto > 0) {
        var padding = 5;
        var textoExibido = string_copy(texto[textoAtual], 0, caractere);
        var posicaoX = camera_get_view_x(view_camera[0]) + 50;
	    var posicaoY = camera_get_view_y(view_camera[0]) + 100;
	   
	    var altura = 50;
	    var largura = room_width - 300;
	    
	    draw_set_alpha(image_alpha);
	    
	    draw_sprite_stretched(sprCaixa, 0, posicaoX, posicaoY, largura, altura); 
	    
	    var posicaoXTexto = posicaoX + padding;
	    
	    draw_set_font(fntIInfoNome);
	    draw_set_color(c_white);
	    //draw_text(posicaoXTexto, posicaoY + 7, textoExibido);
	    draw_text_transformed(posicaoXTexto, posicaoY + 8, textoExibido, 0.5, 0.5, image_angle);
        
        if (alarm[1] < 0 && string_length(texto[textoAtual]) > caractere) {
        	alarm[1] = 2;
        }
    }

}