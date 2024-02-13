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
uniform int FogShape;
uniform vec2 ScreenSize;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
        


void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    float VertexID = floor((0.9+gl_VertexID)/4);
    //Get Screen ratio
    float ScreenRatio = ScreenSize.y/ScreenSize.x ;

    //float GUIScale_x = ScreenSize.x * ProjMat[0][0] * 0.5 ;
    //float GUIScale_y = ScreenSize.y * ProjMat[0][0] * 0.5 ;

    if(gl_Position.y > -0.5 && gl_Position.y < 0.85 && gl_Position.x > 0.0 && gl_Position.x <= 1.1 && Position.z == 0.0) {
		gl_Position.x = 2; // Debugger
    }
    if(Color.x == 254/255. && Position.z == 0.00){
        if(gl_VertexID%4==0){
        gl_Position.x = 0;
        gl_Position.y = .1;       
        }
        if(gl_VertexID%4==1){
        gl_Position.x = 0;    
        gl_Position.y = 0;   
        }
        if(gl_VertexID%4==2){
        gl_Position.x = .1*ScreenRatio; 
        gl_Position.y = 0;   
        }
        if(gl_VertexID%4==3){
        gl_Position.x = .1*ScreenRatio; 
        gl_Position.y = .1; 
        }
        gl_Position.x += Color.y*2-1;
        gl_Position.y += Color.z*2-1;
        //vertexColor = vec4(vec3(0.0,1.0,0.0),1.0);//Debugger
    }
	ivec2 texSize = textureSize(Sampler2, 0); // get texture size
    float s = .01;
    if(Color.x == 253/255. && Position.z == 0.00){

        if(gl_VertexID%4==0){
        gl_Position.x = 0;
        gl_Position.y = s*texSize.y;       
        }
        if(gl_VertexID%4==1){
        gl_Position.x = 0;    
        gl_Position.y = 0;   
        }
        if(gl_VertexID%4==2){
        gl_Position.x = s*texSize.x*ScreenRatio; 
        gl_Position.y = 0;   
        }
        if(gl_VertexID%4==3){
        gl_Position.x = s*texSize.x*ScreenRatio; 
        gl_Position.y = s*texSize.y; 
        }
        gl_Position.x += Color.y*2-1;
        gl_Position.y += Color.z*2-1;
        //vertexColor = vec4(vec3(0.0,1.0,0.0),1.0);//Debugger
    }
}
 