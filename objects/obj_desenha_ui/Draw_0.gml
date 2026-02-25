


//desenhando  minha UI
//Desenhando os meus valores. 

draw_set_font(fnt_01_ui);
draw_set_colour(c_white);
draw_text(global.x_ui,global.y_ui - 30, "ONDA :");
draw_text(global.x_ui,global.y_ui - 10, onda_atual);

//desenhando viddas
draw_sprite_ext(spr_heart,0,global.x_ui + 10,global.y_ui + 80,1,1,0,c_white,1)
draw_text(global.x_ui + 30,global.y_ui  + 70, obj_player.vida);

//Resetando
draw_set_colour(-1);
draw_set_font(-1);











