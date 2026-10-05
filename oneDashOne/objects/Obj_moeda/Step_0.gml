// Se colidir à um bloco, ascende e se destroi
if place_meeting(x,y, Obj_interrogacao){
	y -= 3
	timer++
	if timer = 16{
		instance_destroy();	
	}
}

// Ao tocar no player, ele se deleta e aumenta a variavel moedas do player
if place_meeting(x,y, Obj_mario){
	global.moeda++
	instance_destroy()
}