length *= 8

direction += offset

depth = -100



s_emit = audio_emitter_create();
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_falloff(s_emit, 8, 256, 1);
audio_play_sound_on(s_emit, snd_saw, true, 10);