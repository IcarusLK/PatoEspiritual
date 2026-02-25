


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
		draw_text(room_width / 2 - 150, room_height / 2," Proxima onda em ");
		draw_text(room_width / 2  - 70 , room_height / 2 + 20, timer_transicao);
		
	};
	
	
	
//Resetando
draw_set_colour(-1);
draw_set_font(-1);	
	
	
	
	
	
	
	
	