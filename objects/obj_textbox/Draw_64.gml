draw_set_font(font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(text_color);

// 1. Evaluate face tags BEFORE drawing portrait or calculating offsets
var _len = min(string_length(wrapped_text), floor(char_index));
for (var _t = 0; _t < array_length(dialogue_tags); _t++)
{
    var _tag = dialogue_tags[_t];
    if (_tag.pos <= max(1, _len) && _tag.type == "face")
    {
        portrait_sprite = asset_get_index(_tag.val);
    }
}

var _text_offset_x = 0;

if (canidrawyet)
{
    // Draw Textbox Background
    draw_sprite_ext(spr_textbox, 0, draw_x, draw_y, 22, 7, 0, c_white, textbox_alpha);
    
    var _portrait_scale = 2;

    if (sprite_exists(portrait_sprite))
    {
        var _ox = sprite_get_xoffset(portrait_sprite) * _portrait_scale;
        var _oy = sprite_get_yoffset(portrait_sprite) * _portrait_scale;
        
        var _portrait_x = draw_x + padding + _ox;
        var _portrait_y = draw_y + padding + _oy;
        
        draw_sprite_ext(portrait_sprite, 0, _portrait_x, _portrait_y, _portrait_scale, _portrait_scale, 0, c_white, 1);
        
        _text_offset_x = (sprite_get_width(portrait_sprite) * _portrait_scale) + padding;
    }
}

var _final_text_x = draw_x + padding + _text_offset_x;
var _final_text_y = draw_y + padding;

// 2. Slice the text for the typewriter effect so shadows don't show early
var _visible_text = string_copy(wrapped_text, 1, _len);

if (shadowbool)
{
    draw_text_shadow(_final_text_x, _final_text_y, _visible_text, text_color, text_color, 0.15, 5, angle);
    draw_text_shadow(_final_text_x, _final_text_y, _visible_text, text_color, text_color, 0.15, 7.5, -angle);
}

draw_dialogue_tagged_text(_final_text_x, _final_text_y, wrapped_text, dialogue_tags, char_index);