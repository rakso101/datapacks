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
uniform float GameTime;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
        
void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;

    if(Color.x == 229/255. && Position.z == 0.12){
        
        float angle = GameTime*2400;
        vec4 pos = vec4(0,0,0.12,1);

         //rotation matrix
        mat4 rotation = mat4(
        cos(angle), -sin(angle), 0.0, 0,
        sin(angle), cos(angle), 0.0, 0,
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0 );
        
        //pulse the scale passively, but also by the opacity of the text. in effect when fading in the scale is the alpha meaning it is small den gets big
        float spinner_scale = 80* ( 1 + -0.1 + (((1+sin(GameTime*1200)) /2) *.4)) * vertexColor.a;

        //define postition of vertexs based on there moduloed vertex id
        if(gl_VertexID%4==0){
        pos.x = -spinner_scale;
        pos.y = -spinner_scale;
        }
        if(gl_VertexID%4==1){
        pos.x = -spinner_scale;
        pos.y = spinner_scale;
        }
        if(gl_VertexID%4==2){
        pos.x = spinner_scale;
        pos.y = spinner_scale;
        }
        if(gl_VertexID%4==3){
        pos.x = spinner_scale;
        pos.y = -spinner_scale;
        }

        //multiplying vertex positions by the rotation matrix 
        pos = pos* rotation;

        //do default view tranform
        gl_Position = ProjMat * ModelViewMat *pos  ;
        //move spining object to the centre
        gl_Position.x += 1;
        gl_Position.y -= 1;
        
        vertexColor = vec4(vec3(1.0,1,1.0),vertexColor.a);
    }

    //starts small on fade in. spins slower, is bigger, has lower opacity
    if(Color.x == 228/255. && Position.z == 0.12){
        
        float angle = GameTime*800;
        vec4 pos = vec4(0,0,0.12,1);
        
         //rotation matrix
        mat4 rotation = mat4(
        cos(angle), -sin(angle), 0.0, 0,
        sin(angle), cos(angle), 0.0, 0,
        0.0, 0.0, 1.0, 0.0,
        0.0, 0.0, 0.0, 1.0 );

        float spinner_scale = 80* ( 1.5 + -0.1 + (((1+sin(GameTime*1200)) /2) *.4)) * vertexColor.a;

        if(gl_VertexID%4==0){
        pos.x = -spinner_scale;
        pos.y = -spinner_scale;
        }
        if(gl_VertexID%4==1){
        pos.x = -spinner_scale;
        pos.y = spinner_scale;
        }
        if(gl_VertexID%4==2){
        pos.x = spinner_scale;
        pos.y = spinner_scale;
        }
        if(gl_VertexID%4==3){
        pos.x = spinner_scale;
        pos.y = -spinner_scale;
        }

        pos = pos* rotation;

        gl_Position = ProjMat * ModelViewMat *pos  ;
        gl_Position.x += 1;
        gl_Position.y -= 1;
        
        vertexColor = vec4(vec3(1.0,1,1.0),vertexColor.a*0.4);
    }
    //starts big on fade in. does not spin
    if(Color.x == 227/255. && Position.z == 0.12){
        vertexColor.a = (vertexColor.a*3)-2;
        
        vec4 pos = vec4(0,0,0.12,1);

        float spinner_scale = 30* ( 1.5 + -0.1 + (((1+sin(GameTime*1200)) /2) *.4)) * (2- vertexColor.a);

        if(gl_VertexID%4==0){
        pos.x = -spinner_scale;
        pos.y = -spinner_scale;
        }
        if(gl_VertexID%4==1){
        pos.x = -spinner_scale;
        pos.y = spinner_scale;
        }
        if(gl_VertexID%4==2){
        pos.x = spinner_scale;
        pos.y = spinner_scale;
        }
        if(gl_VertexID%4==3){
        pos.x = spinner_scale;
        pos.y = -spinner_scale;
        }

        gl_Position = ProjMat * ModelViewMat *pos  ;
        gl_Position.x += 1;
        gl_Position.y -= 1;
        
        vertexColor = vec4(vec3(1.0,1,1.0),vertexColor.a);
    }
}

