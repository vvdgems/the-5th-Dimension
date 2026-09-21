if (follow != noone)
{
	x_to = follow.x;
	y_to = follow.y;
}	

x += (x_to - x) / 10;
y += (y_to - y) / 10;

var _clamped_x = clamp(x, camera_width * 0.5, room_width - (camera_width * 0.5));
var _clamped_y = clamp(y, camera_height * 0.5, room_height - (camera_height * 0.5));

var _shake_x = random_range(-shake_remain, shake_remain);
var _shake_y = random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - (shake_magnitude / shake_length));

camera_set_view_pos(
    view_camera[0], 
    (_clamped_x - (camera_width * 0.5)) + _shake_x, 
    (_clamped_y - (camera_height * 0.5)) + _shake_y
);