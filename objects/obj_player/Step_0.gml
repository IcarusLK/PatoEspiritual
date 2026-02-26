

//pegando meus inputs e movendo o player;
inputs(); 
move_player(); 

//chamando minha maquina de estados;
meu_estado();

//Limitando meu tiro
limitando_tiro();


resetou();

cursor_sprite = spr_mira; 


//aumentando meu nivel de ataque de acordo com as fases, e eventualmente mudando o sprite
//do meu tiro.

//fase 2 aumento 1 de dano. 
  if ( global.fase2 )
  {
	  global.playerdano = 2;
  }
  
  //fase 2 aumento 1 de dano. 
  if ( global.fase3)
  {
	  global.playerdano = 4;
  }
  
  
  
  
  
  
  
  
  
  