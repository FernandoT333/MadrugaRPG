function checarComandoGamepad(){	
	if (variable_global_exists("slot") && global.slot > 0) {
			var slot = global.slot;
			
			#region Lista de comandos
			
			var cima = gamepad_button_check(slot, gp_padu);
			var baixo = gamepad_button_check(slot, gp_padd);
			var direita = gamepad_button_check(slot, gp_padr);
			var esquerda = gamepad_button_check(slot, gp_padl);
			var start = gamepad_button_check(slot, gp_start);
			var select = gamepad_button_check(slot, gp_select);
			var botaoB = gamepad_button_check(slot, gp_face1);
			var botaoA = gamepad_button_check(slot, gp_face2);
			var botaoY = gamepad_button_check(slot, gp_face3);
			var botaoX = gamepad_button_check(slot, gp_face4);
			var analogicoDir = gamepad_button_check(slot, gp_stickr);
			var analogicoEsqu = gamepad_button_check(slot, gp_stickl);
			var botaoR1 = gamepad_button_check(slot, gp_shoulderr);
			var botaoR2 = gamepad_button_check(slot, gp_shoulderrb);
			var botaoL1 = gamepad_button_check(slot, gp_shoulderl);
			var botaoL2 = gamepad_button_check(slot, gp_shoulderlb);
			
			#endregion
			
			#region Lista de valores dos analogicos
			
			var valorVerticalEsqu = gamepad_axis_value(slot, gp_axislv);
			var valorHorizontalEsqu = gamepad_axis_value(slot, gp_axislh);
			
			var valorVerticalDir = gamepad_axis_value(slot, gp_axisrv);
			var valorHorizontalDir = gamepad_axis_value(slot, gp_axisrh);
			
			var direcaoAnalogicoDir = point_direction(0, 0, valorHorizontalDir, valorVerticalDir);
			var direcaoAnalogicoEsqu = point_direction(0, 0, valorHorizontalEsqu, valorVerticalEsqu);
			
			var velocAnalogicoDir = point_distance(0 ,0, valorHorizontalDir, valorVerticalDir) * 2;
			var velocAnalogicoEsqu = point_distance(0 ,0, valorHorizontalEsqu, valorVerticalEsqu) * 2;
			
			#endregion
			
			#region Funções globais
			
			if (instance_exists(objConfiguracoes)) {
				select = gamepad_button_check_pressed(slot, gp_select);
				
				if(select) {
					aplicarFullscreen();
				} 
			}
			
			#endregion
			
			#region Interacao em Salas neutras
			
			if (instance_exists(objInteracao)) {
				start = gamepad_button_check_pressed(slot, gp_start);
				select = gamepad_button_check_pressed(slot, gp_select);
				botaoB = gamepad_button_check_pressed(slot, gp_face1);
				botaoA = gamepad_button_check_pressed(slot, gp_face2);
				botaoY = gamepad_button_check_pressed(slot, gp_face3);
				botaoX = gamepad_button_check_pressed(slot, gp_face4);
			
				
				if(
					start ||
					botaoB ||
					botaoA ||
					botaoY ||
					botaoX
				) {
					with (objInteracao) {
						interagirEmTela();
					}
				} 
			}
			
			#endregion
			
			#region Modo Overworld
			
			if (instance_exists(objInventario)) {
				botaoX = gamepad_button_check_pressed(slot, gp_face4);
				
				if(botaoX && !global.pause) {
					executarMenuPausa();
				} 
			}
			
			if (instance_exists(objPlayerOW)) {
				objPlayerOW.cima = cima;
				objPlayerOW.baixo = baixo;
				objPlayerOW.direita = direita;
				objPlayerOW.esquerda = esquerda;
				
				if(botaoA) {
					with(objBau) {
						abrirBau();
					}
                    
					with(objFrisk) {
						iniciarDialogo();
					}
                    
					with(objDialogo) {
						proximoTexto();
					}
				}
				
				
				with(objPlayerOW) {
					velocidadeAnalogico = velocAnalogicoEsqu;
					
					if (velocAnalogicoEsqu > 0) {
						moverPlayerOWAnalogico(direcaoAnalogicoEsqu);
					}
				}
			}
			
			#endregion
			
			#region Modo Pause
			
			if (instance_exists(objMenuPausa)) {
				cima = gamepad_button_check_pressed(slot, gp_padu);
				baixo = gamepad_button_check_pressed(slot, gp_padd);
				direita = gamepad_button_check_pressed(slot, gp_padr);
				esquerda = gamepad_button_check_pressed(slot, gp_padl);
				botaoB = gamepad_button_check_pressed(slot, gp_face1);
				botaoA = gamepad_button_check_pressed(slot, gp_face2);

				
				if (!analogicoSegurado) {
					analogicoSegurado = velocAnalogicoEsqu > 0;
					
					if (analogicoSegurado) {						
						cima = (direcaoAnalogicoEsqu >= 45 && direcaoAnalogicoEsqu <= 135);
						baixo = (direcaoAnalogicoEsqu >= 225 && direcaoAnalogicoEsqu <= 315);
						direita = (direcaoAnalogicoEsqu >= 315 || direcaoAnalogicoEsqu <= 45);
						esquerda = (direcaoAnalogicoEsqu >= 135 && direcaoAnalogicoEsqu <= 225);
					}
				}
				else if (velocAnalogicoEsqu <= 0)  {
				   analogicoSegurado = false;
				}
					
				var descerOpcao = baixo || direita;
				var subirOpcao = cima || esquerda;
				
				with (objMenuPausa) {			
					if(subirOpcao) {
						subirOpcaoMenu();
					} 
					
					if(descerOpcao) {
						descerOpcaoMenu();
					} 
					
					if(botaoA) {
						selecionarOpcaoPausa();
					} 
					
					if(botaoB) {
						voltarMenu();
					} 
				}
			}
			
			#endregion
			
			#region Modo Batalha
			
			if (instance_exists(objOpcoesBattle)) {
				cima = gamepad_button_check_pressed(slot, gp_padu);
				baixo = gamepad_button_check_pressed(slot, gp_padd);
				direita = gamepad_button_check_pressed(slot, gp_padr);
				esquerda = gamepad_button_check_pressed(slot, gp_padl);
				botaoB = gamepad_button_check_pressed(slot, gp_face1);
				botaoA = gamepad_button_check_pressed(slot, gp_face2);
				
				
				if (!analogicoSegurado) {
					analogicoSegurado = velocAnalogicoEsqu > 0;
					
					if (analogicoSegurado) {						
						cima = (direcaoAnalogicoEsqu >= 45 && direcaoAnalogicoEsqu <= 135);
						baixo = (direcaoAnalogicoEsqu >= 225 && direcaoAnalogicoEsqu <= 315);
						direita = (direcaoAnalogicoEsqu >= 315 || direcaoAnalogicoEsqu <= 45);
						esquerda = (direcaoAnalogicoEsqu >= 135 && direcaoAnalogicoEsqu <= 225);
					}
				}
				else if (velocAnalogicoEsqu <= 0)  {
				   analogicoSegurado = false;
				}
					
				var descerOpcao = baixo || direita;
				var subirOpcao = cima || esquerda;
				
				with (objOpcoesBattle) {
					if (menuAtual == MenuEnum.Principal) {
						if (velocAnalogicoEsqu > 0) {
							cima = (direcaoAnalogicoEsqu >= 45 && direcaoAnalogicoEsqu <= 135);
							baixo = (direcaoAnalogicoEsqu >= 225 && direcaoAnalogicoEsqu <= 315);
							direita = (direcaoAnalogicoEsqu >= 315 || direcaoAnalogicoEsqu <= 45);
							esquerda = (direcaoAnalogicoEsqu >= 135 && direcaoAnalogicoEsqu <= 225);
						}
						
						if (cima) {	
							opcaoAnterior = opcaoSelecionada;
							opcaoSelecionada = OpcaoMenuBatalhaEnum.Defender;
							alterarOpcaoBatalha();
						}
						if (baixo) {
							opcaoAnterior = opcaoSelecionada;
						    opcaoSelecionada = OpcaoMenuBatalhaEnum.Itens;
							alterarOpcaoBatalha();
						}
						if (direita) {
							opcaoAnterior = opcaoSelecionada;
						    opcaoSelecionada = OpcaoMenuBatalhaEnum.Atacar;
							alterarOpcaoBatalha();
						}
						if (esquerda) {
							opcaoAnterior = opcaoSelecionada;
						    opcaoSelecionada = OpcaoMenuBatalhaEnum.Fugir;
							alterarOpcaoBatalha();
						}
					}
					else {
						if(subirOpcao) {
							 opcaoSelecionada++;
							 alterarOpcaoBatalha();
						} 
						
						if(descerOpcao) {
							 opcaoSelecionada--;
							 alterarOpcaoBatalha();
						} 
					}
					
					if(botaoA) {
						selecionarOpcaoBatalha();
					} 
					
					if(botaoB) {
						voltarMenuBatalha();
					} 
				}
			}
			
			#endregion
			
			//show_debug_message("Direção analogico direito: " + string(direcaoAnalogicoDir));
			//show_debug_message("Velocidade analogico direito: " + string(velocAnalogicoDir));
			//show_debug_message("Direção analogico esquerdo: " + string(direcaoAnalogicoEsqu));
			//show_debug_message("Velocidade analogico esquerdo: " + string(velocAnalogicoEsqu));
	}
}