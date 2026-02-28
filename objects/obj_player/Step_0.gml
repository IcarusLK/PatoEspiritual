

//pegando meus inputs e movendo o player;
inputs(); 
move_player(); 

//chamando minha maquina de estados;
meu_estado();

//Limitando meu tiro
limitando_tiro();

//resetando o game
resetou();

//tempo cooldown
volta_dano(); 

//Mudando o meu cursor, seria bom ter um objeto para isso, mas enfim
cursor_sprite = spr_mira; 

//consertando minha escala 			  
			  image_xscale = lerp(image_xscale,minha_X,0.2)
			  image_yscale = lerp(minha_Y,image_yscale,0.2)


//aumentando meu nivel de ataque de acordo com as fases, e eventualmente mudando o sprite
//do meu tiro.

//fase 2 aumento 1 de dano. 
  if ( global.fase2 )
  {
	  global.playerdano = 2;
	  velocidade_tiro   = 2.5;
  };
  
  //fase 2 aumento 1 de dano. 
  if ( global.fase3)
  {
	  global.playerdano = 4;
	  velocidade_tiro   = 2.7;
  };
  
  if ( global.fase4 )
  {
	  global.playerdano = 6;
  };
  
  if (global.fase5)
  {
	  global.playerdano = 8;
	  
  }; 
 
 //caso a arma nao exista
  if (!instance_exists(obj_gun) and !global.morreu)
  {
	   instance_create_layer(x,y,"Inst_player",obj_gun)
  }
  
  
  //tentando fazer um efeito de sei la, ele vai voltar ao mundo normal
  if (obj_desenha_ui.escreve_final == true)
  {
	      image_alpha -= 0.03;
		  obj_gun.image_alpha -= 0.03;
  }
  
  else if (!obj_desenha_ui.escreve_final)
  {
	     image_alpha = 1;
		 obj_gun.image_alpha = 1;
  }
  
  
  
  
  
  
  