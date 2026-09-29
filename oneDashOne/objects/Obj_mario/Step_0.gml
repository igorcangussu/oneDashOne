//andar esquerda e direita
if keyboard_check(vk_right){
	velocidadeD++;	
} else if (velocidadeD > 0) {
	velocidadeD--;	
}

if keyboard_check(vk_left){
	velocidadeE--;	
} else if (velocidadeE < 0) {
	velocidadeE++;	
}

if velocidadeD > 10 {
	velocidadeD = 10;	
}

if velocidadeE < -10 {
	velocidadeE = -10;	
}

var move_x = velocidadeD + velocidadeE;



if not place_meeting(x +move_x, y + 1, Obj_tile){
	x += velocidadeD;
	x += velocidadeE;
} 

//gravidade, personagem constantemente sendo puxado para baixo
if place_meeting(x, y + gravidade + 1, Obj_tile){
	gravidade = 0;	
	
	
} else{
	y += gravidade;	
}

if gravidade < 30{
	gravidade++;
}

//pulo, personagem pula e cai de acordo com o tanto que apertou o espaço
if keyboard_check_pressed(vk_space) && place_meeting(x, y + 40, Obj_tile){
	gravidade = -25
}

if keyboard_check_released(vk_space) && gravidade < -5 {
	gravidade = -5
}

// Matar inimigo

var idInimigo = instance_nearest(x, y, Obj_inimigo)

if place_meeting(x, y + gravidade, Obj_inimigo) && gravidade > 5 {
	instance_destroy(idInimigo)
	if keyboard_check(vk_space){
		gravidade = -25
	} else {
		gravidade = -10
		}
} else if place_meeting(x, y, idInimigo){
	instance_destroy(Obj_mario);
	global.morto = true;
}

