
// Inimigo vai andar, ao bater numa parede vai trocar de direção
if place_meeting(x,y,Obj_tile) || place_meeting(x,y,Obj_inimigo){
	lado = !lado;
}

if lado{
	x += 2;
} else{
	x -= 2;	
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