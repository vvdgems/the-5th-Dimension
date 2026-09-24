draw_self() // draw the normal image

if (entitycollision) { 

	surface_entity = surface_create(sprite_width, sprite_height)
	if (surface_exists(surface_entity)) {
		
		surface_set_target(surface_entity)
	
		draw_clear_alpha(c_black, 0);

		with(obj_entity) {
			// make this one a little transparent 
			draw_sprite_ext(sprite_index,image_index,x-other.x,y-other.y+14,1,-1,0,c_white,0.5*image_alpha) // give it a little offset
		}
	
		gpu_set_blendmode(bm_min) 
		draw_sprite(sprite_index,1,0,0)
		gpu_set_blendmode(bm_normal)

		surface_reset_target()
	
		draw_surface(surface_entity,x,y)
	
		surface_free(surface_entity)
	}

}