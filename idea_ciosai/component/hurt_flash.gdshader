shader_type canvas_item;

uniform float amount : hint_range(0.0, 1.0, 0.01);

void fragment() {
	COLOR.rgb = mix(COLOR.rgb,vec3(1),amount);
}