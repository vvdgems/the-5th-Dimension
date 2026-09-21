switch (state)
{
    case "start":
		if instance_exists(obj_player) {obj_player.canmove = false;}
        var _speed = 15; 
        var _amount = 1 - exp(-_speed * (delta_time / 1000000));
        draw_y = lerp(draw_y, target_y, _amount);
        canidrawyet = false;
        
        var _mmax_width = 550; 
        wrapped_text = string_wordwrap_width(dialogue[dialogue_index], _mmax_width, "\n", true);
        
        if (abs(target_y - draw_y) < 0.5) 
        {
            draw_y = target_y;
            char_index = 0;
            state = "inprog";
        }
        break;

    case "inprog":
		
        canidrawyet = true;
        
        var _text_length = string_length(wrapped_text);
        if (char_index < _text_length) 
        {
            char_index += type_speed;
        }
        
        current_visible_text = string_copy(wrapped_text, 1, floor(char_index));

        if (keyboard_check_pressed(ord("E")))
        {
            if (char_index < _text_length) 
            {
                char_index = _text_length;
            }
            else 
            {
                if (dialogue_index < array_length(dialogue) - 1)
                {
                    dialogue_index++;    
                    char_index = 0;
                    
                    var _max_width = 550; 
                    wrapped_text = string_wordwrap_width(dialogue[dialogue_index], _max_width, "\n", true);
                }
                else 
                {
                    target_y = start_y; 
                    state = "closing";
                }
            }
        }
        break;

    case "closing":
        var _dspeed = 10; 
        var _damount = 1 - exp(-_dspeed * (delta_time / 1000000));
        draw_y = lerp(draw_y, target_y, _damount);
        canidrawyet = false;
        
        if (abs(target_y - draw_y) < 0.5) 
        {
            state = "complete";
        }
        break;

    case "complete":
		if post_talk_event == true
		{
			script_execute(pt_which,pt_argument_one,pt_argument_two,pt_argument_three);	
		}
		if instance_exists(obj_player) {obj_player.canmove = true;}
        instance_destroy();
        break;
}

angle+=2;