shader_type canvas_item;

uniform float res = 400;

void fragment() {
	vec2 grid_uv = UV * 0.95;
	vec4 tex = texture(TEXTURE, grid_uv);
	COLOR = tex;
}
