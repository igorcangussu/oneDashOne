// Ao mario colidir com o bloco com a gravidade pra cima, o bloco da uma moeda
if global.morto = false {
	if place_meeting(x, y - Obj_mario.gravidade, Obj_mario) and (Obj_mario.gravidade < 0) and (sprite = 0){
		Obj_mario.gravidade = 0;
		instance_create_layer(x, y,"Instances", Obj_moeda)
		sprite = 1
	} 
// Bloco muda de sprite
	if sprite = 0{
		sprite_index = Spr_interrogacao
	} else {
		sprite_index = Spr_blocobatido
	}
}