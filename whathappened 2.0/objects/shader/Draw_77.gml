
var _blur_steps = 1; //1-16
var _sigma = 5; //can't be 0

var _bloom_threshold = 0.8;
var _bloom_range = 0.3;

if !surface_exists(srf_ping) {
	srf_ping = surface_create(appW,appH)
}
if !surface_exists(srf_pong) {
	srf_pong = surface_create(appW,appH)
}

/*
var _testU = shader_get_uniform(shd_paletteSwap, "u_palette");
var _palette = [
	0.19, 0.21, 0.20,
	0.34, 0.09, 0.30,
	0.51, 0.05, 0.24,
	0.72, 0.20, 0.42,
	0.92, 0.39, 0.62,
	0.98, 0.72, 0.75,
	0.78, 0.85, 0.83,
	0.67, 0.85, 0.99,
	0.50, 0.72, 0.75,
	0.20, 0.38, 0.51
]

shader_set(shd_paletteSwap)
surface_set_target(application_surface)
shader_set_uniform_f_array(_testU, _palette)
	draw_surface(application_surface,0,0)
surface_reset_target()
shader_reset()*/



if bloom {
	//1st
	shader_set(shader_bloom_lum);
		shader_set_uniform_f(u_bloom_threshold, _bloom_threshold);
		shader_set_uniform_f(u_bloom_range, _bloom_range);
	
		surface_set_target(srf_ping);
			draw_surface(application_surface, 0, 0);
		surface_reset_target();

	//2nd - blur horizontal
	gpu_set_tex_filter(true);
	shader_set(shader_blur)
		shader_set_uniform_f(u_blur_steps, _blur_steps)
		shader_set_uniform_f(u_sigma, _sigma)
		shader_set_uniform_f(u_blur_vector, 1,0)
		shader_set_uniform_f(u_texel_size, texel_w, texel_h)
	
		surface_set_target(srf_pong)
			draw_surface(srf_ping, 0, 0);
		surface_reset_target();

	//3rd - blur vertical
		shader_set_uniform_f(u_blur_vector, 0,1)
	
		surface_set_target(srf_ping)
			draw_surface(srf_pong, 0, 0);
		surface_reset_target();
	
	gpu_set_tex_filter(false);


	shader_reset();
}


draw_surface_stretched(application_surface,0,0,guiW,guiH)
//draw_surface(application_surface,0,0)
if bloom {
	gpu_set_blendmode(bm_add)
	draw_surface_stretched(srf_ping,0,0,guiW,guiH)
	gpu_set_blendmode(bm_normal)
}