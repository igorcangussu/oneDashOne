if global.morto = false {
	
	if place_meeting(x, y - Obj_mario.gravidade, Obj_mario) and (Obj_mario.gravidade < 0) and (sprite = 0){
	
		Obj_mario.gravidade = 0;
		global.moeda++;
		sprite = 1
	} 

	if sprite = 0{
		sprite_index = Spr_interrogacao
	} else {
		sprite_index = Spr_blocobatido
	}

}