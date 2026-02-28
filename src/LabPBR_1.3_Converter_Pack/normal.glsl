uniform int u_width;
uniform int u_height;

uniform sampler2D u_normalTexture;
uniform sampler2D u_occlusionTexture;

uniform float u_normalScale;
uniform float u_occlusionStrength;

void main() {
	vec4 normal = texture2D(u_normalTexture, vec2(gl_FragCoord.x / float(u_width), gl_FragCoord.y / float(u_height)));
	float occlusion = (texture2D(u_occlusionTexture, vec2(gl_FragCoord.x / float(u_width), gl_FragCoord.y / float(u_height)))).x * u_occlusionStrength;
	normal.xy *= u_normalScale;
	normal.y = 1.0 - normal.y;
	normal.z = occlusion;
	gl_FragColor = normal;
}