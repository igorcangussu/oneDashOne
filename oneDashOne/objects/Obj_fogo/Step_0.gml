	// Gravidade, inimigo cai
	if place_meeting(x, y + gravidade + 1, Obj_tile){
		gravidade = -15;	
	
	} else{
		y += gravidade;	
	}

	if gravidade < 15{
		gravidade++;
	}

if place_meeting(x, y, Obj_tile){
	instance_destroy()
}

x += 15;

