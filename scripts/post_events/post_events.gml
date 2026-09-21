function increase_number(target_instance, variable_name_string, amount){
    // 1. Get the current value from the target instance
    var current_val = variable_instance_get(target_instance, variable_name_string);
    
    // 2. Set the new, increased value back onto that instance
    variable_instance_set(target_instance, variable_name_string, current_val + amount);
}

function chest(one = undefined, two = undefined, bux = 0){
	if one != undefined
	{
		inv_add(obj_inventory.inv,one,1);
	}
	if two != undefined
	{
		inv_add(obj_inventory.inv,two,1);
	}
	if bux != 0 
	{
		obj_player.bux+=bux;
	}
}
