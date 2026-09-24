
switch (state)
{
    case "start":
        if instance_exists(obj_player) {obj_player.canmove = false;}
      //  if instance_exists(obj_enemy) {obj_enemy.canmove = false;}
        var _speed = 1; 
        var _amount = 1 - exp(-_speed * (delta_time / 10000));
        draw_y = lerp(draw_y, target_y, _amount);
        canidrawyet = false;
        
        var _mmax_width = 550; 
        var _parsed = dialogue_parse_tags(dialogue[dialogue_index]);
        dialogue_tags = _parsed.tags;
        wrapped_text = string_wordwrap_width(_parsed.clean_text, _mmax_width, "\n", true);
        
        portrait_sprite = -1;
        for (var _t = 0; _t < array_length(dialogue_tags); _t++)
        {
            if (dialogue_tags[_t].pos == 1 && dialogue_tags[_t].type == "face")
            {
                portrait_sprite = asset_get_index(dialogue_tags[_t].val);
            }
        }
        
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
                    var _parsed = dialogue_parse_tags(dialogue[dialogue_index]);
                    dialogue_tags = _parsed.tags;
                    wrapped_text = string_wordwrap_width(_parsed.clean_text, _max_width, "\n", true);
                    
                    portrait_sprite = -1;
                    for (var _t = 0; _t < array_length(dialogue_tags); _t++)
                    {
                        if (dialogue_tags[_t].pos == 1 && dialogue_tags[_t].type == "face")
                        {
                            portrait_sprite = asset_get_index(dialogue_tags[_t].val);
                        }
                    }
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
        var _dspeed = 500; 
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
        //if instance_exists(obj_enemy) {obj_enemy.canmove = true;}
        instance_destroy();
        break;
}

angle+=2;