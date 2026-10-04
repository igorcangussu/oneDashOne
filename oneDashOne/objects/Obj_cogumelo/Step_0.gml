if distance_to_object(Obj_camera) < 720{
	if place_meeting(x,y,Obj_tile){
		lado = !lado;
	}
if place_meeting(x, y, Obj_interrogacao){

	y--;
	lado = true;
} else {
	if lado{
		x += 2;
	} else{
		x -= 2;	
	}

}

if place_meeting(x, y, Obj_mario){
	global.tamanho = 2
	instance_destroy();	
}
	
	// Gravidade, cogumelo cai
	if place_meeting(x, y + gravidade + 1, Obj_tile){
		gravidade = 0;	
	
	} else{
		y += gravidade;	
	}

	if gravidade < 30{
		gravidade++;
	}

} 

