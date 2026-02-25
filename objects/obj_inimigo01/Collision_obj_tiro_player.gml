

//fazendo ele tomar dano e destruindo a bala
levando_dano();
instance_destroy(other);

//ja que dei dois de vida para ele, vamos fazer um efeito bacanudo

image_xscale = lerp(image_xscale,2.2,0.7); 
image_yscale = lerp(image_yscale,0.4,0.7);