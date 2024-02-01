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

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    
    //I suggest looking at the default core shaders, Cloud wolfs shader tutorials and compare them to learn how this all works.

    //this asks if the colour red is 240/255 then run the movement code
    //the z position decribes the layer subtitles are on 0.06 and their shadows are on 0.00
    if(Color == vec4(240/255., Color.y, Color.z, Color.a) && Position.z == 0.06){
		    vertexColor = vec4(vec3(1.0,1.0,1.0),1.0); // Changes colour to white

        //if you want to change the bounds of the map just change the last numbers so they add up to 1 eg 0.12)+0.88
        float moveX = ((Color.y*2-1)*0.12)+0.88; //uses green for x 
        float moveY = ((Color.z*2-1)*-0.25)+0.75; //uses green for y
        gl_Position.x += moveX; 
        gl_Position.y += moveY;

  //shadows are 1/4 as bright as the colour so here I picked 240 and 60. this will work for any multiple of 4
	}else if(Color == vec4(60/255., Color.y, Color.z, Color.a) && Position.z == 0.00){
    gl_Position.y = -1;//gets rid of shadow
	}
}
