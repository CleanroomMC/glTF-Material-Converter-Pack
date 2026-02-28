uniform int u_width;
uniform int u_height;

uniform sampler2D u_baseColorTexture;
uniform sampler2D u_metallicRoughnessTexture;
uniform sampler2D u_emissiveTexture;

uniform vec4 u_baseColorFactor;
uniform float u_metallicFactor;
uniform float u_roughnessFactor;
uniform vec3 u_emissiveFactor;

void main() {
	vec4 baseColor = texture2D(u_baseColorTexture, vec2(gl_FragCoord.x / float(u_width), gl_FragCoord.y / float(u_height))) * u_baseColorFactor;
	vec4 metallicRoughness = texture2D(u_metallicRoughnessTexture, vec2(gl_FragCoord.x / float(u_width), gl_FragCoord.y / float(u_height)));
	vec4 emissive = texture2D(u_emissiveTexture, vec2(gl_FragCoord.x / float(u_width), gl_FragCoord.y / float(u_height)));
	
	vec3 f0 = mix(vec3(0.04), baseColor.xyz, metallicRoughness.z * u_metallicFactor);
	float f0Average = (f0.x + f0.y + f0.z) / 3.0;
	float smoothness = 1.0 - metallicRoughness.y * u_roughnessFactor;
	float luminance = dot(emissive.xyz * u_emissiveFactor, vec3(0.299, 0.587, 0.114));
	
	gl_FragColor = vec4(smoothness, f0Average * (229.0 / 255.0), 0.0, luminance * (254.0 / 255.0));
}