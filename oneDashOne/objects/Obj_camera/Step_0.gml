camD = global.velocidadeD
camE = global.velocidadeE

if (Obj_mario.x > x + 30){
		x+= camD
}

if  (Obj_mario.x < x - 300){
	x+=camE
}