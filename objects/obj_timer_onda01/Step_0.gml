


 //Se o meu player está vivo, isto é, existe, eu começo a rodar o meu temporizador 
 player = instance_exists(obj_player);
 
 if (player)
{
	  var valor = 0.02
	  timer -= valor
	 
 };
 
 //Parando o meu Timer 
 if ( timer <= tempo_para_zerar_room01 )
 {
	 timer = tempo_para_zerar_room01
	 escrevendo_transicao = true;
 }; 
 
 //Iniciando Timer de transição;  
 if (escrevendo_transicao)
 
{    var valor = 0.02
	timer_transicao -= valor;
	
};

//se o timer chegou a esse valor, eu destruo a instancia e passo para a proxima onda; 
   if ( timer_transicao <= tempo_para_minha_transicao)
    {
		timer_transicao = tempo_para_minha_transicao;

//a fase 1 fica para tras vamos para a proxima	   
	    global.fase1 = false;
		global.fase2 = true;
	}
 
 
 
 
 