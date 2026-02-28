
randomise()


#region Iniciando Variaveis

meu_punho                      = false;;

vida_de_boss                   = 390;
atk_de_boss                    = 3;
velocidade_h_boss              = 2;
posso_levar_dano_boss          = false;
velocidade_boss                = 2

meu_alvo                       = obj_player;

muda_direcao                   = false;

//Máquina de Estados							   
estado_de_boss                 = "chegando";
tempo_para_mudar_estado01      = 10;
timer_mudar_de_estados         = 0;

bati_dir                       = 0;
bati_esq                       = 0;
voltando                       = false;

timer_muda_direcao             = 0;
tempo_muda_direcao             = 20;

parado                         = false;

//Para os meus tiros 
velocidade_tiro                = choose(2,2,3,3,4);
boss_atira                     = true;
tempo_boss_atira               = 10;
timer_boss_atira               = 0;

//Para os punhos
timer_punho                    = 0;
tempo_punho                    = 10
punho                          = false;
valor_subir                    = 1
descer                         = false;
regressa_ao_boss               = false;
terminou_ataque                = false;
devo_atacar                    = false;

//Para Efeitos
minha_escalaX = image_xscale;
minha_escalaY  = image_yscale;


#endregion


#region Iniciando Máquina de Estados


Machina_Boss = function()
{
	   
	   switch(estado_de_boss)
       {
		   case "chegando" :
		   
		   image_speed = 0;
		   vspeed      = velocidade_h_boss;
		   
		   if ( y >= 47 )
		   {
			  estado_de_boss = "parei mano" 
		   };
		   
		   break;
		   
		   case "parei mano" :
		   
		   devo_atacar = false;
		   vspeed      = 0;
		   image_speed = 1;
		   
		   
		   //tocando timer para mudar o estado
		   
		   timer_mudar_de_estados += 0.1;
		   if (timer_mudar_de_estados >= tempo_para_mudar_estado01)
		   {
			    timer_mudar_de_estados = 0;
				estado_de_boss = "ataque 1";
		   }
		   
		   
		   break;
		   
		   case "ataque 1" :
		   		   
		   //Limitando quando ele pode levar dano
		   posso_levar_dano_boss = true;
		    
		   
		   //Atirando
		   Tiro_Boss();
		   
		   //voltando o meu tiro
		   volta_tiro();
		   
		   //trocando de lados
           checa_se_bati();
		   
		   timer_muda_direcao += 0.01;
		   if (timer_muda_direcao >= tempo_muda_direcao)
		   {
			    timer = 0;
				muda_direcao       = false;
				parado             = true;
				timer_muda_direcao = 0
		   }
		   
		   if (parado)
		   {
			    estado_de_boss = "parado";
		   }
		 
		   
		   break;
		   
		   case "parado" :
		         
		   hspeed = 0;
		   terminou_ataque = false;
		   timer_mudar_de_estados += 0.1
		   
		   if (timer_mudar_de_estados >= tempo_para_mudar_estado01)
		   {    
			    parado = false;
			    timer_mudar_de_estados = 0;
				estado_de_boss = "punho";
				
		   }
		  
		   		   
		   break ;
	  
	       case "punho" :
		   
		     tiro_punho();
		   
		   if (terminou_ataque)
		   {
			     estado_de_boss   = "parei mano"
				 regressa_ao_boss = false;
				 terminou_ataque  = false;
		   }
		   break;
	  
	  } //fecha switch

}//fecha function


#endregion 


#region  Metódos Auxiliares

checa_se_bati = function()
{    
	  if (!muda_direcao)
	  {
		  hspeed = velocidade_boss
	  }
	 
	 bati_dir = place_meeting(x,y,obj_parede_dir)
	 bati_esq = place_meeting(x,y,obj_parede_esq)
	 
	 if (bati_dir)
	 { 
		 hspeed = - velocidade_boss
		 muda_direcao = true;
	 }
	 
	 if (bati_esq)
	 {
		 hspeed = velocidade_boss 
	 }
}



//Tiros 

 Tiro_Boss = function()
 {
	 
	 if (boss_atira)
	 {
		   var tiro = instance_create_layer(x,y,"Inst_tiros",obj_boss_ataque_01)
		   tiro.direction = point_direction(x,y,meu_alvo.x,meu_alvo.y)
		   tiro.speed     =  velocidade_tiro;
		   tiro.image_xscale = 0.4;
		   tiro.image_yscale = 0.4;
		   
		   boss_atira     = false;
		 
	 }
	 
	 
 }
 
     //Adicionando tempo de Cooldown para meu tiro
 volta_tiro = function()
 {
	  if (!boss_atira)
	  {
              timer_boss_atira += 0.2;		  
	  }
	  
	  if (timer_boss_atira >= tempo_boss_atira)
	  {
		 timer_boss_atira = 0;
		 boss_atira       = true;
		   
	  }
	 
 }
 
 tiro_punho = function()
 {
	 
	 //Digo que já não segue meu Y
	     obj_boss_punho.devo_seguirY = false;
		 
		 if (!descer)
		 {
		         obj_boss_punho.y -= 2;	
				 
				 if (obj_boss_punho.y <= obj_Boss.y - 20)
				 {    
					  descer = true;				
				 }
		 }
		 
		 if (descer)
		 {
			 obj_boss_punho.y += 4;
		 }
	    
		if (obj_boss_punho.y >= 288)
		{
			  descer = false;
			  regressa_ao_boss = true;
		}
		  
		  
		 if (obj_boss_punho.y <= obj_Boss.y  and regressa_ao_boss)
		 {
			  obj_boss_punho.devo_seguirY = true;
			  terminou_ataque             = true;
		 }
 }
 
 
 leva_dano = function()
 {
	   vida_de_boss -= global.playerdano
	   
	   if (vida_de_boss <= 0)
	   {
		   instance_destroy()
		   instance_destroy(obj_boss_punho);
	   }
	 
 }
 

#endregion 











