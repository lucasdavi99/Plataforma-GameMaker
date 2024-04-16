 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(sprite_index == spr_inimigo_porco_dano) {
	sprite_index = spr_inimigo_porco_dead;
	dead = true;
}

if(sprite_index == spr_inimigo_porco_dead) {
	image_speed = 0;
	image_index = 3;
}