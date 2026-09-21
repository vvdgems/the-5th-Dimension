// Post-Draw Event
if (shader_is_compiled(shd_wave)) {
    shader_set(shd_wave);
    
    // Pass parameters to shader
    shader_set_uniform_f(uni_time, wave_time);
    shader_set_uniform_f(uni_amplitude, wave_amplitude);
    shader_set_uniform_f(uni_frequency, wave_frequency);
    
    // Draw the main screen
    draw_surface(application_surface, 0, 0);
    
    shader_reset();
} else {
    draw_surface(application_surface, 0, 0);
}