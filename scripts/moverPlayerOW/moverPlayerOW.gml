function moverPlayerOW() {
		var emDialogo = global.emDialogo;
		var obtendoItem = global.obtendoItem;
		var emTransicao = global.emTransicao;
		
		if (!obtendoItem && !emDialogo && !emTransicao) {
			var emMovimento = (baixo || cima || direita || esquerda);
			
			if (emMovimento) {
				var movimentoVertical = (baixo - cima);
				var movimentoHorizontal = (direita - esquerda);
				var velocidade = (direita && esquerda) || (baixo && cima) ? 0 : 2; 
				
				direcao = point_direction(x, y, x + movimentoHorizontal, y + movimentoVertical);
				
				movimentoVertical = lengthdir_y(velocidade, direcao);
				movimentoHorizontal = lengthdir_x(velocidade, direcao);
				
				//Ajuste na velocidade para corrigir o bug de shaking do objeto ao andar na diagonal
				if (movimentoVertical != 0 && movimentoHorizontal  != 0) {
					movimentoVertical = floor(movimentoVertical) ;
					movimentoHorizontal = floor(movimentoHorizontal) ;
					
					if (movimentoVertical > 0) {
					    movimentoVertical += 1;
					}
					
					if (movimentoHorizontal > 0) {
					    movimentoHorizontal += 1;
					}
				}
				
				movimentoVertical = checarColisaoVertical(movimentoVertical) ;
				movimentoHorizontal = checarColisaoHorizontal(movimentoHorizontal) ;
				
				y += movimentoVertical;
				x += movimentoHorizontal;
			}
		}
}