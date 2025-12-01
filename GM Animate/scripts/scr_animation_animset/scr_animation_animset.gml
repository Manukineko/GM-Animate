function animation_bind_animset(_resolver, _scope = self, _track = 0){
	__animation_error_checks;
	
	if _track == all {
		for(var i = 0, _len = array_length(animations); i < _len; i++) {
			if animations[i] == 0 {
				continue;	
			}
			animations[i].__getAnim = method(_scope, _resolver);
		}
	}
	animations[_track].__getAnim = method(_scope, _resolver);
}