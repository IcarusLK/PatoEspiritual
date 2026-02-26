/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3329C139
/// @DnDArgument : "code" "$(13_10)$(13_10)//pegando meus inputs e movendo o player;$(13_10)inputs(); $(13_10)move_player(); $(13_10)$(13_10)//chamando minha maquina de estados;$(13_10)meu_estado();$(13_10)$(13_10)//Limitando meu tiro$(13_10)limitando_tiro();$(13_10)$(13_10)$(13_10)//aumentando meu nivel de ataque de acordo com as fases, e eventualmente mudando o sprite$(13_10)//do meu tiro.$(13_10)$(13_10)//fase 2 aumento 1 de dano. $(13_10)  if ( global.fase2 )$(13_10)  {$(13_10)	  global.playerdano = 2;$(13_10)  }$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)"


//pegando meus inputs e movendo o player;
inputs(); 
move_player(); 

//chamando minha maquina de estados;
meu_estado();

//Limitando meu tiro
limitando_tiro();


//aumentando meu nivel de ataque de acordo com as fases, e eventualmente mudando o sprite
//do meu tiro.

//fase 2 aumento 1 de dano. 
  if ( global.fase2 )
  {
	  global.playerdano = 2;
  }