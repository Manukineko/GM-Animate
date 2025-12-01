function animation_bind_animset(_resolver, _scope = self, _track = 0){
	__animation_error_checks;
	
	if _track == all {
		for(var i = 0, _len = array_length(animations); i < _len; i++) {
			if animations[i] == 0 {
				continue;	
			}
			animations[i].animset_get_sprite = method(_scope, _resolver);
		}
	}
	animations[_track].animset_get_sprite = method(_scope, _resolver);
}

function animation_animset_enable(_track = 0, _resolver = undefined, _scope = self){
	__animation_error_checks;
	
	if is_undefined(animations[_track].animset_get_sprite){
		animation_bind_animset(_resolver, _scope, _track)
	}
	
	animations[_track].use_animset = true;
	
}