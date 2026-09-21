depth = -1;

if (hp > maxhp) { hp = maxhp; }

input_steps();

var final_hsp = 0;
var final_vsp = 0;

// =================================================================
// 1. MOVEMENT INPUTS
// =================================================================
var _inv_open = false

if (canmove && !_inv_open) 
{
    hsp = right - left;
    vsp = down - up;

    var _shift_mult = shift ? 2 : 1;
    var walk_multiplier = spd * _shift_mult;

    final_hsp = hsp * walk_multiplier;
    final_vsp = vsp * walk_multiplier;
}

// =================================================================
// 2. MOVEMENT & WALL COLLISIONS
// =================================================================
if (canmove)
{
    // Horizontal Movement & Slopes
    var onepixel = sign(final_hsp);
    if (place_meeting(x + final_hsp, y, obj_wall)) {
        var slope_check = 0;
        while (place_meeting(x + final_hsp, y - slope_check, obj_wall) && slope_check <= abs(final_hsp)) {
            slope_check++;
        }
    
        if (place_meeting(x + final_hsp, y - slope_check, obj_wall)) {
            while (!place_meeting(x + onepixel, y, obj_wall)) {
                x += onepixel;
            }
            final_hsp = 0;
            hsp = 0;
        } else {
            y -= slope_check;
        }
    }
    x += final_hsp;

    // Vertical Movement
    var oneypixel = sign(final_vsp);
    if (place_meeting(x, y + final_vsp, obj_wall)) {
        while (!place_meeting(x, y + oneypixel, obj_wall)) {
            y += oneypixel;
        }
        final_vsp = 0;
        vsp = 0;
    }
    y += final_vsp;

    if (vsp >= 0) {
        if (!place_meeting(x, y + 1, obj_wall) && place_meeting(x, y + abs(final_hsp) + 1, obj_wall)) {
            while (!place_meeting(x, y + 1, obj_wall)) {
                y++;
            }
        }
    }
}

// =================================================================
// 3. ANIMATIONS & SPRITES
// =================================================================
var _is_moving = (hsp != 0 || vsp != 0);

// Update facing direction when walking
if (_is_moving) {
    if (hsp > 0)       { facing = "right"; } 
    else if (hsp < 0)  { facing = "left"; } 
    else if (vsp < 0)  { facing = "up"; } 
    else if (vsp > 0)  { facing = "down"; } 
}

// Ensure normal scaling & depth
image_xscale = 1;
image_yscale = 1;
image_angle  = 0;
image_alpha  = 1;
depth        = (facing == "up") ? 0 : -1;

// Assign directional movement sprite
var _new_sprite = sprite_index; 
if (facing == "right")      { _new_sprite = spr_player_right; }
else if (facing == "left")  { _new_sprite = spr_player_left; }
else if (facing == "up")    { _new_sprite = spr_player_up; }
else if (facing == "down")  { _new_sprite = spr_player_down; }
else if (facing == "hold_on") { _new_sprite = spr_player_boss_idle; }

sprite_index = _new_sprite; 

// Freeze sprite on frame 0 when still, play animation when moving
if (!_is_moving && facing != "hold_on") { 
    image_speed = 0; 
    image_index = 0; 
} else {
    image_speed = (shift) ? 1.5 : 1;
}

if (xp >= 500)      { lvl = 5; }
else if (xp >= 400) { lvl = 4; }
else if (xp >= 300) { lvl = 3; }
else if (xp >= 200) { lvl = 2; }
else if (xp >= 100) { lvl = 1; }
else                { lvl = 0; }

if (timer > 0) 
{
    timer--;
    invul = true;
    
    if (timer mod 8 < 4) 
    {
        image_alpha = 0.3;
    } 
    else 
    {
        image_alpha = 1.0;
    }
} 
else 
{
    invul = false;
    image_alpha = 1.0;
}