function exibirSpritePlayerOW() {
		var direcaoAtual = 0;
		
		var parado = (
				global.pause || global.obtendoItem || global.emDialogo || global.emTransicao ||
				 (direita && esquerda) || (baixo && cima) ||
				 !(baixo || cima || direita || esquerda) && velocidadeAnalogico <= 0 
		);
		
		if (direcao > 337.5 || direcao < 22.5) {
		    direcaoAtual = DirecoesEnum.Leste;
		}
		else if (direcao > 22.5 && direcao < 67.5) {
		    direcaoAtual = DirecoesEnum.Nordeste;
		}
		else if (direcao > 67.5 && direcao < 112.5) {
		    direcaoAtual = DirecoesEnum.Norte;
		}
		else if (direcao > 112.5 && direcao < 157.5) {
		    direcaoAtual = DirecoesEnum.Noroeste;
		}
		else if (direcao > 157.5 && direcao < 202.5) {
		    direcaoAtual = DirecoesEnum.Oeste;
		}
		else if (direcao > 202.5 && direcao < 247.5) {
		    direcaoAtual = DirecoesEnum.Sudoeste;
		}
		else if (direcao > 247.5 && direcao < 292.5) {
		    direcaoAtual = DirecoesEnum.Sul;
		}
		else if (direcao > 292.5 && direcao < 337.5) {
		    direcaoAtual = DirecoesEnum.Sudeste;
		}
		
		switch (direcaoAtual) {
		    case DirecoesEnum.Leste:
				image_xscale = -1;
		        sprite_index = parado ? sprOWPlayerParadoLateral : sprOWPlayerAndandoLateral;
		        break;
		    case DirecoesEnum.Nordeste:
				image_xscale = -1;
		        sprite_index = parado ? sprOWPlayerParadoDiagonalSuperior : sprOWPlayerAndandoDiagonalSuperior;
		        break;
		    case DirecoesEnum.Norte:
				image_xscale = 1;
		        sprite_index = parado ? sprOWPlayerParadoCima : sprOWPlayerAndandoCima;
		        break;
		    case DirecoesEnum.Noroeste:
				image_xscale = 1;
		        sprite_index = parado ? sprOWPlayerParadoDiagonalSuperior : sprOWPlayerAndandoDiagonalSuperior;
		        break;
		    case DirecoesEnum.Oeste:
				image_xscale = 1;
		        sprite_index = parado ? sprOWPlayerParadoLateral : sprOWPlayerAndandoLateral;
		        break;
		    case DirecoesEnum.Sudoeste:
				image_xscale = 1;
		        sprite_index = parado ? sprOWPlayerParadoDiagonalinferior : sprOWPlayerAndandoDiagonalinferior;
		        break;
		    case DirecoesEnum.Sul:
				image_xscale = 1;
		        sprite_index = parado ? sprOWPlayerParadoBaixo : sprOWPlayerAndandoBaixo;
		        break;
		    case DirecoesEnum.Sudeste:
				image_xscale = -1;
		        sprite_index = parado ? sprOWPlayerParadoDiagonalinferior : sprOWPlayerAndandoDiagonalinferior;
		        break;
		}
}