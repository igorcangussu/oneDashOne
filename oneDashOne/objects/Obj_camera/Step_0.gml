// A Room1 segue a camera, e a camera segue o player ao chegar numa certa distância
if global.morto = true{
	instance_destroy(Obj_camera)
} else{
	camD = Obj_mario.velocidadeD
	camE = Obj_mario.velocidadeE	
	
	if (Obj_mario.x > x + 30){
		x+= camD
	}

	if  (Obj_mario.x < x - 300){
		x+=camE
	}
	
	// Segurança pra caso mario sumir da tela
	if distance_to_object(Obj_mario) > 720{
	 x = Obj_mario.x	
	}
}


