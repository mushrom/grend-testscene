#version 150

attribute vec3 in_Position;
attribute vec2 texcoord;
attribute vec3 v_normal;

// exports to the fragment shader
varying vec4 f_position;
varying vec3 f_normal;
varying vec2 f_texcoord;

uniform mat4 m, v, p;
uniform mat3 m_3x3_inv_transp;
uniform mat4 v_inv;

void main(void) {
	f_normal = normalize(m_3x3_inv_transp * v_normal);
	f_texcoord = texcoord;
	f_position = m * vec4(in_Position, 1);

	gl_Position = p*v * f_position;
}
