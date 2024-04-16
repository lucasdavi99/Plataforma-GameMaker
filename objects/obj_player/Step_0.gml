/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Player control

var _chao = place_meeting(x, y + 1, obj_chao);
var _left, _right, _up, _down, _jump;
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);

if(timer_dano <= 0){
	velh = (_right - _left) * vel;
}


//jump

if(_chao){
	if(_jump) {
	velv = -vel_jump;
	} 
	
	if(velh != 0) {
		sprite_index = spr_player_run;
		image_xscale = sign(velh);
	} else {
		sprite_index = spr_player_idle;
	}
	
} else {
	if(velv < 0) {
		sprite_index = spr_player_jump;
	} else {
		sprite_index = spr_player_fall;
		
		var _inimigo = instance_place(x, y + 5, obj_inimigo_pai);
		
		if(_inimigo) {
			dano = false;
			
			if(_inimigo.dead == false) {
				velv = -vel_jump;
				_inimigo.dano = true;
			}
		}
	}
	
	// Gravity application
	velv += grav;
	
	if(velh != 0) {
		image_xscale = sign(velh);
	}
}

if(dano) {
	sprite_index = spr_player_hit
}

if(timer_dano > 0) {
	timer_dano-=2;
} else {
	dano = false
}

if(inv_timer > 0) {
	inv_timer--;
	
	image_alpha = .5;
} else {
	image_alpha = 1;
}

var _inimigo = instance_place(x, y, obj_inimigo_pai);

if(_inimigo && inv_timer <= 0){
	
	if(_inimigo.dead == false && _inimigo.dano == false) {
		dano = true;
		timer_dano = tempo_dano;
		inv_timer = inv_tempo;
	}
}