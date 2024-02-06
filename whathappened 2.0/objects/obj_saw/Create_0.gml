depth = -100

s_emit = audio_emitter_create();
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_falloff(s_emit, 8, 256, 2);
audio_play_sound_on(s_emit, snd_quietsaw, true, 1);