
function animation_shader_flash(_label, _duration, _color, _shader, _priority = 10, _mix = 0, _on_finish = undefined, _remove = false, _track = 0) {
	__animation_error_checks
	if _track == all {
		for (var i = 0, _len = array_length(animations); i < _len; ++i) {
		    if animations[i] == 0 {
				continue;
			}
			__animation_shader_remove("flash", _label, i)
			array_push(animations[i].shaders, new __animation_shader_flash(_label, _duration, _color, _shader, _priority, _mix, _on_finish, _remove, i));
			array_sort(animations[i].shaders, function(a, b) {
                return a.priority - b.priority;
            });
			
		}
		return;
	}
	__animation_shader_remove("flash", _label, _track)
	array_push(animations[_track].shaders, new __animation_shader_flash(_label, _duration, _color, _shader, _priority, _mix, _on_finish, _remove, _track));
	array_sort(animations[_track].shaders, function(a, b) {
        return a.priority - b.priority;
    });
	
}

function animation_shader_cancel(_name, _label = undefined, _track = 0) {
	__animation_error_checks;
	if _track == all {
		for (var i = 0, _len = array_length(animations); i < _len; i++;) {
			if animations[i] == 0 {
				continue;	
			}
			__animation_shader_remove(_name, _label, _track);
		}
		return;
	}
	__animation_shader_remove(_name, _label, _track);
}