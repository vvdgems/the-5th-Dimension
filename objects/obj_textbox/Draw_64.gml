// 1. Setup typography
draw_set_font(font); // Make sure to set your font so sizes match!
draw_set_halign(halign);
draw_set_valign(valign);
draw_set_color(text_color);

// 2. Render elements if active
if (canidrawyet == true)
{
    // FIRST: Draw the box
    draw_sprite_ext(spr_textbox, 0, draw_x, draw_y, 22, 7, 0, c_white, textbox_alpha);
    
    // SECOND: Draw the typed portion of the pre-wrapped text layer
    // CHANGED: wrapped_text -> current_visible_text
    draw_text(draw_x+padding, draw_y+padding, current_visible_text);
	
	if shadowbool = true
	{
		draw_text_shadow(draw_x,draw_y,current_visible_text,text_color,text_color,0.15,5,angle);
		draw_text_shadow(draw_x,draw_y,current_visible_text,text_color,text_color,0.15,7.5,-angle);
	}
}