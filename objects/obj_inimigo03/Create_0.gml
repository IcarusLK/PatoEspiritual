

randomise();

//Iniciando Inimigo 3
#region//Variaveis


//Estatus
vida                     = 7;
dano                     = 3;
velocidade_de_boquinha   = 2; 

//Atirar
inimigo03_pode_atirar    = true;
tempo_inimigo_03_atirar  = choose(5,7,7,10);
timer_inimigo_03_atirar  = 0;
velocidade_tiro_boquinha = choose(2,2,3);
alvo                     = obj_player;
tiro1                    = 0;

//Estados
Inimigo_03_estado        = "chegando";
tempo_parado             = 10;
timer_parado             =  0;

tempo_atirando           = 10;
timer_atirando           = 0;

tempo_andando            = 7;
timer_andando            = 0;

voltando                 = false;

//Outras

minha_escalaX            = image_xscale;
minha_escalaY            = image_yscale;

//fazendo minha origem ser aleatoria dentro desses
//valores
ord_x = random_range(65,446);
ord_y = random_range(-160,-90);

x = ord_x;
y = ord_y;

//variaveis para efeito de sombra, so porque sim!
tenho_sombra = false; 
minha_sombra = 0;




#endregion 


inimigo_03_Machina  = function()
{
	   switch(Inimigo_03_estado)
	   {
		   
		   case "chegando" : 
		   
		   vspeed = velocidade_de_boquinha;
		   
		   if ( y >= 41 )
		   {
			   Inimigo_03_estado = "parado";   
		   }
		   
		   break;
		   
		   case "parado"   :
		   
		   vspeed = 0;
		   timer_parado += 0.1;
		   
		   if (timer_parado >= tempo_parado)
		   {
			    Inimigo_03_estado = "atirando";
				timer_parado      = 0;
		   }
		   break;
		   
		   case "atirando" :
		   
		   sprite_index = spr_boquinha_ataca;
		   image_index  = 1;
		   image_speed  = 0;
		   vspeed = 0;
		   inimigo_03_atirando();
		   
		   timer_atirando += 0.07;
		   
		   if (timer_atirando >= tempo_atirando)
		   {
			    timer_atirando = 0;
				Inimigo_03_estado = "andando"
		   }
		   
		   break;
		   
		   case "andando" :
		   	 
			 sprite_index = spr_boquinha;
			 image_speed  = 1;
			//mudando a direção
		    if (!voltando)
			{
				 vspeed = velocidade_de_boquinha;
			}
			
			if (place_meeting(x,y + 10,obj_parede))
			{
				 voltando = true;
			}
		  
		    if (voltando)
			{
				 vspeed = -velocidade_de_boquinha;
			}
		     
			 if ( y <= 22 )
			 {
				 voltando = false;
			 }
		   
		   //Gerindo o timer
		   timer_andando += 0.1;
		   
		   if (timer_andando >= tempo_andando)
		   {
			    timer_andando = 0;
				Inimigo_03_estado = "atirando";
		   }
		   
		   break;
		   
		   
	   }//fecha Swicth
	   
	
	
	
}//fecha function


//Criando as demais funções como tiro levando dano
#region 

  inimigo_03_atirando = function()
  {
	   if (inimigo03_pode_atirar)
	   {    
		   
		   tiro1 = instance_create_layer(x,y,"Inst_tiros",obj_inimigo03__tiro)
		   tiro1.speed = velocidade_tiro_boquinha;
		   tiro1.direction = point_direction(x,y,alvo.x,alvo.y);
		   tiro1.image_angle = tiro1.direction + 90; 
		   
		   
	   }
	
	//se atirei eu não atiro mais
	   if (tiro1)
	   {
		    inimigo03_pode_atirar = false;		   
	   };
	  
	  
  }// fecha function


//O mesmo de sempre timer timer
recupera_tiro = function()
{
	 if (!inimigo03_pode_atirar)
	 {
		  var valor = 0.09;
		 timer_inimigo_03_atirar += valor		 
	 }
	 
	 if (timer_inimigo_03_atirar >= tempo_inimigo_03_atirar)
	 {
		 timer_inimigo_03_atirar = 0;
		 inimigo03_pode_atirar   = true;
		  
	 }
	
	
};



//levando dano 

leva_dano = function()
{
	   vida -= global.playerdano
	   
	   if ( vida <= 0 )
	   {
		   instance_destroy(); 
		   instance_destroy(minha_sombra);
	   }
	  	
}








#endregion 
