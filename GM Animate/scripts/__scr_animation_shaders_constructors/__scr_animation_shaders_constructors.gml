///@HINT: Ajoute un header rigolo : https://www.asciiart.eu/text-to-ascii-art
/// Font : big - Narrow - Narrow - 80
/// Border: PlusBox v2 - 0 - 2
/// Comment Style : Single Line Double Slash: // - Standard - 16 pt
function __shader_effect() constructor{
	owner = other.id;

	static __animation_shader_get_index = function() {
		var _shader_array = owner.gma_animations[track].shaders;
		for (var i = 0, _len = array_length(_shader_array); i < _len; ++i) {
		    if _shader_array[i] == self {
				return i;
			}
		}
	}
	
	static step = undefined
}

function __animation_shader_flash(_label, _duration, _color, _mix, _priority, _on_finish, _remove, _track = 0) : __shader_effect() constructor {
	name		= "flash";
	shader		= sh_animation_flash;
	
	label		= _label;
	duration	= _duration;
	color		= _color;
	priority	= _priority;
	on_finish	= _on_finish;
	remove		= _remove;
	track		= _track;
	
	//uniforms
	u_color = shader_get_uniform(shader, "u_color");
    u_mix	= shader_get_uniform(shader, "u_mix");
    
    // variables
    mix = abs(clamp(_mix, -1, 1))
    rate = _mix >= 0 ? 1/max(1,duration) * 1 : 1/max(1,duration) * -1; //if duration is 0
    
    static set = function(){
    	shader_set_uniform_f(u_mix, mix);

        var r = color_get_red(color) / 255;
        var g = color_get_green(color) / 255;
        var b = color_get_blue(color) / 255;

        shader_set_uniform_f(u_color, r, g, b, 1.0);
    }
    
    static step = function(){
    	
    	mix = clamp(mix + rate, 0, 1);
    	
    	if duration <= 0{
    		if !is_undefined(on_finish){
    			on_finish();
    		}
    		if remove{
    			var _index = __animation_shader_get_index();
				array_delete(owner.gma_animations[track].shaders, _index, 1);
				return
    		}
    	}
		duration -= 1;
    }
}

function __animation_shader_remove(_name, _label, _track){
	var _shaders = gma_animations[_track].shaders;
	for (var i = array_length(_shaders) - 1; i > -1; i--;) {
		if is_undefined(_label){
			if _shaders[i].name == _name {
				array_delete(_shaders, i, 1);
			}
		}
		else if (_shaders[i].name == _name && _shaders[i].label == _label){
			array_delete(_shaders, i, 1);
		}
	}
}