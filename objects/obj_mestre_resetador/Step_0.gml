



   //reiniciando o meu jogo. 
   if (global.resetou)
  {
	   //reseta as fases; 
	   global.fase1          = true;
       global.fase2          = false;
       global.fase3          = false;
       global.fase4          = false;
       global.fase5          = false;
	   
	   //reseta player 
	   global.morreu         = false; 
	   global.os_meus_pontos = 0;
	   global.playerlevel    = 1;
       global.playerdano     = 1;
	   obj_player.vida       = 3;
	  
	  //volta gerador
	  global.parar_gerador   = false;
	   
	   //reseta badges
	  global.badge_olhos_de_oni = false;
	  global.badge_fantasmao    = false;
      global.badge_boquinha     = false;
      global.badge_diamantinho  = false;
	  
	  global.boss               = false;
	 
	 room_restart();
	 //Para de resetar o jogo mano
	 global.resetou            = false; 
	
	 	  
  };