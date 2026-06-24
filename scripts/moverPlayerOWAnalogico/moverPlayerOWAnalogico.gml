function moverPlayerOWAnalogico(direcaoAnalogico) {
		var emDialogo = global.emDialogo;
		var obtendoItem = global.obtendoItem;
		var emTransicao = global.emTransicao;
		
		if (!obtendoItem && !emDialogo && !emTransicao) {
			direcao = direcaoAnalogico;
			var emMovimentoDPad = (baixo || cima || direita || esquerda);
			
			if (!emMovimentoDPad) {
				var velocidade = velocidadeAnalogico >  2 ? 2 : velocidadeAnalogico; 
				
				var movimentoVertical = lengthdir_y(velocidade, direcao);
				var movimentoHorizontal = lengthdir_x(velocidade, direcao);
				
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