


//chamando máquina 
Machina();


//criando um efeito de sombra
if (!tenho_sombra)
{
	 minha_sombra = instance_create_layer(x,y,"Inst_sombras",obj_sombra); 
	 tenho_sombra  = true;
	 minha_sombra.image_xscale = 1;
	 minha_sombra.image_yscale = 1;
}

if (tenho_sombra)
{  
  minha_sombra.x = x; 
  minha_sombra.y = y + 40;
 
}

  //criando efeito
 image_xscale = lerp(image_xscale,minha_escalaX,0.2)
 image_yscale = lerp(image_yscale,minha_escalaY,0.3)
 
 
 //parando se o player morreu
 
 if (global.morreu)
 {
	  vspeed = 0;
	  hspeed = 0;
 };






