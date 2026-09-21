if enabled = true && place_meeting(x,y,obj_player)
{
	var _inst = instance_create_depth(0, 0, 0, obj_transition);
	_inst.target_room = target_room; 
	_inst.target_x = target_x;  // The X coordinate in the next room
	_inst.target_y = target_y;  // The Y coordinate in the next room
}

show_debug_message(enabled)