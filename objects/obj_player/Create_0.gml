

#region variaveis 
//iniciando variaveis de estados
velocidade          = 2; 
vida                = 3;
meu_estado          = 0;
indica_estado       = 0;
velocidade_tiro     = 2;

//iniciando variaveis de input
right               = 0;
left                = 0;
up                  = 0;
down                = 0;
movex               = 0;
movey               = 0;
atira               = 0;


//variaveis para o tiro 
posso_atirar        = true;
tempo_atirar        = 3;
timer_atirar        = 0;
tempo_adiciona      = 0.1

//Levar dano
posso_levar_dano    = true;
tempo_cooldown_dano = 17;
timer_cooldown      = 0;

//pegando os meus colisores, apesar de que devido á mudança de formato, nem vai ser tão 
//preciso necessariamnte
colisores = [obj_parede];

//Efeitos 
minha_X = image_xscale;
minha_Y = image_yscale;






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

//Fazendo o Player atirar	
	if (atira)
	{
		 atirando(); 
		 posso_atirar = false;
	}
	
	
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
	
	if ( vida <= 0 )
	{
		 
		 meu_estado = estado_morto;
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
	  
	  if ( vida <= 0 )
	{
		 vida = 0;
		 meu_estado = estado_morto;
	}
	
	
};


estado_morto = function()
{
	 vspeed = - 0.2
	 
	 vida = 0;
	 posso_atirar       = false;
	 global.morreu      = true;
	 posso_levar_dano   = false;
	 sprite_index       = spr_duck_dead;
	 if (instance_exists(obj_gun) and global.morreu)
	 {
          instance_destroy(obj_gun);		 
	 }
	
}

//Atirando nos inimigos muhahaa
atirando = function()
{	
	
//Se posso atirar eu atiro
	if (posso_atirar)
   {  
   //vendo qmeu criador
       var origem = obj_gun;
     
     //criando tiro e definindo direçao e velocidade. 
       var tiro   = instance_create_layer(origem.x,origem.y,"Inst_tiros",obj_tiro_player)
       tiro.direction = origem.direction
       tiro.speed     = velocidade_tiro;
   };
	
}; 


	//dando um tempo de CoolDown no meu tiro. 
limitando_tiro = function()
{
	if (!posso_atirar)
	{
		timer_atirar += tempo_adiciona;
				
	}
	   
	if (timer_atirar >= tempo_atirar)
	{
		 timer_atirar = 0;
		 posso_atirar = true;
		
	};
	
	
}


#endregion 


#region Iniciando minha Máquina de estados 

meu_estado = estado_idle; 


#endregion 


#region mais metodos

//recebendo dano
leva_dano = function(valor_de_dano)
{
	if (posso_levar_dano)
	{
	   vida -= valor_de_dano; 
	   posso_levar_dano = false;
	}; 
	
	comeca_efeito(3.7,0.09,0.5)
	
	
}; 

leva_dano_sem_efeito = function(valor_de_dano)
{
	if (posso_levar_dano)
	{
	   vida -= valor_de_dano; 
	   posso_levar_dano = false;
	}; 
		
};


//resetando o jogo

resetou = function()
{	   
	   reseta = keyboard_check_pressed(ord("R"));
	   
	   if (reseta)
	   {
		   global.resetou = true; 
		   //show_message("foi")
	   };
	   	
}

volta_dano = function()
         {
         	 if (!posso_levar_dano)
			 {
				 timer_cooldown += 0.1;			
				 
			 };
			 
		
		if (timer_cooldown >= tempo_cooldown_dano)
		{
			 timer_cooldown   = 0;
			 posso_levar_dano = true;
		}
			 
         	
  };//Fechan Function


#endregion 










