if place_meeting(x, y + 10, Obj_mario) and (Obj_mario.gravidade < 0){
	instance_destroy();	
	Obj_mario.gravidade = 0;
}