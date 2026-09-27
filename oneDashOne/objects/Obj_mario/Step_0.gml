//andar esquerda e direita

if keyboard_check(vk_right){
	global.velocidadeD++;	
} else if (global.velocidadeD > 0) {
	global.velocidadeD--;	
}

if keyboard_check(vk_left){
	global.velocidadeE--;	
} else if (global.velocidadeE < 0) {
	global.velocidadeE++;	
}

if global.velocidadeD > 10 {
	global.velocidadeD = 10;	
}

if global.velocidadeE < -10 {
	global.velocidadeE = -10;	
}

var move_x = global.velocidadeD + global.velocidadeE;



if not place_meeting(x +move_x, y + 1, Obj_tile){
	x += global.velocidadeD;
	x += global.velocidadeE;
} 

//gravidade
if place_meeting(x, y + global.gravidade + 1, Obj_tile){
	global.gravidade = 0;	
	
	
} else{
	y += global.gravidade;	
}

if global.gravidade < 30{
	global.gravidade++;
}

//pulo

if keyboard_check_pressed(vk_space) && place_meeting(x, y + 40, Obj_tile){
	global.gravidade = -25
}

if keyboard_check_released(vk_space) && global.gravidade < -5 {
	global.gravidade = -5
}
