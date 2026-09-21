fade_alpha += fade_speed * fade_state;

// If we reached full black, swap rooms and move the player
if (fade_alpha >= 1 && fade_state == 1)
{
    fade_alpha = 1;
    fade_state = -1; 
    
    if (room_exists(target_room))
    {
        room_goto(target_room);
        
        // --- NEW CODE: RELOCATE PLAYER ---
        // If the player exists in the new room, snap them to the door coordinates
        if (instance_exists(obj_player))
        {
            if (target_x != -1) obj_player.x = target_x;
            if (target_y != -1) obj_player.y = target_y;
        }
    }
}

if (fade_alpha <= 0 && fade_state == -1)
{
    instance_destroy();
}