


//levando dano ao colidir com o player
leva_dano();



//efeito bacanudo
image_xscale = lerp(image_xscale,2.2,0.7); 
image_yscale = lerp(image_yscale,0.4,0.7);

instance_destroy(other)