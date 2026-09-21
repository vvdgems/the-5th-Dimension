// Uniform handles
uni_time      = shader_get_uniform(shd_wave, "u_time");
uni_amplitude = shader_get_uniform(shd_wave, "u_amplitude");
uni_frequency = shader_get_uniform(shd_wave, "u_frequency");

// Wave parameters
wave_time      = 0;
wave_speed     = 0.025;  // Speed of the wave animation
wave_amplitude = 0.0084 // Wave intensity/distortion size
wave_frequency = 15.0;  // Number of wave ripples vertically

application_surface_draw_enable(false);