

//parando meu gerador quando preciso, a global é ativada pelos timers, e a global manipula
//a variavel do objeto, acredito que nem precisava mas acabou assim.

 if (global.parar_gerador)
 {
	  posso_criar = false;
 }

else 
{
	posso_criar = true; 

}

//a variavel se altera de acordo com a fase que estamos
//primeira fase
if (global.fase1)
{
	  //definindo meu espirito e definindo as outras fases como falsas.
	 espirito = obj_inimigo01
     global.fase2 = false;
     global.fase3 = false;
     global.fase4 = false;
     global.fase5 = false;
	
}