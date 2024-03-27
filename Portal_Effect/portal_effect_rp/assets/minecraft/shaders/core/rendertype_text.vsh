#version 150

#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;
uniform sampler2D Sampler0;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;
uniform int FogShape;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
        

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    

    if(Color.x == 253/255.){
        if(gl_VertexID == 4){
            gl_Position.x = -1;
            gl_Position.y = 1;
        }
        if(gl_VertexID == 5){
            gl_Position.x = -1;
            gl_Position.y = -1;
        }
        if(gl_VertexID == 6){
            gl_Position.x = 1;
            gl_Position.y = -1;
        }
        if(gl_VertexID == 7){
            gl_Position.x = 1;
            gl_Position.y = 1;
        }

        vertexColor = vec4(vec3(1.0,1.0,1.0),vertexColor.a);
    }
    if(Color.x == 63/255.)
        gl_Position *= 0;
}