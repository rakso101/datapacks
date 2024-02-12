#version 150

#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;
uniform vec2 ScreenSize;
uniform int FogShape;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    float y_ratio = ScreenSize.y/ScreenSize.x;
    float x_ratio = ScreenSize.x/ScreenSize.y;
    
//for images use red 231..250  
    if(gl_Position.y > -0.5 && gl_Position.y < 0.85 && gl_Position.x > 0.93 && gl_Position.x <= 1.1 && Position.z == 0.0) {
        gl_Position *= 0;//this removes any text on the left of the screen by crusing its position to 0
    }
    if(Color.x == 230/255. && Position.z == 0.00){
        vec2 uv = texCoord0*256;//Because the uv is based on the size of the png it scales the pixels correctly and zeros out the position
        gl_Position = (ProjMat * ModelViewMat * vec4(uv,0,1) )+vec4(1,-1,0,0); //here I times the uv by those two matrixes so it scales to the screen correctly
        gl_Position.x += (Color.y)*-.2+.8;//translate x with green channel
    	gl_Position.y += (Color.z)*(.2*x_ratio)+(1*y_ratio);//translate y with blue channel

        vertexColor = vec4(vec3(1.0,1.0,1.0),1.0);
    }
}
