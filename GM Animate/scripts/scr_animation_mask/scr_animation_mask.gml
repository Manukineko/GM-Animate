/// @desc Change an animation track to a different sprite AND sprite mask without resetting effects, the animation queue, or variables.
/// The equivalent of changing sprite_index when using GameMaker's built in animation.
///@WARNING: it will change the calling instance's mask_index, image_index, image_xscale, image_yscale, and image_angle and so interfere with GM built-in animation 
/// @param {asset.GMSprite|String} _sprite The sprite asset or a string to animate.
/// @param {Real} _starting_image_index The frame to start the new animation on. Pass -1 to not change image_index and keep the frame of the previous animation.
/// @param {Bool} _loop Whether the animation should loop or not upon completion.
/// @param {Real} _track The track to change the animation on.
/// @param {Bool=true} _set_mask Update the mask_index of the instance (default is true). it will also
/// @return {Struct} Animation struct
function animation_change_alt(_sprite, _starting_image_index = 0, _loop = true, _mask_override = undefined, _track = 0) {
	__animation_error_checks;
    
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
	
	
		//mask override code
		// whatever the mask_auto, if _mask_override is true, change the mask_index to the provided one.
		if !is_undefined(_mask_override) && asset_get_type(_mask_override) == asset_sprite{
			mask_index = _mask_override
			mask_is_overrided = true
			
			return self;
		}
		
		// but if mask override is false we check mask_auto 
		if mask_auto == true{
			//we reset the mask to the relevente selected type for the track
			switch(mask_auto_type){
				//if type is INST_SPRITE we reset the instance mask_index to instance sprite
				case GMA_MASK.INST_SPRITE:
					mask_index = -1
				break;
				// if type is SAME_SPRITE we reset the instance mask_index to the new sprite
				case GMA_MASK.SAME_SPRITE:
					mask_index = _sprite
				break;
				// if type is MASK_INDEX we reset the instance mask_index to the default track's mask index.
				case GMA_MASK.MASK_INDEX:
					mask_index = mask_default
				break;
			}
		}
	}
	//else{
		//// if the mask_index has been overrided when amask_auto is off, we set it bask to -1 (same as instance sprite, set in the IDE)
		//if mask_is_overrided == true{
			//mask_index = -1
		//}
	//}
	
	return animations[_track];
}