//feather ignore all

animation_run();


hor_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space);
key_attack = mouse_check_button_pressed(mb_left);
key_run = keyboard_check(vk_shift);
key_test = keyboard_check_pressed(ord("1"));
key_test2 = keyboard_check_pressed(ord("2"));
key_shader1 = keyboard_check_pressed(ord("3"));
key_shader2 = keyboard_check_pressed(ord("4"));
key_shader_remove = keyboard_check_pressed(ord("5"));

if key_test{
    animation_effect_pulse(120, 2, , animation_curve_bounce_twice)
	//animation_effect_color_blender(60, $98ff76, 0.3, true)
	//animation_effect_cancel("scaler")
	//animation_effect_scale(30,anim.image_xscale, anim.image_yscale , 1, 1, , ac_animation_back_out, true)
	////animation_effect_color_transition(60, c_white, c_red, , ac_animation_back_out)
	//animation_effect_blink(10, 1, , animation_curve_bounce_a_lot)
}
if key_test2{
	//animation_effect_color_blender(60, $98ff76, 0.3, true)
	//animation_effect_cancel("scaler")
	//animation_shader_flash("flash_white", 5, c_white, 0, 10)
	//animation_effect_scale(30, 1,1, 2, 2, , ac_animation_back_out, , function(){
	//	animation_shader_flash("flash_white", 10, c_white, -1, 10, , true)
	//})
	//animation_effect_color_transition(60, c_white, c_red, , ac_animation_back_out)
	//animation_effect_blink(600, 1, , animation_curve_bounce_a_lot)
}
if key_shader1{
	animation_shader_flash("flash_white", 60, c_white, 0.5, 10, , true)
}
if key_shader2{
	animation_shader_flash("flash_red", 30, c_red, 0, 11 , , true)
}
if key_shader_remove{
	animation_shader_cancel("flash")
}

state.step();

if hsp != 0 {
	anim.image_xscale = sign(hsp);
}