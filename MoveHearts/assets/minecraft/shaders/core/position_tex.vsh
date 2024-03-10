#version 150

in vec3 Position;
in vec2 UV0;

uniform sampler2D Sampler0;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform vec2 ScreenSize;

out vec2 texCoord0;

vec4 getVertexColor(sampler2D Sampler, int vertexID, vec2 coords){
	ivec2 texSize = textureSize(Sampler, 0); // get texture size
	vec2 offset = vec2(0.0); // init offset
	float pixelX = (1.0/texSize.x) / 2.0; // includes the width of the texture
	float pixelY = (1.0/texSize.y) / 2.0; // includes the height of the texture
	vertexID = vertexID % 4; // every plane has 4 vertices
	switch(vertexID) {
		// when on a version below 1.19.4 use 0123 instead of 1230
		case 1: offset = vec2(-pixelX, pixelY); break;
		case 2: offset = vec2(pixelX, pixelY); break;
		case 3: offset = vec2(pixelX, -pixelY); break;
		case 0: offset = vec2(-pixelX, -pixelY); break;
		default: offset = vec2(0.0); break;
	}
	return texture(Sampler, coords - offset); // retrieve vertex's pixel
}



void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    texCoord0 = UV0;

    float ScreenRatio = ScreenSize.y/ScreenSize.x;
    float ScreenRatio_inv = ScreenSize.x/ScreenSize.y;

    vec4 color = getVertexColor(Sampler0, gl_VertexID, texCoord0); // get the color of the vertex
    if(color.a == 1.0/255.0) {
        gl_Position.x =  (gl_Position.x + .36)*1-.8; // change the *number to change scale, change the -/+number to change the position
        gl_Position.y = (gl_Position.y + .8)*1+.7;
	}

}
