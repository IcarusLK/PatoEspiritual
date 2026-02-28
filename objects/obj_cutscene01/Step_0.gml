

if  (keyboard_check_released(vk_space) and cena1)
     {   
     	 cena1 = false;
     	 cena2 = true;
     	
     }
     if (cena2)
     {  
		  saltar  = true;
		 //Adicionando um timer para ver quando posso mudar de cena
     	 sprite_index = spr_testa_cutscene_1
		 timer_mudar += 0.3;
     }
	 
	 if (timer_mudar >= tempo_mudar)
	 {
	     posso_mudar = true;	
		 timer_mudar = 0;
	 }
	 
if  (keyboard_check_released(vk_space) and cena2 and posso_mudar)
     {   
     	 cena1 = false;
     	 cena2 = false;
		 cena3 = true;
		     	
     }	 
	 
	
	if (cena3)
     {
     	 sprite_index = spr_testa_cutscene_2
		 timer_jogar += 0.3;
		 
     } 
	 
     if (timer_jogar >= tempo_jogar)
	 {
	     posso_jogar = true;	
		 
	 }
	 
//Indo para o Jogo!	 
	 if  (keyboard_check_released(vk_space) and cena3 and posso_jogar)
     {    
		 room_goto(Room1)
     	 cena1 = false;
     	 cena2 = false;
		 cena3 = false;
		 timer_mudar = 0;  
		 timer_jogar = 0;
     }
	 
