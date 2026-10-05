// Ao mario colidir com o bloco com a gravidade pra cima, o bloco quebra
if global.morto = false {
	if place_meeting(x, y - Obj_mario.gravidade, Obj_mario) and (Obj_mario.gravidade < 0) and global.tamanho > 1{
		instance_destroy();	
		Obj_mario.gravidade = 0;
	}
}

