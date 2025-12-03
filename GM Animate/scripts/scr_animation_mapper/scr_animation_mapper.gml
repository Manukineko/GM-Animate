///@desc set the resolver function that will be called to retrieve the sprite in the external animset.
/// The calling instance need to have the animset data from where you want to retrieve your sprites set. It can be anything as long as the resolver can find it.
///@WARNING: You need to safeguard the resolver's call yourself as GM Animate can't do it for you.
///@param {Handle} _resolver the function to call to retrieve the sprite in your animset.
///@param {Real|Struct} _scope the scope for which the resolver will be called. Default is the calling instance and it should be right for a majority of use-cases. 
///@param {Int} _track The track to set the resolver to. Use `all` to set it to all the tracks.
function animation_set_sprite_mapper(_sprite_mapper_callback, _scope = self, _track = 0){
	__animation_error_checks;
	
	if _track == all {
		for(var i = 0, _len = array_length(animations); i < _len; i++) {
			if animations[i] == 0 {
				continue;	
			}
			animations[i].mapper_get_sprite = method(_scope, _sprite_mapper_callback);
		}
	}
	animations[_track].mapper_get_sprite = method(_scope, _sprite_mapper_callback);
}

// function __animation_resolver_error(_track){
// 	if is_undefined(animations[_track].mapper_get_sprite){
// 		show_error($"GM Animate - The resolver function is undefined for track {_track}\nYou need to define it with `animation_animset_bind` first.", true);
// 	}
// }


// Customize it !
function default_sprite_mapper_get_anim(_sprite){
    if !is_string(_sprite) return _sprite
	return animlist[$ _sprite];
    return animset[$ _sprite]
    
}