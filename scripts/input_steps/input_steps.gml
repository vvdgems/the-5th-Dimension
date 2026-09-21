function input_steps(){
        right   = keyboard_check(ord("D"));
        left    = keyboard_check(ord("A"));
        up      = keyboard_check(ord("W"));
		down    = keyboard_check(ord("S"));
        shift   = keyboard_check(vk_shift);
        
        attack1 = keyboard_check(ord("Q"));
        attack2 = keyboard_check(ord("E"));
        defend1 = keyboard_check(ord("1")); 
       defend2 = keyboard_check(ord("3"));
}