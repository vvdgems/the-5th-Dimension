// Check if the player object exists in the room
if (instance_exists(obj_player)) {
    
    // Calculate distance to the player
    var _dist = distance_to_object(obj_player);
    var _textbox_active = instance_exists(obj_textbox);
    
    // --- COMBINED PROXIMITY CHECK ---
    if (_dist <= interact_radius) {
        
        // 2. Dialogue System: If they press E and no textbox exists...
        if (keyboard_check_pressed(ord("E")) && !_textbox_active) {
			var _text = instance_create_depth(0, 0, 9999, obj_textbox);
            _text.dialogue = dialogue;
            _text.dialogue_index = dialogue_index;
			_text.post_talk_event = post_talk_event;
            _text.pt_which = pt_which;
			_text.pt_argument_one = pt_argument_one;
			_text.pt_argument_two = pt_argument_two;
			_text.pt_argument_three = pt_argument_three;
        }
        
        // 3. Prompt System: Create a prompt if we don't already have one
        if (my_prompt == noone) {
            my_prompt = instance_create_depth(x, y, depth + 1, obj_talktome);
        }
        
    } else {        
        
        // 2. Prompt System: Player walked away, send prompt to dying state
        if (my_prompt != noone && instance_exists(my_prompt)) {
            my_prompt.state = "dying"; 
            my_prompt.target_y = my_prompt.floor_y; 
            
            // Clear the variable so the NPC is ready to spawn a new one
            my_prompt = noone; 
        }
    }
}