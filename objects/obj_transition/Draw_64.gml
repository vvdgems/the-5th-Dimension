if (fade_alpha > 0)
{
    draw_set_color(c_black);
    draw_set_alpha(fade_alpha);
    
    // Draw over the entire GUI canvas
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    // Reset alpha back to normal so nothing else goes transparent
    draw_set_alpha(1);
}