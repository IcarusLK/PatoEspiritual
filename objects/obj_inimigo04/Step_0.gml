


//chamando a machina
machina();

colidi  = place_meeting(x + 3,y,obj_parede)





//Iniciando os meus efeitos
image_xscale = lerp(image_xscale,escalaX,0.2);
image_yscale = lerp(image_yscale,escalaY,0.2);



        //parando se o player morreu
 if (global.morreu)
 {
	  vspeed = 0;
	  hspeed = 0;
 };




