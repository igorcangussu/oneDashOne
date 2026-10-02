// Andar esquerda e direita

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
if time < 61{ // Isso está aqui para a bandeira la em baixo
	
	
	if not place_meeting(x + move_x, y + 1, Obj_tile){
		x += velocidadeD;
		x += velocidadeE;
	} 

	// Gravidade, personagem constantemente sendo puxado para baixo
	if place_meeting(x, y + gravidade + 1, Obj_tile){
		gravidade = 0;	
	
	
	} else{
		y += gravidade;	
	}

	if gravidade < 30{
		gravidade++;
	}
}
// Pulo, personagem pula e cai de acordo com o tanto que apertou o espaço
if keyboard_check_pressed(vk_space) && place_meeting(x, y + 40, Obj_tile){
	gravidade = -22
}

if keyboard_check_released(vk_space) && gravidade < -5 {
	gravidade = -5
}

// Matar inimigo

var idInimigo = instance_nearest(x, y, Obj_inimigo)

if place_meeting(x, y + gravidade, Obj_inimigo) && gravidade > 5 {
	instance_destroy(idInimigo)
	if keyboard_check(vk_space){
		gravidade = -20
	} else {
		gravidade = -10
		}
} else if place_meeting(x, y, idInimigo){
	instance_destroy(Obj_mario);
	global.morto = true;
}

// Ganhar partida
if time = 0{
	prevy = y;	
}
if Obj_bandeira.ganhou = 1{
	time++;	
	x = Obj_bandeira.x - 24;
	y = prevy;
}

if (time = 61) {
	Obj_bandeira.ganhou = 0;
	x += 96;
	time++;
}

if (time > 61){
	if !place_meeting(x,y + 3, Obj_tile){
		time++;
		gravidade = 0;
		velocidadeD = 0;
		velocidadeD = 0;
		y += 3
	} else{
		x += 3;	
	}

}

// Sprite

if move_x > 1{
	image_xscale = -1;
} else if move_x < -1{
	image_xscale = 1;
}

if !place_meeting(x, y + gravidade + 2, Obj_tile){
	sprite_index = Spr_jump
} else{
	sprite_index = Spr_mario;	
}

if (sprite_index = Spr_mario){
	if keyboard_check(vk_left) or keyboard_check(vk_right){
		image_speed = 2
	} else{
		image_speed = 0
		image_index = 0
	}	
	


}

if (sprite_index = Spr_jump){
	if gravidade > 0 {
		image_index = 0	
	} else {
		image_index = 1	
	}
}

