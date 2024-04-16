    /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

velv += grav; 

if(momento == "off") {
	sprite_index = spr_bomba;
} else if(momento == "on") {
	sprite_index = spr_bomba_on;
	
	if(boom_timer > 0) {
		boom_timer--;
	} else {
		momento = "boom";
	}
}else if(momento == "boom") {
	if(sprite_index != spr_bomba_boom) {
		sprite_index = spr_bomba_boom;
		image_index = 0;
	}
	
	if(image_index >= image_number -1) {
		instance_destroy();
	}
	
	//colisão com player
	var _player = instance_place(x, y, obj_player);
	if(_player){
		with(_player) {
			dano = true;
			timer_dano = tempo_dano;
			inv_timer = inv_tempo;
		}
	}
}