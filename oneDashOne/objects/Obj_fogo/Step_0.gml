// Quica se bater no chão
if place_meeting(x, y + gravidade + 1, Obj_tile){
	gravidade = -12;	
	
} else{
	y += gravidade;	
}

if gravidade < 12{
	gravidade++;
}

// Quebra ao bater numa parede horizontalmente
if place_meeting(x, y, Obj_tile){
	instance_destroy()
}

x += 13

// Pega o inimigo mais próximo
var idInimigo = instance_nearest(x, y, Obj_inimigo) 

// Mata inimigo e a si mesmo
if place_meeting(x,y, Obj_inimigo){
	instance_destroy()	
	instance_destroy(idInimigo)
}