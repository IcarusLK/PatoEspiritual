

randomise();

#region Variaveis 
//iniciando variaveis do Inimigo 02
//ele essencialmente apenas persegue o player e fica mais rapido conforme perde vida
vida_de_fantasma       = 6;
velocidade             = 1;
alvo                   = obj_player;
dano_de_fantasma       = 2; 

estado_de_fantasma     =  "Aproximando";
drop                   = choose(1,2,3,4,5,6,7,7);

valor_som = random_range(0.7,2)

//variaveis para efeito de sombra, so porque sim!
tenho_sombra           = false; 
minha_sombra           = 0;
minha_escalaX          = image_xscale;
minha_escalaY          = image_yscale

//fazendo minha origem ser aleatoria dentro desses
//valores
ord_x = random_range(65,446);
ord_y = random_range(-64,-90);

x = ord_x;
y = ord_y;




#endregion 


//Iniciando Máquina de estados
#region Máquina de estados

Machina = function()
{
	 switch(estado_de_fantasma)
	 
	 {
		  case "Aproximando" :
		  
		   vspeed = velocidade;
		   
		   if ( y >= 64 )
		   {
			   estado_de_fantasma = "segue_player"; 
		   }
		  
		  break; 
		  
		 case "segue_player" :
		 
		  segue_player();
		 
		 break; 
	 }//fecha switch
	
	
	
	
	
	
}//fecha machina



//função para seguir o player 
segue_player = function()
{	
	//seguindo o player
	velocidade = clamp(velocidade,1,3);
	move_towards_point(alvo.x + 10,alvo.y + 10,velocidade);	
};

recebe_dano_aumenta_velocidade = function()
{
	  vida_de_fantasma -= global.playerdano;
	  velocidade += 0.8;
	  
	  if ( vida_de_fantasma <= 0 )
	  {
		   instance_destroy();
		   instance_destroy(minha_sombra);
		   
		   if ( drop == 7 )
		   {
			   instance_create_layer(x,y + 15,"Inst_tiros",obj_item01_maca);   
		   }
		  
	  }
	
	
	
}


#endregion 














