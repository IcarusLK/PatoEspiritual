



#region Metodos; 


//Metodo para seguir o player
segue_player = function()
{
//se o player existe eu sigo ele
	 if (instance_exists(obj_player))
	{
		x = obj_player.x + 25
	    y = obj_player.y + 3
	}	

//se o player morre eu morro.	
	else if (!instance_exists(obj_player))
	{		
		 instance_destroy()
	}
}   



//pegando a minha direção
minha_direcao = function()
{

//pegando a direção do mouse para atirar
	direction = point_direction(x,y,mouse_x,mouse_y)
	image_angle = direction 
	
	if ( image_angle >= 164 and image_angle <= 267 )
	{   
		
		image_yscale = - 1
	}
	
	else 
	{   
		image_yscale = 1
	}
	
}

#endregion 