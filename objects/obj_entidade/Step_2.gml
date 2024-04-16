/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//horizontal collision
//checking for collision with the wall

var _col = instance_place(x + velh, y, obj_chao);
if(_col) {
	if(velh > 0) {
		x = _col.bbox_left + (x - bbox_right);
	}
	
	if(velh < 0) {
		x = _col.bbox_right + (x - bbox_left);
	}
	
	velh = 0;
}

x += velh;

var _coll = instance_place(x, y + velv, obj_chao);
if(_coll) {
	if(velv > 0) {
		y = _coll.bbox_top + (y - bbox_bottom);
	}
	
	if(velv < 0) {
		y = _coll.bbox_bottom + (y - bbox_top);
	}
	
	velv = 0;
}

y += velv; 