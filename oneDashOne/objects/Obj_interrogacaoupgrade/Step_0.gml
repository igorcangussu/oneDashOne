if global.morto = false {
	
	if place_meeting(x, y - Obj_mario.gravidade, Obj_mario) and (Obj_mario.gravidade < 0) and (sprite = 0){
	
	
		Obj_mario.gravidade = 0;
		
		sprite = 1
		if global.tamanho = 1{
			instance_create_layer(x, y - 10,"Instances", Obj_cogumelo)
		} else if global.tamanho = 2{
			instance_create_layer(x, y - 10,"Instances", Obj_flor)
		}
	} 

	if sprite = 0{
		sprite_index = Spr_interrogacao
	} else {
		sprite_index = Spr_blocobatido
	}

}