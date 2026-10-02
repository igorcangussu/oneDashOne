if global.morto = false {
	if place_meeting(x, y - Obj_mario.gravidade, Obj_mario) and (Obj_mario.gravidade < 0){
		instance_destroy();	
		Obj_mario.gravidade = 0;
	}
}

