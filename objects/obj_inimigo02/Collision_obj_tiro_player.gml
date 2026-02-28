

instance_destroy(other)
recebe_dano_aumenta_velocidade();

//dando um efeito bacanudo.
image_xscale = lerp(image_xscale,2.2,0.7); 
image_yscale = lerp(image_yscale,0.4,0.7);

toca_som(snd_hit,1,0, , ,valor_som)