

/**
 * @description add a Flash shader effect to the given track.
 * @param {String} _label The unique label for that shader effect. You can have multiple Flash shader effect with different label. If a Flash effect with a similar
 * label exists, it will be overrided. With different label, the Priority parameter determine which one will be active. (eg. "hit", "recovery" "drunk", etc)
 * @param {Real} _duration the duration of the Flash effect
 * @param {Constant.Color} _color the color of the flash effect
 * @param {Asset.GMShader} _shader the Flash shader Asset
 * @param {real} [_priority]=10 The priority. Higher priority are executed first.
 * @param {real} [_mix]=0 The starting value to mix the shader with the sprite. Positive number & `0`= **to** the color, negative number = **from** the color.
 * @param {Function} [_on_finish] The callback to trigger when the effect is completed.
 * @param {bool} [_remove]=false Set to true, to remove the shader from the track's shaders list to apply.
 * @param {real} [_track]=0 The track to add the shader effect to. Pass `all` to add that shader effect to all tracks.
 */
function animation_shader_flash(_label, _duration, _color, _mix = 0, _priority = 10, _on_finish = undefined, _remove = false, _track = 0) {
	__animation_error_checks
	if _track == all {
		for (var i = 0, _len = array_length(gma_animations); i < _len; ++i) {
		    if gma_animations[i] == 0 {
				continue;
			}
			__animation_shader_remove("flash", _label, i)
			array_push(gma_animations[i].shaders, new __animation_shader_flash(_label, _duration, _color, _mix, _priority, _on_finish, _remove, i));
			array_sort(gma_animations[i].shaders, function(a, b) {
                return a.priority - b.priority;
            });
			
		}
		return;
	}
	__animation_shader_remove("flash", _label, _track)
	array_push(gma_animations[_track].shaders, new __animation_shader_flash(_label, _duration, _color, _mix, _priority, _on_finish, _remove, _track));
	array_sort(gma_animations[_track].shaders, function(a, b) {
        return a.priority - b.priority;
    });
	
}


/**
 * @desc Cancel the shader effect of the type `name` corresponding to the `label`, or all shader effet of the type `name` regarding their label
 * @param {any} _name The name of the shader effect type (eg "flash")
 * @param {any} [_label] The name of the label of the shader effect `name` to cancel.
 * @param {real} [_track]=0 The track where to cancel the effect. Pass all to remove that shader effect to all tracks.
 */
function animation_shader_cancel(_name, _label = undefined, _track = 0) {
	__animation_error_checks;
	if _track == all {
		for (var i = 0, _len = array_length(gma_animations); i < _len; i++;) {
			if gma_animations[i] == 0 {
				continue;	
			}
			__animation_shader_remove(_name, _label, _track);
		}
		return;
	}
	__animation_shader_remove(_name, _label, _track);
}