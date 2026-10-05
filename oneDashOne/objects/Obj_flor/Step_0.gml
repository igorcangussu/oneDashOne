// Flor ascende em contato com o bloco
if place_meeting(x, y, Obj_interrogacao){
	y--;
} 

if place_meeting(x, y, Obj_mario){
	global.tamanho = 3;
	instance_destroy();	
}