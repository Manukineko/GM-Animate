varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_color; // couleur cible
uniform float u_mix;  // 0 = normal, 1 = couleur pleine

void main() {
    vec4 base = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;

    // interpolation progressive
	if (base.a == 0.0){
		discard;
	}
	vec4 result = mix(base, u_color, clamp(u_mix, 0.0, 1.0));

	gl_FragColor = result;
	
}