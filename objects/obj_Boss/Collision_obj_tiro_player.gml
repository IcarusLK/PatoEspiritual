



leva_dano()

//Adicionando Efeito
image_xscale = lerp(image_xscale,1.5,0.5); 
image_yscale = lerp(image_yscale,0.3,0.5);

toca_som(snd_hit,1,0, , ,0.5)

instance_destroy(other);