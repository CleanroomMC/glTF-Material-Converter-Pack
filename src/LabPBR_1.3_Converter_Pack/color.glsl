uniform int u_width;
uniform int u_height;

uniform sampler2D u_baseColorTexture;
uniform sampler2D u_emissiveTexture;

uniform vec4 u_baseColorFactor;
uniform vec3 u_emissiveFactor;

void main() {
	vec4 baseColor = texture2D(u_baseColorTexture, vec2(gl_FragCoord.x / float(u_width), gl_FragCoord.y / float(u_height))) * u_baseColorFactor;
	vec4 emissive = texture2D(u_emissiveTexture, vec2(gl_FragCoord.x / float(u_width), gl_FragCoord.y / float(u_height))) * vec4(u_emissiveFactor, 1.0);
	gl_FragColor = vec4(clamp(baseColor.xyz + emissive.xyz, 0.0, 1.0), baseColor.w);
}