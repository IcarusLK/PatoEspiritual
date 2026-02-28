

randomise(); 

//Iniciando Inimigo 04 

#region Variaveis

//Váriaveis de Estado            
vida_diamantinho                 = 15;
ataque_diamantinho               = 3;
velocidade_diamantinho           = 2;
voltando                         = false;
meu_drop                         = choose(1,2,3,4,5,7)


//Máquina de Estados
estado_diamantinho              = "chegando" ;
tempo_para_estado_tiro          =  10;
timer_estado_tiro               =  0;

timer_andando                   =  0;
tempo_andando                   = 10;


//Tiros
posso_atirar                    = true;
tempo_cooldown                  = 10;
timer_cooldown                  = 0;
tiro1                           = 0;
tiro2                           = 0;
tiro3                           = 0;
tiro4                           = 0;
velocidade_tiro                 = 3;

alvo                            = obj_player;


//Efeitos
escalaX = image_xscale;
escalaY = image_yscale;

valor_som = random_range(0.7,2)

//fazendo minha origem ser aleatoria dentro desses
//valores
ord_x = random_range(65,446);
ord_y = random_range(-160,-90);

x = ord_x;
y = ord_y;




#endregion 


#region  Iniciando Máquina de Estados 


machina = function()
{
	  switch(estado_diamantinho) 
	  {
		 case "chegando" :
		 
		  if (global.morreu)
		  {
			  estado_diamantinho = "parei";
		  }
		 
		 vspeed = velocidade_diamantinho
		  
		 if ( y >= 32 )
		 {
		  estado_diamantinho = "parou";
		 };
	   
	    break; 
		
		case "parou" :
		
		if (global.morreu)
		  {
			  estado_diamantinho = "parei";
		  }
		
		timer_estado_tiro += 0.1;
		vspeed = 0;
		
		if ( timer_estado_tiro >= tempo_para_estado_tiro )
		{
			 timer = 0;
			 estado_diamantinho = "atacando"
		}
		
		break; 
		
		case "atacando" :
		
		if (global.morreu)
		  {
			  estado_diamantinho = "parei";
		  }
		
		vspeed  = 0;
		atira_diamante();
		timer_andando += 0.05;
		
		if ( timer_andando >= tempo_andando )
		{
			 timer_andando = 0;
			 estado_diamantinho = "andando";
		};
		
		break;
		
		case "andando" :


//mandando ele ir para tras ou para frente 		
	      if (colidi)
		  {
			  voltando = true;
		  }
		  
		  if (voltando)
		  {
			  vspeed = -velocidade_diamantinho
		  }
		
		  if ( y <= 64 )
		  {
			   voltando = false;
		  }
		
		  if (!voltando)
		  {
			   vspeed = velocidade_diamantinho
		  }
		
		 timer_andando += 0.09;
		 
		 if ( timer_andando >= tempo_andando )
		 {
			  timer_andando = 0;
			  estado_diamantinho = "atacando";
		 };
		
		break;
		
		case "parei" :
		
		vspeed = 0;
		hspeed = 0;
		
		break;
	    
		
	  }//Fecha Switch
	
	
	
}//Fecha Function 




#endregion 


#region iniciando metodos

//PARA ATIRAR
atira_diamante = function()
{
	
	 if (posso_atirar)
	 {
		   tiro1 = instance_create_layer(x,y,"Inst_tiros",obj_tiro_inimigo04)
		   tiro2 = instance_create_layer(x,y,"Inst_tiros",obj_tiro_inimigo04)
		   tiro3 = instance_create_layer(x,y,"Inst_tiros",obj_tiro_inimigo04)
		   tiro4 = instance_create_layer(x,y,"Inst_tiros",obj_tiro_inimigo04)
		   
		   
		   //velocidade
		   tiro1.hspeed =   velocidade_tiro;
		   tiro2.hspeed = - velocidade_tiro;
		   tiro3.vspeed =   velocidade_tiro;
		   tiro4.vspeed = - velocidade_tiro;
		   
		   //angulo 
		   tiro1.image_angle  = 180;
		   tiro2.image_angle  = 0;
		   tiro3.image_angle  = 90;
		   tiro4.image_angle  = 270;
		   
		   //Efeito de ele atirando
		   image_xscale = lerp(image_xscale,3,0.9);
		   image_yscale = lerp(image_yscale,0.5,0.9);
		   
	 }

//Se atirei, não atiro mais. 
	  if (tiro1 and tiro2 and tiro3 and tiro4) 
	  {  
		  posso_atirar = false;
	  } 
	  
//voltando a atacar 

         if (!posso_atirar)
		 {
			  timer_cooldown += 0.09
		 }
		
	     if ( timer_cooldown >= tempo_cooldown )
		{
			 timer_cooldown = 0;
			 posso_atirar   = true;
		}; 
}

//PARA LEVAR DANO E MORRER
leva_dano = function()
{

   
	   vida_diamantinho -= global.playerdano;
	   
	   if (vida_diamantinho <= 0 )
	   {
		     instance_destroy();
			 
			if (meu_drop == 7)
			{
				 instance_create_layer(x,y + 10,"Inst_Inimigos",obj_item01_maca);
			};
	   };
	 
	
};//fecha function




#endregion 



















