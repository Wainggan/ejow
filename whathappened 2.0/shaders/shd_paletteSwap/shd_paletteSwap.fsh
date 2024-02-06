//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const int paletteLength = 10;
uniform vec3 u_palette[paletteLength];

void main()
{
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	
	
	float closest = 99999.0;
	vec3 newCol = vec3(1.0, 1.0, 1.0);
	for (int i = 0; i < paletteLength; i++) {
		float dR = col.r - u_palette[i].r;
		float dG = col.g - u_palette[i].g;
		float dB = col.b - u_palette[i].b;
		
		float d = (dR*dR) + (dG*dG) + (dB*dB);
		
		if (d < closest) {
			closest = d;
			newCol = u_palette[i];
		}
	}
	
    gl_FragColor = vec4(newCol, 1.0);
}
