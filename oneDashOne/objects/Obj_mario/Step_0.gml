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
var move_x = velocidadeD + velocidadeE; // Variavel responsavel por lidar com algumas colisões

 // Isso está aqui para a bandeira la em baixo
if time < 61{
	
	// Trecho responsável de realmente mudar a posição do personagem com base na velocidade
	if not place_meeting(x + move_x, y + 1, Obj_tile){ 
		x += velocidadeD;
		x += velocidadeE;
	} 

	// Gravidade, personagem cai quando nao esta em contato com o tile
	if place_meeting(x, y + gravidade + 1, Obj_tile){
		gravidade = 0;	
	
	} else{
		y += gravidade;	
	}

	if gravidade < 30{
		gravidade++;
	}
}

// Pulo, segurar o espaço faz pular mais alto
if keyboard_check_pressed(vk_space) && place_meeting(x, y + 40, Obj_tile){
	gravidade = -22
}

if keyboard_check_released(vk_space) && gravidade < -5 {
	gravidade = -5
}

// Matar inimigo

var idInimigo = instance_nearest(x, y, Obj_inimigo) // Pega o inimigo mais próximo

// Se a gravidade for para baixo, inimigo morre, se não, o Mario toma dano
if place_meeting(x, y + gravidade, Obj_inimigo) && gravidade > 5 {
	instance_destroy(idInimigo)
	if keyboard_check(vk_space){
		gravidade = -20
	} else {
		gravidade = -10
		}
} else if place_meeting(x, y, idInimigo) && invencivel >= 90{
	global.tamanho--;
	invencivel = 0;
	y -= 5;
}

// Tempo de 1 segundo e meio depois de tomar dano do inimigo, personagem pisca e fica imune ao dano
if invencivel < 90 {
	invencivel++;
	image_alpha = choose (.5, .8, .1);	
} else {
	image_alpha = 1;
}

// Se tomar dano quando pequeno, morre
if global.tamanho = 0{
	global.morto = true;
	instance_destroy()
	
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

// Troca o lado que o Mario ta olhando
if move_x > 1{
	image_xscale = -1;
} else if move_x < -1{
	image_xscale = 1;
}

// Muda o sprite do mario baseado no tamanho dele
if (global.tamanho = 1){
	if !place_meeting(x, y + gravidade + 2, Obj_tile){
		sprite_index = Spr_jump
	} else{
		sprite_index = Spr_mario;	
	}
	
} else if (global.tamanho = 2){
	if !place_meeting(x, y + gravidade + 2, Obj_tile) and global.tamanho = 2{
		sprite_index = Spr_jumpgrande
	} else{
		sprite_index = Spr_mariogrande;	
	}
} else if (global.tamanho = 3){
	if !place_meeting(x, y + gravidade + 2, Obj_tile) and global.tamanho = 3{
		sprite_index = Spr_jumpflor
	} else{
		sprite_index = Spr_marioflor;	
	}
}

// Faz a animação do sprite acontecer 
if (sprite_index = Spr_mario) or (sprite_index = Spr_mariogrande) or (sprite_index = Spr_marioflor){
	if keyboard_check(vk_left) or keyboard_check(vk_right){
		image_speed = 2
	} else{
		image_speed = 0
		image_index = 0
	}	
	
}

// No ar faz animação de pulo baseado na gravidade
if (sprite_index = Spr_jump) or (sprite_index = Spr_jumpgrande) or (sprite_index = Spr_jumpflor){
	if gravidade > 0 {
		image_index = 0	
	} else {
		image_index = 1	
	}
}


// Bola de fogo

if global.tamanho = 3 and keyboard_check_pressed(ord("Z")) and image_xscale = -1{
	instance_create_layer(x, y - 40,"Instances", Obj_fogo)
}

if global.tamanho = 3 and keyboard_check_pressed(ord("Z")) and image_xscale = 1{
	instance_create_layer(x, y - 40,"Instances", Obj_fogoesquerda)
}
