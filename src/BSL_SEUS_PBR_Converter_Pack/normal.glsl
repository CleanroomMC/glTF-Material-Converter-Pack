uniform int u_width;
uniform int u_height;

uniform sampler2D u_normalTexture;

uniform float u_normalScale;

void main() {
	vec4 normal = texture2D(u_normalTexture, vec2(gl_FragCoord.x / float(u_width), gl_FragCoord.y / float(u_height)));
	normal.xy *= u_normalScale;
	normal.y = 1.0 - normal.y;
	gl_FragColor = normal;
}