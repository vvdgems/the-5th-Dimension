fade_alpha += fade_speed * fade_state;
if (fade_alpha >= 1 && fade_state == 1)
{
    fade_alpha = 1;
    fade_state = -1; 
    
    if (room_exists(target_room))
    {
        room_goto(target_room);
        if (instance_exists(obj_player))
        {
			obj_player.canmove = false;
            if (target_x != -1) obj_player.x = target_x;
            if (target_y != -1) obj_player.y = target_y;
        }
    }
}

if (fade_alpha <= 0 && fade_state == -1)
{
	obj_player.canmove = true;
    instance_destroy();
}