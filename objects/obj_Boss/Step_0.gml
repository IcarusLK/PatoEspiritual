



//chamando minha máquina de estados
Machina_Boss();


 //criando meu Lerp
 
 image_xscale = lerp(image_xscale,minha_escalaX,0.2)
 image_yscale = lerp(image_yscale,minha_escalaY,0.3)
 
 if (!meu_punho)
 {
	  instance_create_layer(x,y,"Inst_punhos",obj_boss_punho)
	  meu_punho = true; 
 }



