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
    float ScreenRatio = ScreenSize.x * ProjMat[0][0] * 0.5;
    float ScreenRatio_txt = ScreenSize.y/ScreenSize.x;

	ivec2 texSize = textureSize(Sampler0, 0); // get texture size
    float pixelX = (1.0/texSize.x) / 2.0;
    float pixelY = (1.0/texSize.y) / 2.0;
    


    if(gl_Position.y > -0.5 && gl_Position.y < 0.85 && gl_Position.x > 0.0 && gl_Position.x <= 1.1 && Position.z == 0.0) {
		//gl_Position.x = 2; // Debugger
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
        gl_Position.x = .1*ScreenRatio_txt; 
        gl_Position.y = 0;   
        }
        if(gl_VertexID%4==3){
        gl_Position.x = .1*ScreenRatio_txt; 
        gl_Position.y = .1; 
        }
        gl_Position.x += Color.y*2-1;
        gl_Position.y += Color.z*2-1;
        //vertexColor = vec4(vec3(0.0,1.0,0.0),1.0);//Debugger
    }
    
    if(Color.x == 253/255. && Position.z == 0.00){
       if(gl_VertexID%4==0){
        vertexColor = vec4(vec3(1.0,1.0,1.0),1.0);//Debugger     
        }
        gl_Position.x = 0.29*texCoord0.x*ScreenRatio ;
        //gl_Position.y = texCoord0.y*ScreenRatio ;

        gl_Position.x += Color.y*2-1.03;
        gl_Position.y += Color.z*3-1.64;

        //vertexColor = vec4(vec3(1.0,1.0,1.0),1.0);//Debugger
    }
}
 