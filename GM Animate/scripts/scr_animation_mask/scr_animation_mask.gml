/// @desc Change an animation track to a different sprite AND sprite mask without resetting effects, the animation queue, or variables.
/// The equivalent of changing sprite_index when using GameMaker's built in animation.
///@WARNING: it will change the calling instance's mask_index, image_index, image_xscale, image_yscale, and image_angle and so interfere with GM built-in animation 
/// @param {asset.GMSprite|String} _sprite The sprite asset or a string to animate.
/// @param {Real} _starting_image_index The frame to start the new animation on. Pass -1 to not change image_index and keep the frame of the previous animation.
/// @param {Bool} _loop Whether the animation should loop or not upon completion.
/// @param {Real} _track The track to change the animation on.
/// @param {Bool=true} _set_mask Update the mask_index of the instance (default is true). it will also
/// @param {asset.GMSprite=-1} _mask the sprite to use as mask. default is the same as the current sprite_index
/// @return {Struct} Animation struct
function animation_change_ext(_sprite, _starting_image_index = 0, _loop = true, _track = 0, _set_mask = false, _mask = -1) {
	__animation_error_checks

	with animations[_track] {
		if sprite_index != _sprite {
			sprite_index = _sprite;
			sprite_name = sprite_get_name(sprite_index);
			__animation_variable_setup();
			if _starting_image_index != -1 {
				image_index = _starting_image_index;
			}
		}
		if loop == false and image_speed == 0 {
			image_speed = 1;
		}
		loop = _loop;
	}
	
	if _set_mask{
		animation_set_instance_mask(_mask, _set_mask, _set_mask, _track);
	}
	
	return animations[_track];
}

/// @desc Change an animation track to a different sprite AND mask from a bound animset without resetting effects, the animation queue, or variables.
/// The equivalent of changing sprite_index when using GameMaker's built in animation.
///@WARNING: it will change the calling instance's mask_index, image_index, image_xscale, image_yscale, and image_angle and so interfere with GM built-in animation 
/// @param {Any} _sprite The sprite as the expected value the resolver function needs to return the sprite asset.
/// @param {Real} _starting_image_index The frame to start the new animation on. Pass -1 to not change image_index and keep the frame of the previous animation.
/// @param {Bool} _loop Whether the animation should loop or not upon completion.
/// @param {Real} _track The track to change the animation on.
/// @param {Bool=true} _set_mask Update the mask_index of the instance (default is true). it will also
/// @param {asset.GMSprite=-1} _mask the sprite to use as mask. default is the same as the current sprite_index
/// @return {Struct} Animation struct
function animation_animset_change_ext(_sprite, _starting_image_index = 0, _loop = true, _track = 0, _set_mask = false, _mask = -1) {
	__animation_error_checks

	if !is_undefined(animations[_track].animset_get_sprite){
		__animation_resolver_error(_track)
	}
	
	_sprite = animations[_track].animset_get_sprite(_sprite);
	
	return animation_change_ext(_sprite, _starting_image_index, _loop, _track, _set_mask, _mask);
}