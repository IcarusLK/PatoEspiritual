


//Iniciando Maquina
machina();

//Limitando minha_velocidade pra eu nao dar uma carreira no Player.
hspeed = clamp(hspeed,-1,1);
vspeed = clamp(vspeed,-1,2);

//criando um efeito de sombra
if (!tenho_sombra)
{
	 minha_sombra = instance_create_layer(x,y+10,"Inst_sombras",obj_sombra); 
	 minha_sombra.image_xscale = 0.7;
	 minha_sombra.image_yscale = 0.7;
	 tenho_sombra  = true;
}

if (tenho_sombra)
{  
  minha_sombra.x = x; 
  minha_sombra.y = y;
 
}
 
 //criando meu Lerp
 
 image_xscale = lerp(image_xscale,minha_escalaX,0.2)
 image_yscale = lerp(image_yscale,minha_escalaY,0.3)
 

 
 
 
 
 
 
 
 
 
 
 
 