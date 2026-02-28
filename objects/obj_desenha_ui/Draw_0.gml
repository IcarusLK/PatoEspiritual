


//desenhando  minha UI
//Desenhando os meus valores. 

draw_set_font(fnt_01_ui);
draw_set_colour(c_white);
draw_text(global.x_ui,global.y_ui - 30, "ONDA :");
draw_text(global.x_ui,global.y_ui - 10, onda_atual);

//desenhando viddas
draw_sprite_ext(spr_heart,0,global.x_ui + 10,global.y_ui + 80,1,1,0,c_white,1)
draw_text(global.x_ui + 30,global.y_ui  + 70, obj_player.vida);

//desenhando nivel de ataqe
draw_text(global.x_ui - 7 ,global.y_ui  + 110, "ATAQUE");
draw_text(global.x_ui,global.y_ui  + 130, global.playerdano);

//Desenhando Badges 

if (global.badge_olhos_de_oni)
{
	draw_sprite_ext(spr_estrela_amigavel,1,525,232,1.5,1.5,0,c_white,1)

}

if (global.badge_fantasmao)
{
	draw_sprite_ext(spr_estrela_amigavel,1,545,232,1.5,1.5,0,c_white,1)
}

if (global.badge_boquinha)
{
	draw_sprite_ext(spr_estrela_amigavel,1,565,232,1.5,1.5,0,c_white,1)
}

if (global.badge_diamantinho)
{
	draw_sprite_ext(spr_estrela_amigavel,1,585,232,1.5,1.5,0,c_white,1)
}	




//Resetando
draw_set_colour(-1);
draw_set_font(-1);











