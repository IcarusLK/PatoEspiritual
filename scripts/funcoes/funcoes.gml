


//cria explosao
function cria_explosao(part,xscale,yscale)
{
	   
	  instance_create_layer(x,y,"Inst_Inimigos",part)
	  part.image_xscale = xscale;
	  part.image_yscale = yscale;
	   
}

//Efeito Lerp
function comeca_efeito(valorx,valory,qua)
{
	
	image_xscale = lerp(image_xscale,valorx,qua);
   image_yscale = lerp(image_yscale,valory,qua);
	
	
}

function toca_som(sound,valor1,loop,gain,off,pitch)
{
	
	 audio_play_sound(sound,valor1,loop,gain,off,pitch);
}










