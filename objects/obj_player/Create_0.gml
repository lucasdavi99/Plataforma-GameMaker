 /// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

velh = 0;
velv = 0;
vel = 4;
grav = .3;
vel_jump = 8;

dano = false;	
tempo_dano = room_speed * 0.5;
timer_dano = 0;

inv_timer = 0;
inv_tempo = room_speed * 0.5;

inputs = {
	left: ord("A"),
	right: ord("D"),
	jump: vk_space
}