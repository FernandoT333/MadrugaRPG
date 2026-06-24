function perseguirPlayerInimigoOW() {
	var emDialogo = global.emDialogo;
	var obtendoItem = global.obtendoItem;
	var emTransicao = global.emTransicao;
	
	if (!obtendoItem && !emDialogo && !emTransicao) {
		image_speed = 1.5;
		var velocidade = 1.3;
		var raioDeFuga = 110;
		var distanciaPlayer = distance_to_object(objPlayerOW);
		direcao = point_direction(x, y, objPlayerOW.x, objPlayerOW.y);
		
		var valorVertical = lengthdir_y(velocidade, direcao);
		var valorHorizontal = lengthdir_x(velocidade, direcao);
		
		var hveloc = checarColisaoHorizontal(valorHorizontal);
		var vveloc = checarColisaoVertical(valorVertical);
		
		x += hveloc;
		y += vveloc;
		
		if (distanciaPlayer >= raioDeFuga) {
		    escolherAcaoInimigoOW();
		}
	}
}