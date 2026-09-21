if state = "alive"
{
var _speed = 5; 
var _amount = 1 - exp(-_speed * (delta_time / 1000000));
y = lerp(y, target_y, _amount);
} else if (state == "dying") {
    var _dt = delta_time / 1000000;
    var _gravity = 800; 
    vspeed += _gravity * _dt;
    y += vspeed * _dt;
    if (y >= floor_y) {
        y = floor_y;
        instance_destroy();
    }
}

depth = 1;