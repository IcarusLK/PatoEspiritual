

//Criando os geradores de acordo com as fases, e se ja criei o gerador da fase ou nao
if (global.fase1 and !gerador1)
   {
  	  geradorfase101 = instance_create_layer(x,y,"Inst_Inimigos",obj_gerador01)
	  geradorfase102 = instance_create_layer(x,y,"Inst_Inimigos",obj_gerador01)
  	  gerador1       = true
   }
   
  //criando  o gerador da fase2 
 if (global.fase2 and !gerador2)
   {
  	  geradorfase02 = instance_create_layer(x,y,"Inst_Inimigos",obj_gerador02)	
  	  gerador2       = true
	 
//reiniciando o outro gerador so por precaucao, nao sei se vai gerar erros	 
	 gerador1       = false;
   } 
   
     //criando  o gerador da fase23
 if (global.fase3 and !gerador3)
   {
  	  geradorfase02 = instance_create_layer(x,y,"Inst_Inimigos",obj_gerador03)	
  	  gerador3      = true
	 
//reiniciando o outro gerador so por precaucao, nao sei se vai gerar erros	 
	 gerador1       = false;
	 gerador2       = false;
   } 
   
   if (global.fase4 and !gerador4)
   {
	    geradorfase04 = instance_create_layer(x,y,"Inst_Inimigos",obj_gerador04);
		gerador4      = true;
		gerador1      = false;
	    gerador2      = false;
		gerador3      = false
   }
   
  