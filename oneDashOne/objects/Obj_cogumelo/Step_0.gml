// Anda de um lado para o outro
if place_meeting(x,y,Obj_tile){
	lado = !lado;
}

// Se estiver um bloco, ascende até sair dele
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

// Ao encostar no mário, cresce ele
if place_meeting(x, y, Obj_mario) {
	if global.tamanho < 3 {
		global.tamanho = 2	
	}
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



