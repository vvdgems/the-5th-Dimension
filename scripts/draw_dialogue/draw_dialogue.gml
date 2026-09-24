function draw_dialogue_tagged_text(_x, _y, _text, _tags, _visible_chars)
{
    var _cur_color = c_white;
    var _color_stack = [];
    var _draw_x = _x;
    var _draw_y = _y;
    var _line_height = string_height("M");
    var _len = min(string_length(_text), floor(_visible_chars));
    
    for (var _t = 0; _t < array_length(_tags); _t++)
    {
        var _tag = _tags[_t];
        if (_tag.pos <= max(1, _len) && _tag.type == "face")
        {
            portrait_sprite = asset_get_index(_tag.val);
        }
    }
    
    for (var _i = 1; _i <= _len; _i++)
    {
        for (var _t = 0; _t < array_length(_tags); _t++)
        {
            var _tag = _tags[_t];
            if (_tag.pos == _i)
            {
                if (_tag.type == "color")
                {
                    array_push(_color_stack, _cur_color);
                    switch (_tag.val)
                    {
                        case "red": _cur_color = c_red; break;
                        case "blue": _cur_color = c_blue; break;
                        case "green": _cur_color = c_green; break;
                        case "yellow": _cur_color = c_yellow; break;
                        case "white": _cur_color = c_white; break;
                        case "super_bean": 
                            var _hue = (current_time / 10) mod 256;         
                            _cur_color = make_colour_hsv(_hue, 255, 255); 
                            break;
                        default:
                            if (string_char_at(_tag.val, 1) == "#")
                            {
                                var _hex = string_delete(_tag.val, 1, 1);
                                var _r = real("0x" + string_copy(_hex, 1, 2));
                                var _g = real("0x" + string_copy(_hex, 3, 2));
                                var _b = real("0x" + string_copy(_hex, 5, 2));
                                _cur_color = make_color_rgb(_r, _g, _b);
                            }
                            break;
                    }
                }
                else if (_tag.type == "/color")
                {
                    if (array_length(_color_stack) > 0)
                    {
                        _cur_color = array_pop(_color_stack);
                    }
                    else
                    {
                        _cur_color = c_white;
                    }
                }
            }
        }
        
        var _char = string_char_at(_text, _i);
        if (_char == "\n")
        {
            _draw_x = _x;
            _draw_y += _line_height;
            continue;
        }
        
        draw_text_color(_draw_x, _draw_y, _char, _cur_color, _cur_color, _cur_color, _cur_color, 1);
        _draw_x += string_width(_char);
    }
}

function dialogue_parse_tags(_text)
{
    var _clean = "";
    var _tags = [];
    var _len = string_length(_text);
    var _i = 1;
    
    while (_i <= _len)
    {
        var _char = string_char_at(_text, _i);
        if (_char == "[")
        {
            var _close_pos = string_pos_ext("]", _text, _i);
            if (_close_pos != 0)
            {
                var _tag_str = string_copy(_text, _i + 1, _close_pos - _i - 1);
                var _clean_pos = string_length(_clean) + 1;
                
                var _colon_pos = string_pos(":", _tag_str);
                var _type = _tag_str;
                var _val = "";
                if (_colon_pos != 0)
                {
                    _type = string_copy(_tag_str, 1, _colon_pos - 1);
                    _val = string_delete(_tag_str, 1, _colon_pos);
                }
                
                array_push(_tags, {
                    pos: _clean_pos,
                    type: _type,
                    val: _val
                });
                
                _i = _close_pos + 1;
                continue;
            }
        }
        _clean += _char;
        _i++;
    }
    
    return { clean_text: _clean, tags: _tags };
}