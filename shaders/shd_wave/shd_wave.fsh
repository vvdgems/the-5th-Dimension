varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float u_amplitude; // Wave strength in UV space (e.g., 0.005 to 0.02)
uniform float u_frequency; // How tightly packed the waves are (e.g., 20.0 to 50.0)

void main() {
    vec2 coord = v_vTexcoord;
    
    // Offset the X coordinate based on a sine wave of the Y coordinate + time
    coord.x += sin(coord.y * u_frequency + u_time) * u_amplitude;
    
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, coord);
}