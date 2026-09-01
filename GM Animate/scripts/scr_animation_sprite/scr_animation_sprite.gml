function animation_flip_x(_bool, _track = 0){
    __animation_error_checks
    if !is_bool(_bool) show_error($"GM Animate: argument _bool ({_bool}) in `animation_set_flip_x` should be a *boolean*", true)
    
    if _track == all {
		for (var i = 0, _len = array_length(gma_animations); i < _len; ++i) {
		    if gma_animations[i] == 0 {
				continue;
			}
			gma_animations[i].image_flip_x = _bool ? -1 : 1;
		}
		return;
	}
	gma_animations[_track].image_flip_x = _bool ? -1 : 1;
}

function animation_flip_y(_bool, _track = 0){
    __animation_error_checks
    if !is_bool(_bool) show_error($"GM Animate: argument _bool ({_bool}) in `animation_set_flip_x` should be a *boolean*", true)
    
    if _track == all {
		for (var i = 0, _len = array_length(gma_animations); i < _len; ++i) {
		    if gma_animations[i] == 0 {
				continue;
			}
			gma_animations[i].image_flip_y = _bool ? -1 : 1;
		}
		return;
	}
	gma_animations[_track].image_flip_y = _bool ? -1 : 1;
}
function animation_is_flip_y(_track = 0){
    __animation_error_checks
    
	return gma_animations[_track].image_flip_y == -1;
}
function animation_is_flip_x(_track = 0){
    __animation_error_checks
    
	return gma_animations[_track].image_flip_x == -1;
}
function animation_set_flip_x(_value, _track = 0){
    __animation_error_checks
    
    if !(_value == 1 || _value == -1) show_error($"GM Animate: argument _value ({_value}) in `animation_set_flip_x` isn't valid. It should be `1` or `-1`", true)
    
    if _track == all {
		for (var i = 0, _len = array_length(gma_animations); i < _len; ++i) {
		    if gma_animations[i] == 0 {
				continue;
			}
			gma_animations[i].image_flip_x = _value;
		}
		return;
	}
	gma_animations[_track].image_flip_x = _value;
}

function animation_set_flip_y(_value, _track = 0){
    
    if !(_value == 1 || _value == -1) show_error($"GM Animate: argument _value ({_value}) in `animation_set_flip_x` isn't valid. It should be `1` or `-1`", true)
    
    if _track == all {
		for (var i = 0, _len = array_length(gma_animations); i < _len; ++i) {
		    if gma_animations[i] == 0 {
				continue;
			}
			gma_animations[i].image_flip_y = _value;
		}
		return;
	}
	gma_animations[_track].image_flip_y = _value;
}
function animation_get_flip_x(_track = 0){
    __animation_error_checks
	
	return gma_animations[_track].image_flip_x;
}
function animation_get_flip_y(_track = 0){
    __animation_error_checks
	
	return gma_animations[_track].image_flip_y;
}

/// @desc Sets a variable for the specified track. Can be used to set a variable for all tracks at once.
/// Intended use is with built in variables, such as "image_angle", "image_xscale", etc.
/// @param {String} _variable_name The variable to change, as a string. 
/// @param {Any} _value The value to set the variable to.
/// @param {Real} _track The track to set. Pass `all` to set all tracks at once.
function animation_set_variable(_variable_name, _value, _track = 0) {
	__animation_error_checks
	
	if _track == all {
		for (var i = 0, _len = array_length(gma_animations); i < _len; ++i) {
		    if gma_animations[i] == 0 {
				continue;
			}
			gma_animations[i][$ _variable_name] = _value;
		}
		return;
	}
	gma_animations[_track][$ _variable_name] = _value;
}

/// @desc Sets looping for the animation on the specified track. 
/// @param {Bool} _loop Whether to loop or stop looping.
/// @param {Real} _track The track to set. Pass `all` to set all tracks at once.
function animation_set_looping(_loop, _track = 0) {
	__animation_error_checks
	if _track == all {
		for (var i = 0, _len = array_length(gma_animations); i < _len; ++i) {
			if gma_animations[i] == 0 {
				continue;
			}
			gma_animations[i].loop = _pause;	
		}
		return;
	}
	gma_animations[_track].loop = _loop;
}

/// @desc Checks if the specified track is looping or not.
/// @param {Real} _track The track to check.
/// @return {Bool} Whether the specified track is currently looping or not.
function animation_get_looping(_track = 0) {
	__animation_error_checks
	
	return gma_animations[_track].loop;
}

/// @desc Returns the width of the animation, image_xscale factored in. Equivalent to GM's built in sprite_width.
/// @param {Real} _track The track to get the width of.
function animation_get_sprite_width(_track = 0) {
	__animation_error_checks
	
	var _anim = gma_animations[_track];
	return sprite_get_width(_anim.sprite_index)*abs(_anim.image_xscale);
}

/// @desc Returns the height of the animation, image_yscale factored in. Equivalent to GM's built in sprite_height.
/// @param {Real} _track The track to get the height of.
function animation_get_sprite_height(_track = 0) {
	__animation_error_checks
	
	var _anim = gma_animations[_track];
	return sprite_get_height(_anim.sprite_index)*abs(_anim.image_yscale);
}