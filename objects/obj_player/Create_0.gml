

#region variaveis 
//iniciando variaveis de estados
velocidade    = 2; 
vida          = 2;
meu_estado    = 0;
indica_estado = 0;

//iniciando variaveis de input
right         = 0;
left          = 0;
up            = 0;
down          = 0;
movex         = 0;
movey         = 0;
atira         = 0;


//pegando os meus colisores, apesar de que devido á mudança de formato, nem vai ser tão 
//preciso necessariamnte
colisores = [obj_parede];

#endregion 


#region Movimentação
inputs = function()

{
	   right = keyboard_check(ord("D"));
	   left  = keyboard_check(ord("A"));
	   up    = keyboard_check(ord("W"));
	   down  = keyboard_check(ord("S"));
	   
	   atira = mouse_check_button(mb_left);
	   
	
}

move_player = function()


{
	movex = (right - left) * velocidade
	movey = (down  - up  ) * velocidade
	
	move_and_collide(movex,movey,colisores)
	
	
}



#endregion 



#region Maquina de estados; 

//iniciando minhas máquina de estados, sem usar switch, essa fica para os inimigos


estado_idle    = function()

{   
	indica_estado = "Idle"
	sprite_index = spr_duck_idle;


// se minha velocidade é diferente de zero eu não estou parado, mudo estado	
    if (movey != 0 or movex !=0 )
	{
		 meu_estado = estado_andando;
	}
	
}

 
estado_andando = function()

{
	
//andando para cima; 
	   if (movey < 0)
	   {   
		   indica_estado = "movendo para cima"
		   sprite_index = spr_duck_walk_back;
	   };

//como so uso duas sprites,nao tem mal fazer desse jeito	
	  else 
	  {    indica_estado = "frente"
		   sprite_index  = spr_duck_walk_front
	  };
// se não estou me movendo, estou Idle, toma essa sociedade  
	  if ( movex = 0 and movey = 0)
	  {
		  meu_estado = estado_idle;
		  
	  };
	
};




#endregion 


#region Iniciando minha Máquina de estados 

meu_estado = estado_idle; 


#endregion 













