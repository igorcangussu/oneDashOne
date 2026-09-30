if place_meeting(x, y + 10, Obj_mario) and (Obj_mario.gravidade < 0){
	sprite_index = Spr_tile
	Obj_mario.gravidade = 0;
	global.moeda++;
}