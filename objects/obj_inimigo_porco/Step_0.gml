/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (dead)
{
    sprite_index = spr_inimigo_porco_dead;

    if (image_speed <= 0)
    {
        image_alpha -= 0.01

            if (image_alpha <= 0)
        {
            instance_destroy();
        }
    }

    exit;
}

var _chao = place_meeting(x, y + 1, obj_chao);

if (estado == "normal")
{
    var _bomba = instance_place(x, y, obj_bomba);

    if (_bomba)
    {
        if (_bomba.momento == "off")
        {
            estado = "fosforo_on";
        }
    }

    if (_chao)
    {
        tempo_andar -= 1;
        if (tempo_andar <= 0)
        {
            andando = choose(true, false);

            if (andando)
            {
                velh = choose(vel, -vel);
            }
            else
            {
                velh = 0;
            }

            tempo_andar = room_speed * 2;
        }

        if (velh != 0 && dano == false)
        {
            sprite_index = spr_inimigo_porco_run;
            image_xscale = sign(velh);
        }
        else
        {
            sprite_index = spr_inimigo_porco_idle;
        }

        if (place_meeting(x + velh, y, obj_chao))
        {
            velh *= -1
        }

        if (pode_cair == false)
        {
            if (place_meeting(x + velh * 10, y + 1, obj_chao) == false)
            {
                velh *= -1;
            }
        }
    }
    else
    {
        velv += grav if (velh != 0)
        {
            image_xscale = sign(velh);
        }
    }
}
else if (estado == "fosforo_on")
{
	if(sprite_index != spr_porco_fosforo_on)
	{
		sprite_index = spr_porco_fosforo_on;
		image_index = 0;
	}
	velh = 0;
	
	if(image_index >= image_number - 1)
	{
		estado = "fosforo_bomba";
	}
}
else if(estado == "fosforo_bomba")
{
	if(sprite_index != spr_porco_fosforo_bomba)
	{
		sprite_index = spr_porco_fosforo_bomba;
		image_index = 0;
	}
	
	if(image_index >= image_number - 1)
	{
		var _bomba = instance_place(x, y, obj_bomba);
		if(_bomba)
		{
			_bomba.momento = "on"
		}
		estado = "normal";
	}
}

if (dano && dead == false)
{
    sprite_index = spr_inimigo_porco_dano;
    velh = 0;
}