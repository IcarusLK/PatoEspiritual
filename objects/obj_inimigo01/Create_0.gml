
//randomizando
randomise()


#region  // Variaveis
//Iniciando minhas váriaveis 
vida_oni                  = 2;
ataque_oni                = 1;
meu_estado                = "chegando";
velocidade_oni            = choose(2,1,1);
velocidade_tiro_oni       = choose(2,2,2,3);


ord_x = random_range(65,446);
ord_y = random_range(-160,-90);

x = ord_x;
y = ord_y;


//Variaveis para atacar.
posso_atacar             = true;
timer_para_atacar_oni    = 0;
tempo_preciso_atacar_oni = 15;
tempo_adiciona           = 0.2;
alvo                     = obj_player;



//variaveis para efeito de sombra, so porque sim!
tenho_sombra = false; 
minha_sombra = 0;

minha_escalaX = image_xscale;
minha_escalaY  = image_yscale;



//Conferindo se ataquei para voltar ao estado de andando
ataquei                  = false;
tempo_mudar              = 10;
timer_mudar              = 0;
adiciona_timer_mudar     = 0.1;


//Indicando minha chance de Drop
Meu_drop = choose(1,2,2,5,7)


#endregion 

#region Metodos 
//Iniciando máquina de estados com Switch e Case pois nesse cenário faciliti

machina = function()

{
	 switch(meu_estado)
	 
	 {
		 
//Chegando lá dos cafundo, depois de chegar vamos começar a atacar o player
		 case "chegando" :
		 
		 if ( y <=   31 )
		 {   
			 image_speed = 0;
			 vspeed      = velocidade_oni;			 
		 }
		 
		 if ( y >= 45 )
		 
		 {			 
		   meu_estado = "atacando"	;	 
		 }; // fecha If 
		 
		 break;
		 
		 case "atacando" : 

//quando chego em um certo ponto, paro e começo a atacar	 
		 vspeed        = 0;
		 image_speed   = 0;
		 image_index   = 1;
		 tiro_de_oni()
		 direction     = 270;

//Contando o tempo para mudar de estado. 
         timer_mudar += adiciona_timer_mudar;
		 
		 if (timer_mudar >= tempo_mudar)
		 {
			  timer_mudar = 0;
			  meu_estado  = "andando";
		 } 
		 
		 break; 
		 
		 case "andando" :
//apos eu atacar, eu ando mais e espero para voltar ao estado de atacando
		 vspeed      = velocidade_oni  
		 image_index = 0;
		 direction   = point_direction(x,y,alvo.x,alvo.y);
		 
		 //Contando o tempo para mudar de estado. 
         timer_mudar += adiciona_timer_mudar;
		 
		 if (timer_mudar >= tempo_mudar)
		 {
			  timer_mudar = 0;
			  meu_estado  = "atacando";
		 }
		 
		 break; 
	
		 
	 }// Fecha Switch
	
	
	
}//Fecha Function


//Iniciando o Meu Tiro 
tiro_de_oni = function()
{

//Se posso atacar eu ataco, faz sentido, paz para eles nao é uma opção. 	
	if ( posso_atacar )
	
	{    
		
		 //criando o meu tiro
		 var tiro         = instance_create_layer(x,y,"Inst_tiros",obj_oni_tiro);
		 tiro.speed       =  velocidade_tiro_oni;
		 tiro.direction   = point_direction(x,y,alvo.x,alvo.y);
		 tiro.image_angle = direction;

//se ataquei nao ataco mais. faz sentido		
		posso_atacar     = false; 
		
		
	}//Fecha if do atacar

//Se não posso atacar, conta timer para atacar novamente	
	if (!posso_atacar)
	{		
		timer_para_atacar_oni += tempo_adiciona;		
	}
	
	if (timer_para_atacar_oni >= tempo_preciso_atacar_oni)
	{
		
		//volto a atacar e reseto o timer. 
		 posso_atacar          = true; 
		 timer_para_atacar_oni = 0;
	}
	
	
	
} // Fecha Function 

  //Ele so tem 1 de Hp então nem precisava mas enfim, vamos deixar como metodo
levando_dano = function()
{

//Levando dano do Player.
	vida_oni -= global.playerdano;

//Morrendo. 	
	if ( vida_oni <= 0 )
	{
		 instance_destroy();
		 instance_destroy(minha_sombra); 
		 
//Vendo minha chance de Drop 
         if ( Meu_drop == 7 )
	     {
	    	  //criando maca, se meu drop é igual a 7. 
	    	  instance_create_layer(x,y,"Inst_Inimigos",obj_item01_maca);
	     }
	
	};
		
}


#endregion 






