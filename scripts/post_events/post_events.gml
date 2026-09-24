function increase_number(target_instance, variable_name_string, amount){
    // 1. Get the current value from the target instance
    var current_val = variable_instance_get(target_instance, variable_name_string);
    
    // 2. Set the new, increased value back onto that instance
    variable_instance_set(target_instance, variable_name_string, current_val + amount);
}
function instance_create(_x,_y,_obj){
	x = _x;
	y = _y;
	obj = _obj
    instance_create_depth(x,y,0,obj);
}
