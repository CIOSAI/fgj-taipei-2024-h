shader_type canvas_item;

uniform vec3 overlay_color : source_color;
uniform float amount : hint_range(0.0, 1.0, 0.01);
uniform sampler2D screen_texture : hint_screen_texture;

const float REPEAT = 4.;

void fragment() {
	vec3 col;
	
	vec2 uv = SCREEN_UV;
	uv-=.5;
	uv.x/=SCREEN_PIXEL_SIZE.x/SCREEN_PIXEL_SIZE.y;
	vec2 sampler_uv=uv;
	
	float angle = fract(atan(uv.y,uv.x)/TAU);
	angle = fract(angle*REPEAT+length(uv)*10.*amount);
	sampler_uv += normalize(sampler_uv)*sin(length(sampler_uv)*10.)*amount;
	
	sampler_uv.x*=SCREEN_PIXEL_SIZE.x/SCREEN_PIXEL_SIZE.y;
	sampler_uv+=.5;
	col = texture(screen_texture, sampler_uv).rgb;
	//if(max(abs(sampler_uv.x-.5),abs(sampler_uv.y-.5))>.5) col = overlay_color;
	
	if(abs(angle-.5)*length(uv)-length(uv)+1.-amount<0.){
		col=overlay_color;
	}
	
	COLOR = vec4(col, 1);
}