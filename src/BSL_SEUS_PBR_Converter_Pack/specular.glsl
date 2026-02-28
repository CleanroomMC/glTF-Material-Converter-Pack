uniform int u_width;
uniform int u_height;

uniform sampler2D u_metallicRoughnessTexture;
uniform sampler2D u_emissiveTexture;

uniform float u_metallicFactor;
uniform float u_roughnessFactor;
uniform vec3 u_emissiveFactor;

void main() {
	vec4 metallicRoughness = texture2D(u_metallicRoughnessTexture, vec2(gl_FragCoord.x / float(u_width), gl_FragCoord.y / float(u_height)));
	vec4 emissive = texture2D(u_emissiveTexture, vec2(gl_FragCoord.x / float(u_width), gl_FragCoord.y / float(u_height)));
	
	float smoothness = 1.0 - metallicRoughness.y * u_roughnessFactor;
	float luminance = dot(emissive.xyz * u_emissiveFactor, vec3(0.299, 0.587, 0.114));
	
	gl_FragColor = vec4(smoothness, metallicRoughness.z * u_metallicFactor, luminance, 0.0);
}