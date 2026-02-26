


//Desenhando os meus valores. 
draw_set_font(fnt_01_ui);
draw_set_colour(c_white);
draw_text(global.x_ui,global.y_ui + 20,"TIMER");
draw_text(global.x_ui,global.y_ui + 40,timer);


#region DEBUGS 
   // DEBUGG
//draw_text(50,10,escrevendo_transicao); 

#endregion 



//escrevendo a minha transicao 
    if ( escrevendo_transicao )
	
	{   
		draw_set_font(fnt_02_transicao);
		draw_text(room_width / 2 - 150, room_height / 2 + 10," Proxima onda em ");
		draw_text(room_width / 2  - 70 , room_height / 2 + 30, timer_transicao);
		draw_text(room_width/2 - 140, room_height / 2 - 70, "MANDOU BEM!");
	    draw_text(room_width / 2 - 110, room_height / 2 + 50, " ATAQUE + 1 ");
      
	 draw_set_font(fnt_02_transicao_texto)
    draw_text(room_width / 2 - 230, room_height / 2 - 50, "MAS CUIDADO COM O PROXIMO INIMIGO");
    draw_text(room_width / 2 - 250, room_height / 2 - 30, "ELE FICA MAIS RAPIDO QUANDO PERDE VIDA!");
	
	};
	
	
	
//Resetando
draw_set_colour(-1);
draw_set_font(-1);	
	
	
	
	
	
	
	
	