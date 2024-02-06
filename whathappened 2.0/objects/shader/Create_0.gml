guiW = display_get_gui_width()
guiH = display_get_gui_height()

appW = guiW
appH = guiH


shader_bloom_lum = sh_lum;
u_bloom_threshold = shader_get_uniform(shader_bloom_lum, "bloom_threshold")
u_bloom_range = shader_get_uniform(shader_bloom_lum, "bloom_range")


shader_blur = sh_2blur;
u_blur_steps = shader_get_uniform(shader_blur, "blur_steps");
u_sigma = shader_get_uniform(shader_blur, "sigma");
u_blur_vector = shader_get_uniform(shader_blur, "blur_vector");
u_texel_size = shader_get_uniform(shader_blur, "texel_size");




texel_w = 1 / appW;
texel_h = 1 / appH;

srf_ping = -1;
srf_pong = -1;

application_surface_draw_enable(false)