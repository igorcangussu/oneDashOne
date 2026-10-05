// Se a camera estiver longe, o inimigo não anda
if distance_to_object(Obj_camera) < 720{
	// Inimigo vai andar, ao bater numa parede vai trocar de lado
	if place_meeting(x,y,Obj_tile) or place_meeting(x,y,Obj_inimigo){
		lado = !lado;
	}

	if lado{
		x += 2;
		image_xscale = -1;
	} else{
		x -= 2;	
		image_xscale = 1;
	}

	// Gravidade, inimigo cai
	if place_meeting(x, y + gravidade + 1, Obj_tile){
		gravidade = 0;	
	
	} else{
		y += gravidade;	
	}

	if gravidade < 30{
		gravidade++;
	}
} 
